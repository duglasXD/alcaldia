var map="";
var creator ="";
var icono="";
var ico='';
var x="";
var marker ="";

$(function(){//funcion que se ejecuta aL cargar el DOM
  if($("#ico").val()!=""){
    cargarMapa();
  }else{
    var html='';
    html += "<div class='alert alert-info'>"
    html += "<h4>Información!</h4> Recuerde establecer la ubicación en el mapa más tarde."
    html += "</div>"
    $("#mapa").html(html);
  }
});

function cargarMapa() {
  //establece las opciones y crea el mapa
  var posicion= $("#pos").val();
  ico= $("#ico").val();

  //alert(posicion);
  posicion=posicion.replace("(","");
  posicion=posicion.replace(")",""); 
  posicion=posicion.trim(); 
  var post=posicion.split(',');

	var mapOptions = {
		center: new google.maps.LatLng(13.7004458,-88.9004982),//Coordenadas de San Cristobal
		zoom: 16,
    disableDefaultUI: true,
    mapTypeId: google.maps.MapTypeId.SATELLITE
	};
	map = new google.maps.Map(document.getElementById("mapa"),mapOptions);  
  var dragg=true;
  if(ico=='1'){
    icono="../img/icon-neg.png";
    dragg=false;//En la vista previa de ingreso de negocio, se establece false para que no se pierda el punto capturado
  }
  if(ico=='2'){
    icono="../img/icon-home.png";
    dragg=false;//En la vista previa de ingreso de inmueble, se establece false para que no se pierda el punto capturado
  }
  if(ico=='3'){
    if ($("input[name='alum_mun']:checked").val()=='Funcionando') {
           icono="../img/lamp-ok.png";
         }else{
            icono="../img/lamp-off.png";
        }
        dragg:true;
  }
  var npos=new google.maps.LatLng(post[0], post[1])
   marker = new google.maps.Marker({
    position: npos,
    map: map,
    draggable:dragg,
    icon:icono
  });
   map.panTo(npos);//centra el mapa de acuerdo al marcador puesto
}
