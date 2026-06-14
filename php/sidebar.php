
<div class="row">
	<div class="col-sm-3">

		<?php
			if(!isset($conexion)){
				include("conexion.php");
			}
			$usuario = $_SESSION["usuario"];
        	$consulta = "SELECT * FROM usuario WHERE usuario='$usuario'";
        	$ejecutar_consulta = $conexion->query($consulta); 
        	while($registro=$ejecutar_consulta->fetch_assoc()) 
				{
					$_SESSION["tipo"]=$registro["tipo"];
				}
			
			
			$conexion->close();
		?>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title text-center">Cuentas T</h3>
			</div>

			<div class="panel-body" id="sb">
				<div class="list-group text-right">
					<a href="asiento-general.php" class="list-group-item">&#0171; Registrar compras</a>
					<a href="asiento-simple.php" class="list-group-item">&#0171; Registrar ventas</a>
					<a href="diario.php" class="list-group-item">&#0171; Libro Diario</a>
					<a href="mayor.php" class="list-group-item">&#0171; Libro Mayor</a>
				</div>
			</div>
		</div>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title text-center">Cuentas</h3>
			</div>

			<div class="panel-body" id="sb">
				<div class="list-group text-right">
					<a href="catalogo-cuentas.php" class="list-group-item">&#0171; Catálogo General de Cuentas</a>		            
				</div>
			</div>
		</div>

		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title text-center">Estados Financieros</h3>
			</div>

			<div class="panel-body" id="sb">
				<div class="list-group text-right">
					<a href="balance-comprobacion.php" class="list-group-item">&#0171; Balance de Comprobación</a>
					<a href="estado-resultados.php" class="list-group-item">&#0171; Estado de Resultados</a>
					<a href="balance-general.php" class="list-group-item">&#0171; Balance General</a>
				</div>
			</div>
		</div>

	</div>
</div>