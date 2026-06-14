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

    if(empty($productos)){
        throw new Exception("Debe agregar al menos un producto");
    }

    $fecha = date("Y-m-d H:i:s");
    $usuario = $_SESSION["usuario"] ?? "sistema";
    $ip = $_SERVER["REMOTE_ADDR"];

    $subtotal_general = 0;
    $costo_total = 0;

    $detalles = [];

    /* ==========================
       VALIDAR PRODUCTOS
    ========================== */

    foreach($productos as $i => $id_producto){

        $cantidad = (int)$cantidades[$i];

        if($cantidad <= 0){
            throw new Exception("Cantidad inválida");
        }

        $res = $conexion->query("
            SELECT *
            FROM inventario
            WHERE id_inventario = '$id_producto'
        ");

        if($res->num_rows == 0){
            throw new Exception("Producto no encontrado");
        }

        $producto = $res->fetch_assoc();

        if($cantidad > $producto["cantidad"]){
            throw new Exception(
                "Stock insuficiente para ".$producto["nombre"]
            );
        }

        $precio = $producto["precio"];
        $costo = $producto["costo"];

        $subtotal = $precio * $cantidad;
        $costo_producto = $costo * $cantidad;

        $subtotal_general += $subtotal;
        $costo_total += $costo_producto;

        $detalles[] = [
            "id_producto" => $id_producto,
            "cantidad" => $cantidad,
            "precio" => $precio,
            "subtotal" => $subtotal,
            "costo" => $costo_producto
        ];
    }

    /* ==========================
       CREAR VENTA
    ========================== */

    $conexion->query("
        INSERT INTO ventas
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
            '$subtotal_general',
            '$subtotal_general'
        )
    ");

    $id_venta = $conexion->insert_id;

    /* ==========================
       DETALLE + INVENTARIO
    ========================== */

    foreach($detalles as $d){

        $id_producto = $d["id_producto"];
        $cantidad = $d["cantidad"];
        $precio = $d["precio"];
        $subtotal = $d["subtotal"];

        $conexion->query("
            INSERT INTO detalle_ventas
            (
                id_venta,
                id_inventario,
                cantidad,
                precio_unitario,
                subtotal
            )
            VALUES
            (
                '$id_venta',
                '$id_producto',
                '$cantidad',
                '$precio',
                '$subtotal'
            )
        ");

        $conexion->query("
            UPDATE inventario
            SET cantidad = cantidad - $cantidad
            WHERE id_inventario = '$id_producto'
        ");
    }

    /* ==========================
       TRANSACCION CONTABLE
    ========================== */

    $res = $conexion->query("
        SELECT IFNULL(MAX(transaccion),0)+1 AS t
        FROM registro
    ");

    $f = $res->fetch_assoc();

    $transaccion = $f["t"];

    $cuenta_debe = "1.1"; // Caja

    if($tipo_pago == "CREDITO"){
        $cuenta_debe = "1.5";
    }

    /* ==========================
       DEBE (Caja o CxC)
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
            'VENTA',
            '$cuenta_debe',
            '$concepto',
            '$subtotal_general',
            0,
            'Venta registrada',
            '$usuario',
            '$ip'
        )
    ");

    /* ==========================
       HABER (Ventas)
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
            'VENTA',
            '4.1',
            '$concepto',
            0,
            '$subtotal_general',
            'Ingreso por ventas',
            '$usuario',
            '$ip'
        )
    ");

    /* ==========================
       DEBE (Costo ventas)
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
            'VENTA',
            '5.1',
            '$concepto',
            '$costo_total',
            0,
            'Costo de mercadería vendida',
            '$usuario',
            '$ip'
        )
    ");

    /* ==========================
       HABER (Inventario)
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
            'VENTA',
            '1.3',
            '$concepto',
            0,
            '$costo_total',
            'Salida de inventario',
            '$usuario',
            '$ip'
        )
    ");

    $conexion->commit();

   header("Location: registrar-ventas.php?error=no&mensaje=Venta registrada correctamente");
exit;

}catch(Exception $e){

    $conexion->rollback();

   header(
    "Location: registrar-ventas.php?error=si&mensaje="
    . urlencode($e->getMessage())
);
exit;

}
?>