<?php

include("sesion.php");

if(empty($_COOKIE["sesion"])){
    header("Location: salir.php");
    exit;
}

include("conexion.php");

try{

    $conexion->begin_transaction();

    $concepto = trim($_POST["concepto_txt"]);
    $tipo_pago = trim($_POST["tipo_pago_slc"]);

    $productos = $_POST["producto"] ?? [];
    $cantidades = $_POST["cantidad"] ?? [];
    $costos = $_POST["costo"] ?? [];

    if(empty($productos)){
        throw new Exception("Debe agregar al menos un producto");
    }

    $fecha = date("Y-m-d");
    $usuario = $_SESSION["usuario"] ?? "sistema";
    $ip = $_SERVER["REMOTE_ADDR"];

    $total_compra = 0;
    $detalles = [];

    /* ==========================
       VALIDAR DATOS
    ========================== */

    foreach($productos as $i => $id_producto){

        $cantidad = (int)$cantidades[$i];
        $costo = (float)$costos[$i];

        if($cantidad <= 0){
            throw new Exception("Cantidad inválida");
        }

        if($costo <= 0){
            throw new Exception("Costo inválido");
        }

        $res = $conexion->query("
            SELECT *
            FROM inventario
            WHERE id_inventario = '$id_producto'
        ");

        if($res->num_rows == 0){
            throw new Exception("Producto no encontrado");
        }

        $subtotal = $cantidad * $costo;

        $total_compra += $subtotal;

        $detalles[] = [
            "id_producto" => $id_producto,
            "cantidad" => $cantidad,
            "costo" => $costo,
            "subtotal" => $subtotal
        ];
    }

    /* ==========================
       CREAR COMPRA
    ========================== */

    $conexion->query("
        INSERT INTO compras
        (
            fecha,
            concepto,
            tipo_pago,
            subtotal,
            total
        )
        VALUES
        (
            '$fecha',
            '$concepto',
            '$tipo_pago',
            '$total_compra',
            '$total_compra'
        )
    ");

    $id_compra = $conexion->insert_id;

    /* ==========================
       DETALLE + INVENTARIO
    ========================== */

    foreach($detalles as $d){

        $id_producto = $d["id_producto"];
        $cantidad = $d["cantidad"];
        $costo = $d["costo"];
        $subtotal = $d["subtotal"];

        $conexion->query("
            INSERT INTO detalle_compras
            (
                id_compra,
                id_inventario,
                cantidad,
                costo_unitario,
                subtotal
            )
            VALUES
            (
                '$id_compra',
                '$id_producto',
                '$cantidad',
                '$costo',
                '$subtotal'
            )
        ");

        /* aumentar stock */

        $conexion->query("
            UPDATE inventario
            SET cantidad = cantidad + $cantidad,
                costo = '$costo'
            WHERE id_inventario = '$id_producto'
        ");
    }

    /* ==========================
       NUMERO TRANSACCION
    ========================== */

    $res = $conexion->query("
        SELECT IFNULL(MAX(transaccion),0)+1 AS t
        FROM registro
    ");

    $fila = $res->fetch_assoc();

    $transaccion = $fila["t"];

    /* ==========================
       CUENTA A ACREDITAR
    ========================== */

    $cuenta_haber = "1.1"; // Caja

    if($tipo_pago == "CREDITO"){
        $cuenta_haber = "2.1"; // Proveedores
    }

    /* ==========================
       DEBE INVENTARIO
    ========================== */

    $conexion->query("
        INSERT INTO registro
        (
            fecha,
            transaccion,
            tipo,
            cuenta,
            concepto,
            debe,
            haber,
            descripcion,
            usuario_creacion,
            ip
        )
        VALUES
        (
            '$fecha',
            '$transaccion',
            'COMPRA',
            '1.3',
            '$concepto',
            '$total_compra',
            0,
            'Ingreso de mercadería',
            '$usuario',
            '$ip'
        )
    ");

    /* ==========================
       HABER CAJA O PROVEEDORES
    ========================== */

    $conexion->query("
        INSERT INTO registro
        (
            fecha,
            transaccion,
            tipo,
            cuenta,
            concepto,
            debe,
            haber,
            descripcion,
            usuario_creacion,
            ip
        )
        VALUES
        (
            '$fecha',
            '$transaccion',
            'COMPRA',
            '$cuenta_haber',
            '$concepto',
            0,
            '$total_compra',
            'Registro de compra',
            '$usuario',
            '$ip'
        )
    ");

    $conexion->commit();

    header("Location: registrar-compras.php?error=no&mensaje=Compra registrada correctamente");
    exit;

}catch(Exception $e){

    $conexion->rollback();

    header(
        "Location: registrar-compras.php?error=si&mensaje="
        . urlencode($e->getMessage())
    );

    exit;
}
?>