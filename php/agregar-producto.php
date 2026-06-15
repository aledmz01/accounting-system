<?php

include("sesion.php");

if(!$_COOKIE["sesion"]){
    header("Location: salir.php");
}

include("conexion.php");

if($_POST){

    $nombre = $_POST["nombre"];
    $costo = $_POST["costo"];
    $precio = $_POST["precio"];

    if($precio <= $costo){

    echo "
    <script>
        alert('El precio de venta debe ser mayor que el costo unitario.');
        history.back();
    </script>
    ";

    exit();
}

    $consulta = "
    INSERT INTO Inventario
    (
        nombre,
        cantidad,
         costo,
        precio,
        activo
    )
    VALUES
    (
        '$nombre',
        0,
        '$costo',
        '$precio',
        1
    )
    ";

    $conexion->query($consulta);

    header("Location: inventario.php");
    exit();
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Agregar Producto</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/estilos.css">
</head>

<body>

<?php include("nav.php"); ?>

<div class="container">

    <div class="page-header">
        <h3>Agregar Producto</h3>
    </div>

    <div class="well">

        <div class="alert alert-info">
            Los productos se crean con <strong>0 existencias</strong>.
            Las existencias se actualizarán automáticamente mediante las compras y ventas.
        </div>

        <form method="POST">

            <div class="form-group">
                <label>Nombre del Producto</label>
                <input
                    type="text"
                    name="nombre"
                    class="form-control"
                    required>
            </div>

            <div class="form-group">
                <label>Precio de Venta ($)</label>
                <input
                    type="number"
                    step="0.01"
                    name="precio"
                    class="form-control"
                    min="0"
                    required>

                    <small class="text-info">
El precio de venta debe ser mayor que el costo unitario.
</small>
            </div>
            

            <div class="form-group">
    <label>Costo Unitario ($)</label>
    <input
        type="number"
        step="0.01"
        name="costo"
        class="form-control"
        min="0"
        required>
</div>

            <br>

            <button class="btn btn-success">
                Guardar Producto
            </button>

            <a href="inventario.php" class="btn btn-default">
                Cancelar
            </a>

        </form>

    </div>

</div>

<script src="../js/bootstrap.min.js"></script>

</body>
</html>