var map="";
var creator ="";
var icono="";
var ico='';
var x="";
var marker="";
var markersArray = [];
var contenido="";
var img="";
var rutalinea="";
var polyline="";
var infowindow = new google.maps.InfoWindow({  
  content: ''
});

$(function(){//funcion que se ejecuta aL cargar el DOM
  cargarMapa();
});

function cargarMapa() {
  //establece las opciones y crea el mapa
	var mapOptions = {
		center: new google.maps.LatLng(13.7004458,-88.9004982),//Coordenadas de San Cristobal
		zoom: 16,
    mapTypeId: google.maps.MapTypeId.SATELLITE
	};
	map = new google.maps.Map(document.getElementById("mapa"),mapOptions);  
}

function ponerMarcador(position,map,icono){
  if(ico=='1'){
    icono="../img/icon-neg.png";
  }
  if(ico=='2'){
    icono="../img/icon-home.png";
  }
  if(ico=='3'){
    icono="../img/lamp-ok.png";
  }
 marker = new google.maps.Marker({
    position: position,
    map: map,
    icon:icono
  });
  if(ico=='1'){
    parent.centro.location.href ="form_negocio.php?pos="+position+"&ico="+ico+"";
  }
  if(ico=='2'){
    parent.centro.location.href ="form_inmueble.php?pos="+position+"&ico="+ico+"";
  }
  if(ico=='3'){
    parent.centro.location.href ="form_alumbrado.php?pos="+position+"&ico="+ico+"";
  }
  //map.panTo(position);//centra el mapa de acuerdo al marcador puesto
}

function addP(){
  creator = new PolygonCreator(map);
}
function addN(){//Agrega negocio
   ico='1';
   google.maps.event.removeListener(x);
   x=google.maps.event.addListener(map,'click',function(e){
    ponerMarcador(e.latLng,map,icono);
  });
}
function addI(){//Agrega inmueble
   ico='2';
   google.maps.event.removeListener(x);
   x=google.maps.event.addListener(map,'click',function(e){
    ponerMarcador(e.latLng,map,icono);
  });
}
function addL(){//Agrega lampara
  ico='3';
  google.maps.event.removeListener(x);
  x=google.maps.event.addListener(map,'click',function(e){
    ponerMarcador(e.latLng,map,icono);
  });
}
function addC(){//agrega calle
  ico='4';
  // e=document.getElementById('btnGC');
  // e.style.display="block";
  $("#btnAC").hide();//Oculta boton Agregar
  $("#btnGC").show();//Muestra boton Guardar
  $("#btnCC").show();//Muestra boton Cancelar
  var routes = new google.maps.MVCArray();
  polyline = new google.maps.Polyline({
    rutalinea: routes,
    map: map,
    strokeColor: '#0018FF',
    strokeWeight: 7,
    strokeOpacity: 0.8,
    clickable: false
  });
  google.maps.event.addListener(map, 'click', function(e){
    rutalinea = polyline.getPath();
    rutalinea.push(e.latLng);
  });
}

function guardarC(){
  alert(rutalinea);
}

function ver(opcion){
  $.ajax({
    type: "post",
    url: "proc/proc_mapa.php",
    data:{
      caso: opcion
    },
    success:function(responseText){
      //var dataJson = eval(responseText);
      alert(responseText);
      //cargaAll(dataJson,opcion);
    }
  });
}

function remP(){
  creator.destroy();//destruye todos los poligonos
}

