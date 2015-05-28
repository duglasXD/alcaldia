<?php 
	include('./../../php/conexion.php');
	$conn=conectar();

	switch ($_POST['caso']) {
		case '1':{
			if ($_POST['radBusPer']=="DUI") {
				$sql="SELECT * FROM rf_persona WHERE dui='$_POST[txtBusPer]'";
			}else{
				$sql="SELECT * FROM rf_persona WHERE nom ilike '%$_POST[txtBusPer]%' or ape1 ilike '%$_POST[txtBusPer]%' or ape2 ilike '%$_POST[txtBusPer]%'";
			}
			$rs=pg_query($sql) or die("Error en la busqueda");
			$numRow=pg_num_rows($rs);
			for ($i=0; $i < $numRow; $i++) { 
				$row=pg_fetch_array($rs,$i);
				$cod_per= $row['cod_per'];
				$nom= $row['nom'];
				$ape1= $row['ape1'];
				$ape2= $row['ape2'];
				$dui= $row['dui'];
				$nit= $row['nit'];
				echo "
					<tr>
						<td style='display:none'>".$cod_per."</td>
						<td>".$nom." ".$ape1." ".$ape2."</td>
						<td>".$dui."</td>
						<td>".$nit."</td>
						<td><a href='#' class='btn' data-dismiss='modal' onclick=\"cargaPer('".$cod_per."')\"><i class='icon-ok'></i></a></td>
					</tr>
				";
			}
			pg_close();
		}break;

		case '2':{
			$sql="SELECT * FROM rf_persona WHERE cod_per='$_POST[cod_per]'";
			$rs2=pg_query($sql) or die("Error en la busqueda");
			$datper = array();
			while ($obj=pg_fetch_object($rs2)){
				$datper[]=array(
					'cod_per'=>$obj->cod_per,
					'nom'=>$obj->nom,
					'ape1'=>$obj->ape1,
					'ape2'=>$obj->ape2,
					'sex'=>$obj->sex,
					'fec_nac'=>$obj->fec_nac,
					'dui'=>$obj->dui,
					'nit'=>$obj->nit,
					'tel1'=>$obj->tel1,
					'tel2'=>$obj->tel2,
					'dir'=>$obj->dir,
				);
			}
			echo ''.json_encode($datper).'';
			pg_close();
		}break;

		case '3':{
			$sql="INSERT INTO ca_perpetuidad(ancho,largo,lim_nor,lim_sur,lim_est,lim_oes,nic_aut,clase,valor,num_rec,fec_rec,cod_cem,cod_pro) VALUES('$_POST[ancho]','$_POST[largo]','$_POST[lim_nor]','$_POST[lim_sur]','$_POST[lim_est]','$_POST[lim_oes]','$_POST[nic_aut]','$_POST[clase]','$_POST[valor]','$_POST[num_rec]','$_POST[fec_rec]','$_POST[cem]','$_POST[cod_per]')";
			if (pg_query($sql) or die("Error al ingresar")) {
				$rs=pg_query("SELECT MAX(cod_tit) FROM ca_perpetuidad");
				$row=pg_fetch_array($rs);
				if ($_POST['fall1']!="") {
					pg_query("INSERT INTO ca_enterrado VALUES('$_POST[cod_per]','$row[0]','$_POST[fall1]')");
				}
				if ($_POST['fall2']!="") {
					pg_query("INSERT INTO ca_enterrado VALUES('$_POST[cod_per]','$row[0]','$_POST[fall2]')");
				}
				if ($_POST['fall3']!="") {
					pg_query("INSERT INTO ca_enterrado VALUES('$_POST[cod_per]','$row[0]','$_POST[fall3]')");
				}
				if ($_POST['fall4']!="") {
					pg_query("INSERT INTO ca_enterrado VALUES('$_POST[cod_per]'',$row[0]','$_POST[fall4]')");
				}
				if ($_POST['fall5']!="") {
					pg_query("INSERT INTO ca_enterrado VALUES('$_POST[cod_per]','$row[0]','$_POST[fall5]')");
				}

				$fec_hor=date("Y-m-d H:i:s");
				$msj="Cobro por título de perpetuidad a nombre de: ".$_POST['nom'];
				if(pg_query("INSERT INTO co_notificacion(mensaje,fec_hor,status) VALUES('$msj','$fec_hor','t')") or die("Error al ingresar")){
					echo "Guardado exitosamente";
				}
			}
			pg_close($conn);
		}break;
	}
?>