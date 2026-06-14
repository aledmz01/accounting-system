<?php

include("sesion.php");

if(!$_COOKIE["sesion"]){
    header("Location: salir.php");
}

include("conexion.php");

$id = $_GET["id"];

$consulta = "
SELECT *
FROM Inventario
WHERE id_inventario='$id'
";

$resultado = $conexion->query($consulta);
$producto = $resultado->fetch_assoc();

if($_POST){

    $nombre = $_POST["nombre"];
    $cantidad = $_POST["cantidad"];
    $precio = $_POST["precio"];

    $actualizar = "
    UPDATE Inventario
    SET
        nombre='$nombre',
        cantidad='$cantidad',
        precio='$precio'
    WHERE
        id_inventario='$id'
    ";

    $conexion->query($actualizar);

    header("Location: inventario.php");
}

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Editar Producto</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/estilos.css">
</head>

<body>

<?php include("nav.php"); ?>

<div class="container">

    <div class="page-header">
        <h3>Editar Producto</h3>
    </div>

    <div class="well">

        <form method="POST">

            <div class="form-group">
                <label>Nombre del Producto</label>

                <input
                    type="text"
                    name="nombre"
                    class="form-control"
                    value="<?php echo $producto['nombre']; ?>"
                    required>
            </div>

            <div class="form-group">
                <label>Cantidad</label>

                <input
                    type="number"
                    name="cantidad"
                    class="form-control"
                    value="<?php echo $producto['cantidad']; ?>"
                    required>
            </div>

            <div class="form-group">
                <label>Precio</label>

                <input
                    type="number"
                    step="0.01"
                    name="precio"
                    class="form-control"
                    value="<?php echo $producto['precio']; ?>"
                    required>
            </div>

            <br>

            <button class="btn btn-warning">
                Actualizar Producto
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