<?php 
	include('./../../php/conexion.php');
	$conn=conectar();
	switch ($_POST['caso']) {
		case '1':{
			/////ARMAR LOS CHECKBOX EN UNA SOLA CADENA/////
			$oci_ded = '';
			$x=count($_POST['oci_ded']);
			for($i=0;$i<$x;$i++){
				$s = '|';
				if($oci_ded == ''){
					$oci_ded =$_POST['oci_ded'][$i];
				}else{
					$oci_ded .= $s.$_POST['oci_ded'][$i]; 
				}
			}
			//////////////////////////////////////////////////////////////
			$oci_lec = '';
			$x=count($_POST['oci_lec']);
			for($i=0;$i<$x;$i++){
				$s = '|';
				if($oci_lec == ''){
					$oci_lec =$_POST['oci_lec'][$i];
				}else{
					$oci_lec .= $s.$_POST['oci_lec'][$i]; 
				}
			}
			// ///////////////////////////////////////////////////////////////
			$per_hog = '';
			$x=count($_POST['per_hog']);
			for($i=0;$i<$x;$i++){
				$s = '|';
				if($per_hog == ''){
					$per_hog =$_POST['per_hog'][$i];
				}else{
					$per_hog .= $s.$_POST['per_hog'][$i]; 
				}
			}
			// //////////////////////////////////////////////////////////////
			$car_agr = '';
			$x=count($_POST['car_agr']);
			for($i=0;$i<$x;$i++){
				$s = '|';
				if($car_agr == ''){
					$car_agr =$_POST['car_agr'][$i];
				}else{
					$car_agr .= $s.$_POST['car_agr'][$i]; 
				}
			}
			// //////////////////////////////////////////////////////////////
			$dec_aba_hog = '';
			$x=count($_POST['dec_aba_hog']);
			for($i=0;$i<$x;$i++){
				$s = '|';
				if($dec_aba_hog == ''){
					$dec_aba_hog =$_POST['dec_aba_hog'][$i];
				}else{
					$dec_aba_hog .= $s.$_POST['dec_aba_hog'][$i]; 
				}
			}
			// ///////////////////////////////////////////////////////////////
			$res_ame_rup = '';
			$x=count($_POST['res_ame_rup']);
			for($i=0;$i<$x;$i++){
				$s = '|';
				if($res_ame_rup == ''){
					$res_ame_rup =$_POST['res_ame_rup'][$i];
				}else{
					$res_ame_rup .= $s.$_POST['res_ame_rup'][$i]; 
				}
			}

			// ///////////////////////////////////////////////////////////////
			$abu_qui = '';
			$x=count($_POST['abu_qui']);
			for($i=0;$i<$x;$i++){
				$s = '|';
				if($abu_qui == ''){
					$abu_qui =$_POST['abu_qui'][$i];
				}else{
					$abu_qui .= $s.$_POST['abu_qui'][$i]; 
				}
			}
	
			// ///////////////////////////////////////////////////////////////
			$prob_agr = '';
			$x=count($_POST['prob_agr']);
			for($i=0;$i<$x;$i++){
				$s = '|';
				if($prob_agr == ''){
					$prob_agr =$_POST['prob_agr'][$i];
				}else{
					$prob_agr .= $s.$_POST['prob_agr'][$i]; 
				}
			}
			/////////////////////////////////////////////////////////////////////////////
			if ($_POST['cod_per']=="") {
				pg_query("INSERT INTO rf_persona(nom,ape1,ape2,sex,fec_nac,dui,nit,tel1,tel2,dir) VALUES('".$_POST['nom']."','".$_POST['ape1']."','".$_POST['ape2']."','".$_POST['sex']."','".$_POST['fec_nac']."','".$_POST['dui']."','".$_POST['nit']."','".$_POST['tel1']."','".$_POST['tel2']."','".$_POST['dir']."')");
				$rs=pg_query("SELECT MAX(cod_per) FROM rf_persona");
				if ($row = pg_fetch_row($rs)) {
					$cod_per = trim($row[0]);
				}
			}else{
				$cod_per=$_POST['cod_per'];
			}
			if ($_POST['cod_agr']=="") {
				pg_query("INSERT INTO rf_persona(nom,ape1,ape2,sex,fec_nac,dui,nit,tel1,tel2,dir) VALUES('".$_POST['nom_agr']."','".$_POST['ape1_agr']."','".$_POST['ape2_agr']."','".$_POST['sex_agr']."','".$_POST['fec_nac_agr']."','".$_POST['dui_agr']."','".$_POST['nit_agr']."','".$_POST['tel1_agr']."','".$_POST['tel2_agr']."','".$_POST['dir_agr']."')");
				$rs=pg_query("SELECT MAX(cod_per) FROM rf_persona");
				if ($row = pg_fetch_row($rs)) {
					$cod_agr = trim($row[0]);
				}
			}else{
				$cod_agr=$_POST['cod_agr'];
			}
			//Insertar expediente
			$sqlexp="UPDATE um_expediente SET ano_res='$_POST[ano_res]',
				niv_edu='$_POST[niv_edu]',
				oci_ded='$oci_ded',oci_lec='$oci_lec',oci_otr='$_POST[oci_otr]',
				tra_rem='$_POST[tra_rem]',baj_con='$_POST[baj_con]',jor_tra='$_POST[jor_tra]',ing_med_men='$_POST[ing_med_men]',otr_tip_ing='$_POST[otr_tip_ing]',dep_eco_agr='$_POST[dep_eco_agr]',rec_ayu='$_POST[rec_ayu]',rec_ayu_ong='$_POST[rec_ayu_ong]',
				med_cab='$_POST[med_cab]',acu_amb='$_POST[acu_amb]',tra_con='$_POST[tra_con]',com='$_POST[com]',con_agr='$_POST[con_agr]',dur_rel_sen='$_POST[dur_rel_sen]',pri_con='$_POST[pri_con]',
				suf_mal='$_POST[suf_mal]',mal_qui='$_POST[mal_qui]',suf_abu_sex='$_POST[suf_abu_sex]',abu_qui_sex='$_POST[abu_qui_sex]',
				tra_sep='$_POST[tra_sep]',med_cau='$_POST[med_cau]',rup_ant='$_POST[rup_ant]',dur_mal='$_POST[dur_mal]',
				ame_rup='$_POST[ame_rup]',
				mal_men='$_POST[mal_men]',tip_mal_men='$_POST[tip_mal_men]',num_hij='$_POST[num_hij]',per_hog='$per_hog',apo_eco_fam='$_POST[apo_eco_fam]',apo_afe_fam='$_POST[apo_afe_fam]',apo_cri='$_POST[apo_cri]',con_sit='$_POST[con_sit]',con_apo='$_POST[con_apo]',man_rel_agr='$_POST[man_rel_agr]',
				apo_efe_ami='$_POST[apo_efe_ami]',apo_afe_ami='$_POST[apo_afe_ami]',ent_con_agr='$_POST[ent_con_agr]',ent_apo_agr='$_POST[ent_apo_agr]',
				niv_edu_agr='$_POST[niv_edu_agr]',ant_pen_agr='$_POST[ant_pen_agr]',car_agr='$car_agr',dec_aba_hog='$dec_aba_hog',res_ame_rup='$res_ame_rup',
				abu_qui='$abu_qui',prob_agr='$prob_agr',cod_per='$cod_per',cod_agr='$cod_agr' WHERE cod_exp='$_POST[cod_exp]'";
			$fecha_actual=date("Y-m-d");
			$sqlobs="INSERT INTO um_obs_exp VALUES('$_POST[cod_exp]','$fecha_actual','$_POST[obs]')";
			if (pg_query($sqlexp)&&pg_query($sqlobs)) {
				echo "Actualizado exitosamente";
			}
			if($_POST['cod_mad']!="" || $_POST['cod_pad']!=""){
				pg_query("UPDATE um_exp_padres SET cod_mad='$_POST[cod_mad]',cod_pad='$_POST[cod_pad]' WHERE cod_exp='$_POST[cod_exp]')") or die("Error al actualizar padres de menor");
			}		
			pg_close();	
		}break;

		case '2':{ //Busca coincidencia de personas con expediente
			if ($_POST['radBusPer']=="DUI") {
				$sql="SELECT * FROM rf_persona rp, um_expediente ue WHERE rp.cod_per=ue.cod_per and rp.dui='$_POST[txtBusPer]' ";
			}else{
				$sql="SELECT * FROM rf_persona rp, um_expediente ue WHERE rp.cod_per=ue.cod_per and (rp.nom ilike '%$_POST[txtBusPer]%' or rp.ape1 ilike '%$_POST[txtBusPer]%' or rp.ape2 ilike '%$_POST[txtBusPer]%')";
			}
			$rs=pg_query($sql) or die("Error en la búsqueda");
			$numRow=pg_num_rows($rs);
			for ($i=0; $i < $numRow; $i++) { 
				$row=pg_fetch_array($rs,$i);
				$cod_per=$row['cod_per'];
				$nom=$row['nom'];
				$ape1=$row['ape1'];
				$ape2=$row['ape2'];
				$dui=$row['dui'];
				$nit=$row['nit'];

				echo "
				<tr>
					<td>".$nom." ".$ape1." ".$ape2."</td>
					<td>".$dui."</td>
					<td>".$nit."</td>
					<td><a href='#' class='btn' data-dismiss='modal' onclick=\"cargaDatos('".$cod_per."')\"><i class='icon-ok'></i></a></td>
				</tr>
				";
			}
			pg_close();
		}break;

		case '3':{//Devuelve los datos de una persona seleccionada en la busqueda
			$sql="SELECT rp.*,ue.*,rp2.cod_per as cod_agr,rp2.nom as nom_agr,rp2.ape1 as ape1_agr,rp2.ape2 as ape2_agr,rp2.sex as sex_agr,rp2.fec_nac as fec_nac_agr,rp2.dui as dui_agr,rp2.nit as nit_agr,rp2.tel1 as tel1_agr, rp2.tel2 as tel2_agr,rp2.dep as dep_agr,rp2.mun as mun_agr,rp2.dir as dir_agr FROM rf_persona rp,rf_persona rp2,um_expediente ue  WHERE rp.cod_per=ue.cod_per and rp2.cod_per=ue.cod_agr and ue.cod_per='$_POST[cod_per]'";
			$rs2=pg_query($sql) or die("Error en la busqueda");
			$datexp = array();
			while ($obj=pg_fetch_object($rs2)){
				$datexp[]=array(
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
					'dep'=>$obj->dep,
					'mun'=>$obj->mun,
					'dir'=>$obj->dir,
					'cod_exp'=>$obj->cod_exp,
					'ano_res'=>$obj->ano_res,
					'est_civ'=>$obj->est_civ,
					'niv_edu'=>$obj->niv_edu,
					'oci_ded'=>$obj->oci_ded,
					'oci_lec'=>$obj->oci_lec,
					'oci_otr'=>$obj->oci_otr,
					'tra_rem'=>$obj->tra_rem,
					'tip_tra'=>$obj->tip_tra,
					'baj_con'=>$obj->baj_con,
					'jor_tra'=>$obj->jor_tra,
					'ing_med_men'=>$obj->ing_med_men,
					'otr_tip_ing'=>$obj->otr_tip_ing,
					'rec_fin'=>$obj->rec_fin,
					'dep_eco_agr'=>$obj->dep_eco_agr,
					'rec_ayu'=>$obj->rec_ayu,
					'rec_ayu_ong'=>$obj->rec_ayu_ong,
					'med_cab'=>$obj->med_cab,
					'acu_amb'=>$obj->acu_amb,
					'tra_con'=>$obj->tra_con,
					'com'=>$obj->com,
					'con_agr'=>$obj->con_agr,
					'dur_rel_sen'=>$obj->dur_rel_sen,
					'pri_con'=>$obj->pri_con,
					'suf_mal'=>$obj->suf_mal,
					'mal_qui'=>$obj->mal_qui,
					'suf_abu_sex'=>$obj->suf_abu_sex,
					'abu_qui_sex'=>$obj->abu_qui_sex,
					'tra_sep'=>$obj->tra_sep,
					'med_cau'=>$obj->med_cau,
					'rup_ant'=>$obj->rup_ant,
					'dur_mal'=>$obj->dur_mal,
					'ame_rup'=>$obj->ame_rup,
					'mal_men'=>$obj->mal_men,
					'tip_mal_men'=>$obj->tip_mal_men,
					'num_hij'=>$obj->num_hij,
					'per_hog'=>$obj->per_hog,
					'apo_eco_fam'=>$obj->apo_eco_fam,
					'apo_afe_fam'=>$obj->apo_afe_fam,
					'apo_cri'=>$obj->apo_cri,
					'con_sit'=>$obj->con_sit,
					'con_apo'=>$obj->con_apo,
					'man_rel_agr'=>$obj->man_rel_agr,
					'apo_efe_ami'=>$obj->apo_efe_ami,
					'apo_afe_ami'=>$obj->apo_afe_ami,
					'ent_con_agr'=>$obj->ent_con_agr,
					'ent_apo_agr'=>$obj->ent_apo_agr,
					'niv_edu_agr'=>$obj->niv_edu_agr,
					'tra_agr'=>$obj->tra_agr,
					'ant_pen_agr'=>$obj->ant_pen_agr,
					'car_agr'=>$obj->car_agr,
					'dec_aba_hog'=>$obj->dec_aba_hog,
					'res_ame_rup'=>$obj->res_ame_rup,
					'abu_qui'=>$obj->abu_qui,
					'prob_agr'=>$obj->prob_agr,
					'obs'=>$obj->obs,
					'cod_agr'=>$obj->cod_agr,
					'nom_agr'=>$obj->nom_agr,
					'ape1_agr'=>$obj->ape1_agr,
					'ape2_agr'=>$obj->ape2_agr,
					'sex_agr'=>$obj->sex_agr,
					'fec_nac_agr'=>$obj->fec_nac_agr,
					'dui_agr'=>$obj->dui_agr,
					'nit_agr'=>$obj->nit_agr,
					'tel1_agr'=>$obj->tel1_agr,
					'tel2_agr'=>$obj->tel2_agr,
					'dep_agr'=>$obj->dep_agr,
					'mun_agr'=>$obj->mun_agr,
					'dir_agr'=>$obj->dir_agr,
				);
			}
			echo ''.json_encode($datexp).'';
			pg_close();
		}break;

		case '4':{ //Busca coincidencia de personas sobre el presunto agresor
			if ($_POST['radBusPer2']=="DUI") {
				$sql="SELECT * FROM rf_persona WHERE dui='$_POST[txtBusPer2]'";
			}else{
				$sql="SELECT * FROM rf_persona WHERE nom ilike '%$_POST[txtBusPer]%' or ape1 ilike '%$_POST[txtBusPer]%' or ape2 ilike '%$_POST[txtBusPer]%'";
			}
			$rs2=pg_query($sql) or die("Error en la búsqueda");
			$numRow=pg_num_rows($rs2);
			for ($i=0; $i < $numRow; $i++) { 
				$row=pg_fetch_array($rs2,$i);
				$cod_per=$row['cod_per'];
				$nom=$row['nom'];
				$ape1=$row['ape1'];
				$ape2=$row['ape2'];
				$dui=$row['dui'];
				$nit=$row['nit'];
				echo "
				<tr>
					<td>".$nom." ".$ape1." ".$ape2."</td>
					<td>".$dui."</td>
					<td>".$nit."</td>
					<td><a href='#addCol' class='btn' data-dismiss='modal' onclick=\"cargaDatos2('".$cod_per."')\"><i class='icon-ok'></i></a></td>
				</tr>
				";
			}
			pg_close();
		}break;

		case '5':{
			$rs=pg_query("SELECT rp.nom,rp.ape1,rp.ape2,rp2.nom as nomp,rp2.ape1 as ape1p,rp2.ape2 as ape2p,up.cod_mad,up.cod_pad FROM um_exp_padres up,rf_persona rp,rf_persona rp2 WHERE rp.cod_per=up.cod_mad and rp2.cod_per=up.cod_pad and cod_exp='$_POST[cod_exp]'");
			$datpad = array();
			while ($obj=pg_fetch_object($rs)){
				$datpad[]=array(
					'cod_mad'=>$obj->cod_mad,
					'cod_pad'=>$obj->cod_pad,
					'nom_mad'=>$obj->nom,
					'ape1_mad'=>$obj->ape1,
					'ape2_mad'=>$obj->ape2,
					'nom_pad'=>$obj->nomp,
					'ape1_pad'=>$obj->ape1p,
					'ape2_pad'=>$obj->ape2p
				);
			}
			echo ''.json_encode($datpad).'';
			pg_close();
		}break;

		case '6':{
			$rs=pg_query("SELECT * FROM um_obs_exp WHERE cod_exp='$_POST[cod_exp]'");
			$datobs = array();
			while ($obj=pg_fetch_object($rs)){
				$datobs[]=array(
					'cod_exp'=>$obj->cod_exp,
					'fec_obs'=>$obj->fec_obs,
					'obs'=>$obj->obs
				);
			}
			echo ''.json_encode($datobs).'';
			pg_close();
		}break;
	}
?>