function cargaAll(dataJson,ico){
 clearOverlays();
  for(var i in dataJson){
    if(dataJson[i].puntos!=null){
      dataJson[i].puntos=dataJson[i].puntos.replace("(","");
      dataJson[i].puntos=dataJson[i].puntos.replace(")",""); 
      dataJson[i].puntos=dataJson[i].puntos.trim(); 
      var post=dataJson[i].puntos.split(',');

      if(ico=='1'){
        icono="../img/icon-neg.png";
        if(dataJson[i].img_neg==null||dataJson[i].img_neg==""){
          img="../img/no_imagen.png";
        }else{
          img="proc/imagenes/"+dataJson[i].img_neg;
        }
        contenido=""+
        "<div class='span7' style='width:410px'>"+
        "<div class='span3'>"+
        "<h3>"+dataJson[i].nom_neg+"</h3>"+
        "<h3>"+dataJson[i].propietario+"</h3>"+
        "<h4>"+dataJson[i].dir_neg+"</h4>"+
        "<h4>Metros a Calle: "+dataJson[i].med_neg+"m</h4>"+
        "</div>"+
        "<div class='span3' style='width:150px'>"+
        "<img src='"+img+"' style='width:150px; height:100px'>"+
        "</div>"+
        "</div>"+
        "<div class='well'>"+
        "<a class='btn' title='Actualizar Datos' href='act_negocio.php?cod_neg="+dataJson[i].cod_neg+"&tip_neg="+dataJson[i].tip_con+"&cod_con="+dataJson[i].cod_con+"' target='centro'><i class='icon-refresh'></i></a>"+
        "<a class='btn' title='Traspaso' href='form_traspaso.php?cod_neg="+dataJson[i].cod_neg+"&tip_neg="+dataJson[i].tip_con+"&cod_con="+dataJson[i].cod_con+"' target='centro'><img src='./../img/icon-transfer.png' width='14px' height='14px'></a>"+
        "<a class='btn' title='Cierre' href='form_cierre.php?cod_neg="+dataJson[i].cod_neg+"&tip_neg="+dataJson[i].tip_con+"&cod_con="+dataJson[i].cod_con+"' target='centro'><i class='icon-ban-circle'></i></a>"+
        "<a class='btn' title='Estado de cuenta' href='form_estado_cuenta_negocio.php?cod_neg="+dataJson[i].cod_neg+"&tip_neg="+dataJson[i].tip_con+"&cod_con="+dataJson[i].cod_con+"' target='centro'><img src='./../img/icon-money.png' width='14px' height='14px'></a>"+
        "</div>";
      }
      if(ico=='2'){
        icono="../img/icon-home.png";
        contenido=""+
        "<div class='span7' style='width:410px'>"+
        "<div class='span3'>"+
        "<h3>"+dataJson[i].cod_inm+"</h3>"+
        "<h4>"+dataJson[i].dir_inm+"</h4>"+
        "<h4>Metros a Calle: "+dataJson[i].med_inm+"m</h4>"+
        "</div>"+
        "</div>"+
        "<div class='well'>"+
        "<a class='btn' title='Actualizar Datos' href='act_inmueble.php?cod_inm="+dataJson[i].cod_inm+"&cod_pro="+dataJson[i].cod_pro+"' target='centro'><i class='icon-refresh'></i></a>"+
        "<a class='btn' title='Estado de cuenta' href='form_estado_cuenta_inmueble.php?cod_inm="+dataJson[i].cod_inm+"&cod_pro="+dataJson[i].cod_pro+"' target='centro'><img src='./../img/icon-money.png' width='14px' height='14px'></a>"+
        "</div>";
      }
      if(ico=='3'){
        if (dataJson[i].alum_mun=='Inhabilitada'){
          icono="../img/lamp-off.png";
        }else{
            icono="../img/lamp-ok.png";
         }
         contenido=""+
         "<div class='well'>"+
         "<div class=''>"+
         "<div class=''>"+
         "<h3> Correlativo: "+dataJson[i].cod_alumbrado+"</h3>"+
         "<h4>Ubicación: "+dataJson[i].sit_en+"</h4>"+
         "<h4>Estado: "+dataJson[i].alum_mun+"</h4>"+
         "</div>"+
         "</div>"+
         "<div class=''>"+
         "<a class='btn' title='Actualizar Datos' href='form_alumbrado.php?cod_alumbrado="+dataJson[i].cod_alumbrado+"&ico=3' target='centro'><i class='icon-refresh'></i></a>"+
         "<a class='btn' title='Estado de cuenta' onClick='actualizaEstado("+dataJson[i].cod_alumbrado+",\""+dataJson[i].alum_mun+"\")'><img src='./../img/icon-money.png' width='14px' height='14px'></a>"+
         "</div>"+
         "</div>";
      }
      var npos=new google.maps.LatLng(post[0], post[1]);
      marker = new google.maps.Marker({
        position: npos,
        map: map,
        icon:icono
      });
      markersArray.push(marker);
      (function(marker, contenido) {
        google.maps.event.addListener(marker, 'click', function(){
          infowindow.setContent(contenido);
          infowindow.open(map, marker);
        });
      })(marker, contenido);
    }
  }
}

function clearOverlays() {
  for (var i = 0; i < markersArray.length; i++ ) {
    markersArray[i].setMap(null);
  }
  markersArray.length = 0;
}

function actualizaEstado(cod_alumbrado,estado){
    if (estado=="Funcionando") {
          estado="Inhabilitada";
        }else{
          estado="Funcionando";
        }
        $.ajax({
             type : "post",
             url : "proc/proc_alumbrado.php",
             data :{
                  cod_alumbrado:cod_alumbrado,
                  alum_mun:estado,
                  caso : 6
            }
        }); 
      ver(3);
  }