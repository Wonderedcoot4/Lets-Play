
$(document).ready(function(){
   var publicaciones; 
   getPublicacionesUsuario();
  

   var botonesEditar = document.getElementsByClassName('editar');
   console.log(botonesEditar);
    for (var i = 0; i < botonesEditar.length; i++) {
        var botonEditar = botonesEditar[i];
        console.log(botonEditar);
        botonEditar.addEventListener('click', function(){
            console.log("Me diste click");
            
            
            modal4.showModal();
        })
    }
    
    
    
    
   
});
// var fotoPerfil = document.getElementById("#imagenPerfil").src;
// console.log(fotoPerfil);
 
  var fotoPerfil = $('#imagenPerfil').attr('src');
 
 
//Modal2
const btnAbrirModal5 = document.querySelector("#btn-abrir-modal5");
const btnCerrarModal5 = document.querySelector("#btn-cerrar-modal5");

const modal5 = document.querySelector("#modal5");

btnAbrirModal5.addEventListener("click",()=>{
    modal5.showModal();
})

btnCerrarModal5.addEventListener("click",()=>{
    modal5.close();
})


//Modal 3
const btnAbrirModal6 = document.querySelector("#btn-abrir-modal6");
const btnCerrarModal6 = document.querySelector("#btn-cerrar-modal6");
const modal6 = document.querySelector("#modal6");


//Modal 4
const btnAbrirModal8 = document.querySelector("#btn-abrir-modal4");
const btnCerrarModal8 = document.querySelector("#btn-cerrar-modal4");
const modal4 = document.querySelector("#modal4");


btnAbrirModal6.addEventListener("click",()=>{
    modal6.showModal();
})

btnCerrarModal6.addEventListener("click",()=>{
    modal6.close();
})

btnAbrirModal8.addEventListener("click",()=>{
    console.log("Entro al click event");
    modal4.showModal();
})

btnCerrarModal8.addEventListener("click",()=>{
    modal4.close();
})


$(document).on("click", ".editar", function(){
    var nombre;
    alert("Editar publicacion!!");
    
    modal4.showModal();
    var Nombre= document.getElementById("modal4");
    var Nombre2= document.getElementById("DivRowPost");
            var TituloPost = Nombre2.querySelector("#id");
            var Elemento = Nombre.querySelector("#TituloPostModal");
            var Elemento2 = Nombre.querySelector("#ContenidoPostModal");
            var Elemento2 = Nombre.querySelector("#ContenidoPostModal");
            Elemento.value = this.dataset.titulo;
            Elemento2.value = this.dataset.contenido;
            
}); 


