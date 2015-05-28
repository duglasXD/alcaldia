<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Consulta de Expediente</title>
	<link rel="stylesheet" href="./../css/bootstrap.css">
	<link rel="stylesheet" href="../css/retoques.css">
	<link rel="stylesheet" href="../css/table.css">
	<link rel="stylesheet" href="./../css/bootstrap-select.css">
	<script src="./../js/jquery.min-1.7.1-google.js"></script>
	<script src="./../js/bootstrap-2.0.2.js"></script>
	<script src="./../js/bootstrap-select.js"></script>
	<script type="text/javascript" src="https://www.google.com/jsapi" onerror="Necesita una conexión a internet para obtener gráficas"></script>
	<script src="js/cons_catastro.js"></script>
	<script type="text/javascript">	
	google.load("visualization", "1", {packages:["corechart"]});
	$(function(){
		$('.selectpicker').selectpicker();
		$("select[name='radBus']").change(function(){
			$.ajax({
				type:"post",
	         	url: "proc/proc_cons_catastro.php",
	          data:{
					opcion:$(this).val(),
				},
	          success:function(responseText){
	       
	          	var titulo="";
	     		if($("select[name='radBus']").val()=="pe"){
			    	titulo="Personas fallecidas";
			    }	
			    if($("select[name='radBus']").val()=="ne"){
			    	titulo="Negocios inscritos por año";
			    }
			     if($("select[name='radBus']").val()=="in"){
			    	titulo="Inmuebles inscritos por año";
			    }

	        var titulo ={
	         	title:titulo,
				is3D: true,
				width: 800,
                height: 400
			};
	      	var data = new google.visualization.DataTable(responseText);
	      	var chart = new google.visualization.PieChart(document.getElementById('migrafica'));
	      	chart.draw(data,titulo);
		
				}
			});
			
		});
	});
	</script>
	
</head>
<body>
	<legend style="margin-top:25px;">Consulta de Expediente</legend>
	<div class="tabbable">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#datGen">General</a></li>
			
			<!-- <li><a data-toggle="tab" href="#sitLab">Situación Laboral</a></li>
			<li><a data-toggle="tab" href="#famExt">Relaciones Familiares</a></li>
			<li><a data-toggle="tab" href="#relSoc">Relaciones Sociales</a></li>
			<li><a data-toggle="tab" href="#sitGen">Situación General</a></li>
			<li><a data-toggle="tab" href="#proGen">Problemática General</a></li> -->
		</ul>
		<div class="form-actions span12">
		<div class="control-group">
			<label class="control-label">Filtros:</label>
			<div class="controls">
				<select name="radBus" class="selectpicker" data-width="285px"  data-live-search="true" title="Seleccione una o varias opciones" data-size="5"  data-selected-text-format="count>5">
					<option style="display:none"></option>
					<option  value='pe'>Perpetuidad</option>
					<option  value='ne'>Negocios</option>
					<option  value='in'>Inmuebles</option>
				</select>
			</div>
		</div>
	</div> <!--fin del div tabbable-->
	<br>
	<div class="form-actions span12">
		<!-- <a class="btn btn-ppal offset3"  id="btnGenerar"><img src="../img/icon-piechart.png" width="18px" height="18px"> Generar Gráfico</a> -->
		<a onclick="imprimeGrafica()" class="btn"><i class="icon-print"></i> Imprimir Gráfica</a>
		<!-- <a class="btn"><i class="icon-trash"></i> Limpiar filtros</a> -->
	</div>
	<br>
	<br>
	<div class="well span12" id="contenedor">
		<h3 style="text-align:center;font-family:TimesRoman">Alcaldía Municipal de San Cristóbal</h3>
		<h4 style="text-align:center;font-family:TimesRoman">Unidad de Género</h4>
	<div id="migrafica" class="offset1" ></div>
	</div>
</body>
</html>