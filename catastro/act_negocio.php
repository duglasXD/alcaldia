<?php 
	include('./../php/conexion.php');
	$conn=conectar();
	$sql="SELECT codigo,nom_cue FROM co_impuesto WHERE tip_cob='Fijo'";
	$rs=pg_query($sql);
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Actualizar Negocio</title>
	<link rel="stylesheet" href="./../css/bootstrap.css">
	<link rel="stylesheet" href="../css/retoques.css">
	<link rel="stylesheet" href="./../css/fileinput.css">
	<link rel="stylesheet" href="./../css/bootstrap-select.css">
	<script src="./../js/jquery.min-1.7.1-google.js"></script>
	<script src="./../js/bootstrap-2.0.2.js"></script>
	<script src="./../js/fileinput.js"></script>
	<script src="./../js/jquery.maskedinput.js"></script>
	<script src="./../js/funciones.js"></script>
	<script src="./../js/bootstrap-select.js"></script>
	<script src="js/act_negocio.js"></script>
</head>
<body>
	<form class="well form-horizontal" id="formulario" enctype="multipart/form-data">
		<div class="span12">
			<legend>Actualizar datos de Negocio</legend>
			<div class="span7">
				<a href="#bus_neg" data-toggle="modal" class="btn"><i class="icon-search"></i> Buscar Negocio</a>
				<br><br>
				<input type="hidden" id="cod_neg" name="cod_neg" value="<?php echo $_GET['cod_neg'] ?>">
				<div class="control-group">
					<label class="control-label">Contribuyente</label>
					<div class="controls">
						<input type="hidden" id="cod_con" name="cod_con" value="<?php echo $_GET['cod_con'] ?>">
						<input type="hidden" id="tipoPer" name="tipoPer" value="<?php echo $_GET['tip_neg'] ?>">
						<input type="text" class="span3" id="nom_per" name="nom_per" readonly>
						<a href="#bus_per" data-toggle="modal" class="btn"><i class="icon-search"></i></a>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Nombre del negocio</label>
					<div class="controls">
						<input type="text" class="span3" id="nom_neg" name="nom_neg" placeholder="del negocio o empresa">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Giro</label>
					<div class="controls">
						<select name="rub_neg" id="rub_neg">
						</select>
						<button class="btn"  href="#div_addG" data-toggle="modal"><i class="icon-plus"></i></button>
					</div>
				</div>
				
				<div class="control-group">
					<label class="control-label">Zona</label>
					<div class="controls">
						<label class="radio inline"><input type="radio" id="zon_negU" name="zon_neg" value="Urbana">Urbana</label>
						<label class="radio inline"><input type="radio" id="zon_negR" name="zon_neg" value="Rural" checked>Rural</label>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="dep">Departamento</label>
					<div class="controls">
						<select name="dep" id="dep" onChange="cargarMunicipios('dep','mun')">
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="mun">Municipio</label>
					<div class="controls">
						<select id="mun" name="mun">
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Direcci&oacute;n</label>
					<div class="controls">
						<textarea class="input-xlarge" id="dir_neg" name="dir_neg"></textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Metros a calle</label>
					<div class="controls">
						<div class="input-append">
							<input type="number" min="0" class="input-mini" id="med_neg" name="med_neg" value="0">
							<span class="add-on">Mts.</span>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Impuestos a aplicar</label>
					<div class="controls">
						<select name="imp[]" id="imp" class="selectpicker" data-width="285px" multiple data-live-search="true" title="Seleccione una o varias opciones" data-size="5" multiple data-selected-text-format="count>5">
							<?php
							while ($row=pg_fetch_array($rs)) {
								echo "
								<option data-subtext='$row[1]' value='$row[0]'>$row[0]</option>
								";
							}
							pg_close($conn);
							?>
						</select>
					</div>
				</div>
			</div>

			<div class="span4">
				<ul class="thumbnails">
					<li class="span4" id="miniatura">
						<label>Fotografía del Negocio</label>
						<input type="file" id="img_neg" name="img_neg" class="file" data-show-upload="false">
					</li>
				</ul>
			</div>
		</div>
		<div class="span12">
			<div class="form-actions">
				<a class="btn" id="btnActualizar"><i class="icon-refresh"></i> Actualizar</a>
				<a class="btn" onclick="limpiarCampos()"><i class="icon-trash"></i> Limpiar</a>
				<a class="btn" onclick="cancela()"><i class="icon-remove"></i> Cancelar</a>
			</div>
		</div>
	</form>

	<div class="modal hide fade" id="div_addG">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>Agregar nuevo giro</h3>
		</div>
		<div class="modal-body">
			<div class="form-horizontal">
				<label class="control-label">Nombre del Giro o Rubro</label>
				<div class="controls"><input type="text" id="nue_gir" name="nue_gir" class="input-xlarge"></div>
			</div>
		</div>
		<div class="modal-footer">
			<a class="btn" id="addG"><img src="./../img/icon-save.png" width="14px" height="14px"> Guardar</a>
			<a href="#" class="btn" data-dismiss="modal"><i class="icon-remove"></i> Cancelar</a>
		</div>
	</div>

	<div class="modal hide fade" id="bus_per">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>Buscar Persona</h3>
		</div>
		<div class="modal-body">
			<div class="well">
				<div class="control-group offset1">
					<label class="radio inline"><input type="radio" name="per" id="per" value="N" checked>Persona Natural</label>
					<label class="radio inline"><input type="radio" name="per" id="per" value="J">Persona Jurídica</label>
				</div>
			</div>
			<div class="well">
				<div class="control-group">
					<strong>Buscar por:</strong><br>
					<label class="radio inline"><input type="radio" name="radBusPer" id="radBusPerD" value="DUI">DUI</label>
					<label class="radio inline"><input type="radio" name="radBusPer" id="radBusPerN" value="NIT">NIT</label>
					<label class="radio inline"><input type="radio" name="radBusPer" id="radBusPer" value="Nombre" checked>Nombre</label>
				</div>
	  			<input type="text" class="search-query" style="width:250px" name="txtBusPer" id="txtBusPer">
	  			<button class="btn" id="btnBusPer"><i class="icon-search"></i> Buscar</button>
			</div>
			<table class="table table-bordered" id="tabla_col">
				<thead>
					<th>Nombre</th>
					<th id="thd">DUI</th>
					<th>NIT</th>
					<th>Agregar</th>
				</thead>
				<tbody id="cuerpo">
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal"><i class="icon-remove"></i> Cancelar</a>
		</div>
	</div>

	<div class="modal hide fade" id="bus_neg">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">×</a>
			<h3>Buscar Negocio</h3>
		</div>
		<div class="modal-body">
			<div class="well">
				<div class="control-group offset1">
					<label class="radio inline"><input type="radio" name="radTip" id="radTip" value="N" checked>Persona Natural</label>
					<label class="radio inline"><input type="radio" name="radTip" id="radTip" value="J">Persona Jurídica</label>
				</div>
			</div>
			<div class="well">
				<div class="control-group">
					<strong>Buscar por:</strong><br>
					<label class="radio inline"><input type="radio" id="radBusNeg" name="radBusNeg" value="Nombre" checked>Nombre del Negocio</label>
					<label class="radio inline"><input type="radio" id="radBusNeg" name="radBusNeg" value="Contribuyente">Contribuyente</label>
				</div>
	  			<input type="text" class="search-query" style="width:250px" name="txtBusNeg" id="txtBusNeg">
	  			<button class="btn" id="btnBusNeg"><i class="icon-search"></i> Buscar</button>
			</div>
			<table class="table table-bordered">
				<thead>
					<th>Nombre</th>
					<th>Contribuyente</th>
					<th>Dirección</th>
					<th>Añadir</th>
				</thead>
				<tbody id="cuerpo_neg">
				</tbody>
			</table>
		</div>
		<div class="modal-footer">
			<!-- <a href="#" class="btn btn-primary"><i class="icon-plus"></i> Añadir</a> -->
			<a href="#" class="btn" data-dismiss="modal"><i class="icon-remove"></i> Cancelar</a>
		</div>
	</div>

	<script>
		$("#img_neg").fileinput({
			initialPreview:["<img src='./../img/no_imagen.png' class='file-preview-image'>"],
			showCaption:false,
			allowedFileExtensions: ["jpg"],
		});
		$("#img_neg").fileinput("disable");
	</script>


</body>
</html>