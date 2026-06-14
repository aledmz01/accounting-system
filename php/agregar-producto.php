<?php

include("sesion.php");

if(!$_COOKIE["sesion"]){
    header("Location: salir.php");
}

include("conexion.php");

if($_POST){

    $nombre = $_POST["nombre"];
    $precio = $_POST["precio"];

    $consulta = "
    INSERT INTO Inventario
    (
        nombre,
        cantidad,
        precio
    )
    VALUES
    (
        '$nombre',
        0,
        '$precio'
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