<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Registro Familiar</title>
	<link rel="stylesheet" href="./../css/bootstrap.css">
	<link rel="stylesheet" href="../css/retoques.css">
	<script src="./../js/jquery.min-1.7.1-google.js"></script>
	<script src="./../js/bootstrap-2.0.2.js"></script>
</head>
<body style="background:url(./../img/bg.jpg) center top fixed ">
	<header class="well row-fluid" style="background:url(../img/banner_rf.png) no-repeat;" >
	</header>
	<div class="navbar">
		<div class="navbar-inner" >
			<div class="container">
				<a class="brand" href="index_registrofamiliar.php"><i class="icon-home icon-white"></i></a>
				<div class="nav-collapse">
					<ul class="nav">
						<li class="divider-vertical">
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Registro<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<!-- <li class="nav-header">Persona</li>
								<li><a href="persona/form_persona.php" target="formulario" onclick="getElementById('formulario').height='800px'"><i class="icon-list-alt"></i> Persona</a></li> -->
								<li class="nav-header">Partidas</li>
								<li><a href="nacimiento/form_nacimiento_partida.php" target="formulario" onclick="getElementById('formulario').height='1200px'"><i class="icon-list-alt"></i> Nacimiento<!--  (formato nuevo) --></a></li>
								<!-- <li><a href="nacimiento/form_nacimiento_partida2.php" target="formulario" onclick="getElementById('formulario').height='1075px'"><i class="icon-list-alt"></i> Nacimiento (formato antiguo)</a></li> -->
								<li><a href="matrimonio/form_matrimonio_partida.php" target="formulario" onclick="getElementById('formulario').height='1200px'"><i class="icon-list-alt"></i> Matrimonio</a></li>
								<li><a href="divorcio/form_divorcio_partida.php" target="formulario" onclick="getElementById('formulario').height='1200px'"><i class="icon-list-alt"></i> Divorcio</a></li>
								<li><a href="defuncion/form_defuncion_partida.php" target="formulario" onclick="getElementById('formulario').height='1200px'"><i class="icon-list-alt"></i> Defunci&oacute;n</a></li>
								<!-- <li class="nav-header">Marginaciones</li>
								<li><a href="nacimiento/cons_nacimiento_partida_marginacion.php" target="formulario" onclick="getElementById('formulario').height='575px'"><i class="icon-edit"></i> Nacimiento</a></li>
								<li><a href="matrimonio/form_marginacion_matrimonio.php" target="formulario" onclick="getElementById('formulario').height='575px'"><i class="icon-edit"></i> Matrimonio</a></li>
								-->
								<li class="nav-header">Actas</li>
								<li><a href="matrimonio/form_matrimonio_acta.php" target="formulario" onclick="getElementById('formulario').height='1200px'"><i class="icon-list-alt"></i> Matrimonio</a></li>			
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:white;text-shadow:0 1px 0 black">Consultas<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="nav-header">Partidas</li>
								<li><a href="consultas/cons_nacimiento_partida.php" target="formulario" onclick="getElementById('formulario').height='1000px'"><i class="icon-search"></i> Nacimientos</a></li>
								<li><a href="consultas/cons_matrimonio_partida.php" target="formulario" onclick="getElementById('formulario').height='1200px'"><i class="icon-search"></i> Matrimonios</a></li>
								<li><a href="consultas/cons_divorcio_partida.php" target="formulario" onclick="getElementById('formulario').height='1200px'"><i class="icon-search"></i> Divorcios</a></li>
								<li><a href="consultas/cons_defuncion_partida.php" target="formulario" onclick="getElementById('formulario').height='1200px'"><i class="icon-search"></i> Defunciones</a></li>
								<li class="nav-header">Actas</li>
								<li><a href="consultas/cons_matrimonio_acta.php" target="formulario" onclick="getElementById('formulario').height='1200px'"><i class="icon-search"></i> Matrimonios</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color:white;text-shadow:0 1px 0 black">Reportes<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="nav-header">Partidas</li>
								<li><a href="reportes/rep_nacimiento_partida.php" target="formulario" onclick="getElementById('formulario').height='1400px'"><i class="icon-list-alt"></i>Nacimientos</a></li>
								<li><a href="reportes/rep_matrimonio_partida.php" target="formulario" onclick="getElementById('formulario').height='1400px'"><i class="icon-list-alt"></i>Matrimonios</a></li>
								<li><a href="reportes/rep_divorcio_partida.php" target="formulario" onclick="getElementById('formulario').height='1400px'"><i class="icon-list-alt"></i>Divorcios</a></li>
								<li><a href="reportes/rep_defuncion_partida.php" target="formulario" onclick="getElementById('formulario').height='1400px'"><i class="icon-list-alt"></i>Defunciones</a></li>
								<li class="nav-header">Actas</li>
								<li><a href="reportes/rep_matrimonio_acta.php" target="formulario" onclick="getElementById('formulario').height='1400px'"><i class="icon-list-alt"></i>Matrimonios</a></li>
							</ul>
						</li>
						<li class="divider-vertical"></li>
					</ul>
					<ul class="nav pull-right">
						<li class="divider-vertical"></li>
						<li><a href="#"><i class="icon-off icon-white"></i> Cerrar Sesión</a></li>
        			</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="padding:0px; width:1024px; height:100%">
		<object type="text/php" src="" name="formulario" id="formulario" width="100%" height="100%" scrolling="no"></object>
	</div>
	<footer></footer>
</body>
</html>