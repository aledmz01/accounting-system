<?php
/*~ Archivo control.php
.---------------------------------------------------------------------------.
|    Software: CAS - Computerized Accountancy System                        |
|     Versión: 1.0                                                          |
|   Lenguajes: PHP, HTML, CSS3 y Javascript                                 |
| ------------------------------------------------------------------------- |
|   Autores: Eileen Dimas                                         |
| Copyright (C) 2026, FIA-UES. Todos los derechos reservados.               |
| ------------------------------------------------------------------------- |
|                                                                           |
| Este archivo es parte del sistema de contabilidad C.A.S para la cátedra   |
| de Sistemas Contables de la Facultad de Ingeniería y Arquitectura de la   |
| Universidad de El Salvador.                                               |
|                                                                           |
'---------------------------------------------------------------------------'
*/
?>
<?php 
include("conexion.php");

session_start(); // mejor al inicio

$usuario = $_POST["user_txt"];
$password = $_POST["password_txt"];

$consulta = "SELECT * FROM usuario 
             WHERE usuario='$usuario' 
             AND password='$password'";

$ejecutar_consulta = $conexion->query($consulta);

if($ejecutar_consulta->num_rows > 0)
{
    $_SESSION["autentificado"] = true;
    $_SESSION["usuario"] = $usuario;

    setcookie("sesion", "1", time()+3600, "/");

    header("Location: home.php");
    exit;
}
else
{
    header("Location: ../index.php?error=si");
    exit;
}
?>