function getPublicacionesUsuario()
{
    console.log("GET PUBLICACIONES RECIENTES");
    
                $.ajax({
                    
                    url:"PublicacionesUsuario?accion=Recientes"
                    ,type: "GET"
                    ,dataType: "JSON"
                    , success: function (data) {
                        console.log("data", data);
                        publicaciones = data;
                          console.log("Entro el ajax");
                        for (var i = 0; i < Object.keys(data).length; i++) 
                        {
                            //Hazlo un form 
                            console.log("Recuperando");
                            console.log("Data : " + data[i]);
                            
                            var kevin =  data[i].FotoPublicacion.toString().substring(data[i].FotoPublicacion.toString().indexOf("Imagenes"));
                            $("#DivRowPost").addClass("row").append(
                                    $("<div>").addClass("post").attr("id", data[i].idPublicacion).append(
                                        $("<div>").addClass("post_avatar").append(
                                            $("<img>").addClass("rounded-circle").attr("src", fotoPerfil).attr("height", "50px").attr("width", "50px"))).append(
                                        $("<div>").addClass("post_body").append().append(
                                            $("<div>").addClass("post_header").append(
                                                 $("<div>").addClass("post__headerText colorText").append(
                                                    $("<h3>").text(data[i].NombreUsuario).append(
                                                    $("<span>").addClass("post__headerSpecial").text(data[i].Categoria)))).append(
                                                 $("<div>").addClass("post__headerDescription colorText").append(
                                                    $("<h4>").text(data[i].Titulo).append(
                                                    $("<p>").text(data[i].Contenido)).append(
                                                    $("<img>").attr("src", kevin).attr("height", "200px").attr("width", "200px"))))).append(
                                                 $("<div>").addClass("post__footer").append(
                                                   $("<div>").addClass("col allignIcon colorIcon").append(
                                                        $("<button>").addClass("btn colorIcon").append(
                                                            $("<i>").addClass("icon ion-ios-heart iconConfig")))).append(
                                                   $("<div>").addClass("col allignIcon colorIcon").append(
                                                        $("<button>").addClass("btn colorIcon").append(
                                                            $("<i>").addClass("icon ion-md-share iconConfig")))).append(
                                                   $("<div>").addClass("col allignIcon colorIcon").append(
                                                        $("<button>").addClass("btn colorIcon").addClass("editar").attr("data-titulo", data[i].Titulo).attr("data-contenido", data[i].Contenido).attr("data-foto", data[i].FotoPublicacion).attr("data-Categoria", data[i].Categoria).attr("type", "submit").attr("id", "btn-abrir-modal4").attr("name", "ButtonEditPost").append(
                                                            $("<i>").addClass("icon ion-md-flower iconConfig")))))))
                                    
                                
                                
                
                        }
                        
                        
                    }
                });
           
           
           
}
//Codigo para ser un form 
/*
 *  $("#DivRowPost").addClass("row").append(
                                   $("<form>").attr("id", "FormPublicacion").append(
                                    $("<div>").addClass("post").attr("id", data[i].idPublicacion).append(
                                        $("<div>").addClass("post_avatar").append(
                                            $("<img>").attr("src", data[i].FotoPublicacion))).append(
                                    $("<div>").addClass("post_body").append(
                                        $("<div>").addClass("post_header").append(
                                            $("<div>").addClass("post__headerText colorText").append(
                                                $("<input>").addClass("inTitle colorText").attr("value", data[i].NombreUsuario).append(
                                                    $("<h3>").text(data[i].NombreUsuario))))))))
 * 
 * 
 */





//Codigo para solo traer post
/*
 $("#DivRowPost").addClass("row").append(
                                    $("<div>").addClass("post").append(
                                        $("<div>").addClass("post_avatar").append(
                                            $("<img>").attr("src", data[i].FotoPublicacion))).append(
                                        $("<div>").addClass("post_body").append().append(
                                            $("<div>").addClass("post_header").append(
                                                 $("<div>").addClass("post__headerText colorText").append(
                                                    $("<h3>").text(data[i].NombreUsuario).append(
                                                    $("<span>").addClass("post__headerSpecial").text(data[i].Categoria)))).append(
                                                 $("<div>").addClass("post__headerDescription colorText").append(
                                                    $("<h4>").text(data[i].Titulo).append(
                                                    $("<p>").text(data[i].Contenido))))).append(
                                                 $("<div>").addClass("post__footer").append(
                                                   $("<div>").addClass("col allignIcon colorIcon").append(
                                                        $("<button>").addClass("btn colorIcon").append(
                                                            $("<i>").addClass("icon ion-ios-heart iconConfig")))).append(
                                                   $("<div>").addClass("col allignIcon colorIcon").append(
                                                        $("<button>").addClass("btn colorIcon").append(
                                                            $("<i>").addClass("icon ion-md-share iconConfig")))).append(
                                                   $("<div>").addClass("col allignIcon colorIcon").append(
                                                        $("<button>").addClass("btn colorIcon").attr("name", "ButtonEditPost").append(
                                                            $("<i>").addClass("icon ion-md-flower iconConfig")))))))
                                    



/*
  $("#DivRowPost").append(
                                    $("<div>").addClass("feed").append
                            (
                                    $("<div>").addClass("post").attr("id", "idPublicacion" + data[i].idPublicacion).append
                                        (
                                        $("<div>").addClass("post_avatar").append(
                                           $("<img>").attr("background-image : url=Imagenes/JustPlay.png") 
                                           )
                                        ).append(
                                        $("<div>").addClass("post_body").append(
                                         $("<div>").addClass("post__header").append(
                                            $("<div>").addClass("post__headerText colorText").append(
                                                $("<h5>").text(data[i].NombreUsuario).append(
                                                $("<span>").addClass("post__headerSpecial").text(data[i].Categoria)))).append(
                                            $("<div>").addClass("post__headerDescription colorText").append(
                                                $("<h4>").text(data[i].Titulo).append(
                                                $("<p>").text(data[i].Contenido))))).append(

*/
