
<div class="navbar navbar-inverse navbar-static-top">
	<div class="container">
		<a href="home.php" class="navbar-brand">Mini Market el ahorro &#0153;</a>
		<button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>

		<div class="collapse navbar-collapse navHeaderCollapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="home.php"><span class="glyphicon glyphicon-home"></span> &nbsp;Inicio</a></li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Cuentas T <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="asiento-general.php"> ● &nbsp;Registrar compras</a></li>
						<li><a href="asiento-simple.php"> ● &nbsp;Registrar ventas </a></li>
						<li class="divider"></li>
						<li><a href="diario.php"> ● &nbsp;Diario General</a></li>
						<li><a href="mayor.php"> ● &nbsp;Mayor General</a></li>
						<li class="divider"></li>
					</ul>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Cuentas <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li class="divider"></li>
						<li><a href="catalogo-cuentas.php">● &nbsp;Catálogo General de Cuentas</a></li>
					</ul>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Estados Financieros <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="balance-comprobacion.php"> ● &nbsp;Balance de Comprobación</a></li>
						<li><a href="balance-general.php"> ● &nbsp;Balance General</a></li>

					</ul>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Acerca <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#acerca" data-toggle="modal"><span class="glyphicon glyphicon-info-sign"></span> &nbsp;Acerca de Mini Market el ahorro</a></li>
						<li><a href="#creditos" data-toggle="modal"><span class="glyphicon glyphicon-flash"></span>&nbsp; Sobre los programadores</a></li>
					</ul>
				</li>
					
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="text-transform:capitalize">
						<span class="glyphicon glyphicon-user"></span> &nbsp;<?php echo $_SESSION['usuario']; ?> 
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="cambio-pw.php"><span class="glyphicon glyphicon-lock"></span> &nbsp;Cambiar Contraseña</a></li>
						<li><a href="#logout" data-toggle="modal"><span class="glyphicon glyphicon-log-out"></span> &nbsp;Cerrar sesión</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>