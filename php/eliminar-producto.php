<?php

include("sesion.php");

if(!$_COOKIE["sesion"]){
    header("Location: salir.php");
}

include("conexion.php");

if(isset($_GET["id"])){

    $id = $_GET["id"];

    $consulta = "
    DELETE FROM Inventario
    WHERE id_inventario='$id'
    ";

    $conexion->query($consulta);
    
    
}

header("Location: inventario.php");

?>