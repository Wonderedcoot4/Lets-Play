/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function(){
   var publicaciones; 
   getPublicacionBusqueda()
    //getPublicacionesIndex(0);
    //getClicks();
});


function getPublicacionBusqueda()
{
    console.log("GET PUBLICACIONES busqueda");
    var param = document.getElementById("BarraBusqueda");
               // window.location.href = "BusquedaPostServlet?accion=" + param.value;
                $.ajax({
                    url:"BusquedaPostServlet"
                    ,type: "GET"
                    ,dataType: "JSON"
                    , success: function (data) {
                        console.log("data", data);
                        publicaciones = data;
                          console.log(" busqueda");
                        for (var i = 0; i < Object.keys(data).length; i++)
                        {
                            console.log("Data 1", data[i]);
                            var kevin =  data[i].FotoPublicacion.toString().substring(data[i].FotoPublicacion.toString().indexOf("Imagenes"));
                            var kevin2 =  data[i].FotoPerfl.toString().substring(data[i].FotoPerfl.toString().indexOf("Imagenes"));
                            $("#DivRowPost").append(
                                    $("<div>").addClass("feed").append
                            (
                                    $("<div>").addClass("post").attr("id", "idPublicacion" + data[i].idPublicacion).append
                                        (
                                        $("<div>").addClass("post_avatar").append(
                                           $("<img>").attr("src", kevin2).attr("height", "200px").attr("width", "200px") 
                                           )
                                        ).append(
                                        $("<div>").addClass("post_body").append(
                                         $("<div>").addClass("post__header").append(
                                            $("<div>").addClass("post__headerText colorText").append(
                                                $("<h5>").text(data[i].NombreUsuario).append(
                                                $("<span>").addClass("post__headerSpecial").text(data[i].Categoria)))).append(
                                            $("<div>").addClass("post__headerDescription colorText").append(
                                                $("<h4>").text(data[i].Titulo).append(
                                                $("<p>").text(data[i].Contenido))).append(
                                                $("<img>").addClass("rounded-circle").attr("src", kevin).attr("height", "200px").attr("width", "200px")))).append(
                                            $("<div>").addClass("post__footer").append(
                                                $("<div>").addClass("col allignIcon colorIcon").append(
                                                    $("<button>").addClass("btn colorIcon").append(
                                                        $("<i>").addClass("icon ion-ios-heart iconConfig")))).append(
                                                $("<div>").addClass("col allignIcon colorIcon").append(
                                                    $("<button>").addClass("btn colorIcon").append(
                                                        $("<i>").addClass("icon ion-md-share iconConfig"))))))
                                    
                             )
                             
                                    
                                );
                            
                        }
        }
                    
                });
           
}
