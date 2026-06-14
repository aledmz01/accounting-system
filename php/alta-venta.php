<?php
include("sesion.php");

if(!$_COOKIE["sesion"]){
	header("Location: salir.php");
}

$venta = $_POST["venta_txt"];
$fecha = $_POST["fecha_txt"];
$concepto = $_POST["concepto_txt"];
$pago = $_POST["pago_slc"];
$importe = $_POST["importe_txt"];
$descripcion = $_POST["exp_txa"];
$usuario = $_SESSION["usuario"];

if(!isset($conexion)){
	include("conexion.php");
}

/* =========================
   1. Obtener último asiento
========================= */

$sql = "SELECT transaccion FROM registro ORDER BY id DESC LIMIT 1";
$res = $conexion->query($sql);

if($res->num_rows > 0){
	$row = $res->fetch_assoc();
	$transaccion = $row["transaccion"] + 1;
} else {
	$transaccion = 1;
}

/* =========================
   2. Cuentas fijas
========================= */

$cuenta_caja = "1.1";
$cuenta_ventas = "4.1";

/* =========================
   3. IP
========================= */

$ip = $_SERVER["HTTP_CLIENT_IP"];
if(!$ip){
	$ip = $_SERVER["REMOTE_ADDR"];
}

/* =========================
   4. INSERT DEBE (Caja)
========================= */

$sql1 = "INSERT INTO registro
(fecha, transaccion, tipo, cuenta, concepto, debe, haber, descripcion, usuario_creacion, ip)
VALUES
('$fecha', '$transaccion', 'venta', '$cuenta_caja', '$concepto', '$importe', 0, '$descripcion', '$usuario', '$ip')";

$ok1 = $conexion->query($sql1);

/* =========================
   5. INSERT HABER (Ventas)
========================= */

$sql2 = "INSERT INTO registro
(fecha, transaccion, tipo, cuenta, concepto, debe, haber, descripcion, usuario_creacion, ip)
VALUES
('$fecha', '$transaccion', 'venta', '$cuenta_ventas', '$concepto', 0, '$importe', '$descripcion', '$usuario', '$ip')";

$ok2 = $conexion->query($sql2);

/* =========================
   6. RESPUESTA
========================= */

if($ok1 && $ok2){
	$mensaje = "Venta registrada correctamente.";
	header("Location: registrar-ventas.php?mensaje=$mensaje&error=no");
} else {
	$mensaje = "Error al registrar la venta.";
	header("Location: registrar-ventas.php?mensaje=$mensaje&error=si");
}
?>