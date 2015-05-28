<?php 
	include('./../../php/conexion.php');
	$conn=conectar();
	switch ($_POST['caso']) {
		case '1'://Ver Negocios
			$sql="SELECT * FROM ca_negocio WHERE est_neg='t'";//Buscar una manera de mostrar los negocios q aun no han sido puestos en el mapa
			$rs=pg_query($sql) or die("Error en la busqueda");
			$datneg = array();
			$x=0;
			while ($obj=pg_fetch_object($rs)){
				$propietario="";
				$row=pg_fetch_array($rs);
				if($row['tip_con']=="N"){
					$sql2="SELECT nom,ape1,ape2 FROM rf_persona WHERE cod_per=".$row['cod_con'];
					$rs2=pg_query($sql2);
					$row2=pg_fetch_array($rs2);
					$propietario=$row2['nom']." ".$row2['ape1']." ".$row2['ape2'];
					
				}
				if($row['tip_con']=="J"){
					$sql2="SELECT nom_jur FROM ca_sociedad WHERE idSoc='$row[cod_con]'";
					$rs2=pg_query($sql2);
					$row2=pg_fetch_array($rs2);
					$propietario=$row2['nom_jur'];
				}
				echo $x."<br>";
				$datneg[]=array(
					'cod_neg'=>$obj->cod_neg,
					'nom_neg'=>$obj->nom_neg,
					'rub_neg'=>$obj->rub_neg,
					'zon_neg'=>$obj->zon_neg,
					'dep'=>$obj->dep,
					'mun'=>$obj->mun,
					'dir_neg'=>$obj->dir_neg,
					'med_neg'=>$obj->med_neg,
					'img_neg'=>$obj->img_neg,
					'est_neg'=>$obj->est_neg,
					'tip_con'=>$obj->tip_con,
					'cod_con'=>$obj->cod_con,
					'propietario'=>$propietario,
					'puntos'=>$obj->puntos
				);
				$x++;
			}
			//echo ''.json_encode($datneg).'';
			pg_close($conn);
		break;

		case '2'://Ver Inmuebles
			$sql="SELECT * FROM ca_inmueble";
			$rs=pg_query($sql) or die("Error en la busqueda");
			$datInm = array();
			while ($obj=pg_fetch_object($rs)){
				$datInm[]=array(
					'cod_inm'=>$obj->cod_inm,
					'cod_pro'=>$obj->cod_pro,
					'zon_inm'=>$obj->zon_inm,
					'dir_inm'=>$obj->dir_inm,
					'med_inm'=>$obj->med_inm,
					'lim_nor'=>$obj->lim_nor,
					'lim_sur'=>$obj->lim_sur,
					'lim_est'=>$obj->lim_est,
					'lim_oes'=>$obj->lim_oes,
					'puntos'=>$obj->puntos
				);
			}
			echo ''.json_encode($datInm).'';
			pg_close($conn);
		break;

		case '3'://Ver lamparas
			$sql="SELECT * FROM ca_alumbrado";
			$rs=pg_query($sql) or die("Error en la busqueda");
			$datLamp = array();
			while ($obj=pg_fetch_object($rs)){
				$datLamp[]=array(
					'cod_alumbrado'=>$obj->cod_alumbrado,
					'sit_en'=>$obj->sit_en,
					'alum_mun'=>$obj->alum_mun,
					'puntos'=>$obj->puntos
				);
			}
			echo ''.json_encode($datLamp).'';
			pg_close($conn);
		break;
		
		case '4'://Ver negocios que estan a punto de caer en mora
			$sql="SELECT * FROM ca_negocio WHERE est_neg='t' and co_estcta";
			pg_close($conn);
		break;
		
	}
?>