<?php

include("sesion.php");

if(!$_COOKIE["sesion"]){
    header("Location: salir.php");
    exit();
}

include("conexion.php");

$id = (int)($_GET["id"] ?? 0);

$res = $conexion->query("
SELECT *
FROM inventario
WHERE id_inventario = '$id'
");

if($res->num_rows == 0){
    header("Location: inventario.php");
    exit();
}

$producto = $res->fetch_assoc();

if($producto["cantidad"] > 0){
    header("Location: inventario.php");
    exit();
}

$conexion->query("
UPDATE inventario
SET activo = 0
WHERE id_inventario = '$id'
");

header("Location: inventario.php");
exit();