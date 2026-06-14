<?php
/*~ Archivo conexion.php
.---------------------------------------------------------------------------.
|    Software: CAS - Computerized Accountancy System                        |
|     Versión: 1.0                                                          |
|   Lenguajes: PHP, HTML, CSS3 y Javascript                                 |
| ------------------------------------------------------------------------- |
|   Autores: Eileen Dimas                      |
|                               |
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
	function conectarse()
	{
		$servidor 	=	 "localhost";
		$usuario 	=	 "root";
		$password 	=	 "";
		$bd 		=	 "sic115";

		$conectar = new mysqli($servidor, $usuario, $password, $bd);

    if ($conectar->connect_error) {
        die("Error de conexión: " . $conectar->connect_error);
    }

    return $conectar;
}

$conexion = conectarse();
?>