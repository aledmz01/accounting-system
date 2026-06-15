<?php

include("sesion.php");

if(!$_COOKIE["sesion"]){
    header("Location: salir.php");
    exit();
}

include("conexion.php");

$id = (int)($_GET["id"] ?? 0);

$consulta = "
SELECT *
FROM inventario
WHERE id_inventario = '$id'
";

$resultado = $conexion->query($consulta);

if($resultado->num_rows == 0){
    header("Location: inventario.php");
    exit();
}

$producto = $resultado->fetch_assoc();

if($_POST){

    $nombre = trim($_POST["nombre"]);
    $costo = (float)$_POST["costo"];
    $precio = (float)$_POST["precio"];

    
    if($precio <= $costo){

    echo "
    <script>
        alert('El precio de venta debe ser mayor que el costo unitario.');
        history.back();
    </script>
    ";

    exit();
}

    $conexion->query("
        UPDATE inventario
        SET
            nombre = '$nombre',
            costo = '$costo',
            precio = '$precio'
        WHERE id_inventario = '$id'
    ");

    header("Location: inventario.php");
    exit();
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
                    required
                    value="<?php echo htmlspecialchars($producto["nombre"]); ?>"
                >
            </div>

            <div class="form-group">
                <label>Precio de Venta ($)</label>
                <input
                    type="number"
                    step="0.01"
                    min="0"
                    name="precio"
                    class="form-control"
                    required
                    value="<?php echo $producto["precio"]; ?>"
                >
                            <small class="text-info">
El precio de venta debe ser mayor que el costo unitario.
</small>
            </div>


            <div class="form-group">
                <label>Cantidad en Inventario</label>
                <input
                    type="number"
                    class="form-control"
                    value="<?php echo $producto["cantidad"]; ?>"
                    readonly
                >
            </div>

            <div class="form-group">
                <label>Costo Unitario $</label>
                <input
                    type="number"
                    step="0.01"
                    min="0"
                    name="costo"
                    class="form-control"
                    required
                    value="<?php echo $producto["costo"]; ?>"
                >
            </div>

            <br>

            <button class="btn btn-warning">
                Guardar Cambios
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