
$(document).ready(function(){
   var publicaciones; 
   getPublicacionesUsuario();
});

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

btnAbrirModal6.addEventListener("click",()=>{
    modal6.showModal();
})

btnCerrarModal6.addEventListener("click",()=>{
    modal6.close();
})

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
                            console.log("Recuperando");
                            console.log("Data : " + data[i]);
                            
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
                                                        $("<button>").addClass("btn colorIcon").attr("id", data[i].data[i].idPublicacion).attr("name", "ButtonEditPost").append(
                                                            $("<i>").addClass("icon ion-md-flower iconConfig")))))))
                                    
                                
                                
                
                        }
                        
                        
                    }
                });
           
           
           
}
/*
 * $("<div>").addClass("post__avatar").append(
                                        $("<img>").attr("src",  data[i].FotoPublicacion)).append(
                                    $("<div>").addClass("post_body").append(
                                        $("<div>").addClass("post_header").append(
                                            $("<div>").addClass("post__headerText colorText").append(
                                                $("<h3>").text(data[i].NombreUsuario).append(
                                                $("<span>").addClass("post__headerSpecial").text(data[i].Categoria)))).append(
                                        $("<div>").addClass("post__headerDescription colorText").append(
                                            $("<h4>").text(data[i].Titulo).append(
                                            $("<p>").text(data[i].Contenido))))).append(
                                            ))
                            )
 * 
 * 
 * 
 * 
 */




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
