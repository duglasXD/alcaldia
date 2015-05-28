$(function(){

	cargaDesdeMapa($("#cod_inm").val(),$("#cod_per").val());

});

function cargaDesdeMapa(codinm,codper){
	if(codinm!=""&&codper!="")
		cargaInm(codper,codinm);
}