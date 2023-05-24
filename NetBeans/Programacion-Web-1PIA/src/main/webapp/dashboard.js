//Modal 1
const btnAbrirModal = document.querySelector("#btn-abrir-modal");
const btnCerrarModal = document.querySelector("#btn-cerrar-modal");
const modal = document.querySelector("#modal");

var pagActual = 1;
var cantPublicaciones = 10;
//var publicaciones;

$(document).ready(function(){
   var publicaciones; 
    getPublicacionesRecientes();
    //getPublicacionesIndex(0);
    getClicks();
});


btnAbrirModal.addEventListener("click",()=>{
    modal.showModal();
})

btnCerrarModal.addEventListener("click",()=>{
    modal.close();
})

//Modal2
const btnAbrirModal2 = document.querySelector("#btn-abrir-modal2");
const btnAbrirModal6 = document.querySelector("#btn-abrir-modal2");
const btnCerrarModal2 = document.querySelector("#btn-cerrar-modal2");
const btnCerrarModal6 = document.querySelector("#btn-cerrar-modal2");
const modal2 = document.querySelector("#modal2");

btnAbrirModal2.addEventListener("click",()=>{
    modal2.showModal();
})

btnCerrarModal2.addEventListener("click",()=>{
    modal2.close();
})

btnAbrirModal6.addEventListener("click",()=>{
    modal2.showModal();
})

btnCerrarModal6.addEventListener("click",()=>{
    modal2.close();
})



const btnBusquedaPost = document.querySelector("#botonBusquedaPost");



//Modal 3
const btnAbrirModal3 = document.querySelector("#btn-abrir-modal3");
const btnCerrarModal3 = document.querySelector("#btn-cerrar-modal3");
const modal3 = document.querySelector("#modal3");

btnBusquedaPost.addEventListener("click",()=>{
    limpiarDashboard();
   // getPublicacionBusqueda();
})

btnAbrirModal3.addEventListener("click",()=>{
    modal3.showModal();
})

btnCerrarModal3.addEventListener("click",()=>{
    modal3.close();
})

//Modal 4
const btnAbrirModal4 = document.querySelector("#btn-abrir-modal4");
const btnCerrarModal4 = document.querySelector("#btn-cerrar-modal4");
const modal4 = document.querySelector("#modal4");

btnAbrirModal4.addEventListener("click",()=>{
    modal4.showModal();
})

btnCerrarModal4.addEventListener("click",()=>{
    modal4.close();
})

function getDatosUsuario()
{
    console.log("Entrando al get de configuracion perfil")
}

function getClicks()
{
    $("#btnVerTodas").on("click", function(){
        limpiarDashboard();
        $("#PaginadorRow").show()    
    })
}

function limpiarDashboard()
{
    $("#DivRowPost").empty();
    //$("#ColumnaPost").empty();
    $("#rowPublicaciones").empty();
}

function getPublicacionesIndex(index)
{
    console.log("GET PUBLICACIONES INDEX")
    
    $.ajax({
        url:"CreatePost?accion=index&index=" + index
        ,type: "GET"
        ,dataType: "JSON"
        , success: function (data){
            console.log("data", data);
            publicaciones = data; //Ya con esto se despliega sola, quitarlo y listo
            /*PAGINADOR*/
            
            var claseAnt = "";
            if (pagActual == 1) {
                claseAnt = "disabled"
            }
            
            
            
            
            $("#PaginadorLi").empty();
            $("#PaginadorLi").addClass("pagination justify-content-center").append(
                    $("<li>").addClass("page-item").addClass(claseAnt).append("<a>").addClass("page-link").text("Anterior"));
            
            
            
            /*Publicacion de las paginas*/
            
            var total = data[0].TotalPublicaciones;
            var pags = Math.ceil(total/cantPublicaciones);
            
            for (var i = 0; i < pags; i++) {
                var claseActiva = '';
                if (pagActual == i +1) claseActiva = "active";
                    
                
                  $("#PaginadorLi").addClass("pagination justify-content-center").append(
                    $("<li>").addClass("page-item").addClass(claseActiva).append("<a>").addClass("page-link").text(i + 1)
                    );
            }
            
            var claseSig = "";
            if (pagActual == pags) {
                claseSig = "disabled"
            }
            
            
            
            $("#PaginadorLi").addClass("pagination justify-content-center").append(
                    $("<li>").addClass("page-item").addClass(claseSig).append("<a>").addClass("page-link").text("Siguiente"));
            
          
            
            for (var i = 0; i < Object.keys(data).length; i++) {
                var kevin =  data[i].FotoPublicacion.toString().substring(data[i].FotoPublicacion.toString().indexOf("Imagenes"));
                $("#DivRowPost").append(
                                    $("<div>").addClass("feed").append
                            (
                                    $("<div>").addClass("post").attr("id", "idPublicacion" + data[i].idPublicacion).append
                                        (
                                        $("<div>").addClass("post_avatar").append(
                                           $("<img>").attr("src", kevin).attr("height", "50px").attr("width", "50px") 
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
                                                $("<img>").attr("src", kevin).attr("height", "200px").attr("width", "200px")))).append(
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
  
                getPaginadorClicks();
        }
        , error: function(error)
        {
            console.log("Error", error);
        }
        
    })
}



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


function getPublicacionesRecientes()
{
    console.log("GET PUBLICACIONES RECIENTES")
    
                $.ajax({
                    url:"CreatePost?accion=Recientes"
                    ,type: "GET"
                    ,dataType: "JSON"
                    , success: function (data) {
                        console.log("data", data);
                        publicaciones = data;
                        
                        for (var i = 0; i < Object.keys(data).length; i++)
                        {
                            console.log("Data 1", data[i]);
                            
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
                    
                })
           
}



/*
 * 
 * 
 * 
 * 
 * 
 * 
 * {
                            console.log("Data 1", data[i]);
                            
                            $("#DivRowPost").append(
                                    $("<div>").addClass("feed").append
                            (
                                    $("<div>").addClass("post").attr("id", "idPublicacion" + data[i].idPublicacion).append
                                        (
                                        $("<div>").addClass("post_avatar").append(
                                           $("<img>").attr("background-image : url=Imagenes/JustPlay.png") 
                                           ).append
                                          (
                                            $("<div>").addClass("post_body").append
                                            (
                                            $("<div>").addClass("post_header colorText").append( 
                                                $("<h5>").text(data[i].NombreUsuario).append(
                                                $("<span>").addClass("post__headerSpecial").text(data[i].Categoria))).append(
                                            $("<div>").addClass("post__headerDescription colorText").append(
                                                $("<h4>").text(data[i].Titulo).append(
                                                $("<p>").text(data[i].Contenido)/*Aqui ira el footer de post*///).append(
                                      /*          $("<div>").addClass("post__footer").append(
                                                    $("<div>").addClass("col allignIcon colorIcon").append(
                                                                $("<button>").addClass("btn colorIcon").append(
                                                                    $("<i>").addClass("icon ion-ios-heart iconConfig")))))))
                                            )
                                           )
                                            
                                        )
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                             )
                                
                                    
                                    
                                   
                                   
                                    
                                    
                                );
                            
                            
                        }*/
 /* 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
    $("<img>").attr("background-image : url=Imagenes/JustPlay.png")).append(
                                    $("<div>").addClass("post_body").append(
                                    $("<div>").addClass("post_header colorText").append(
                                    $("<h5>").text(data[i].NombreUsuario).append(
                                    $("<span>").addClass("post__headerSpecial").text(data[i].Categoria))).append(
                                        $("<div>").addClass("post__headerDescription colorText").append(
                                        $("<h4>").text(data[i].Titulo).append(
                                        $("<p>").text(data[i].Contenido)))
                                            )
                                       )
                                        
                                    )
                                  )

*/
/* asi se escribe o algo asi
 * 
 *  $("#PostCentro").append(
                                    $("<div>").addClass("post").append(
                                    $("<h1>").text(data[i].Contenido))
                                   
                                   
                                    
                                    
                                );
                            
 * 
 */

function getPaginadorClicks()
{
    $(".page-item").on("click", function() 
    {
        console.log("THIS", $(this).text());
        var index = 0;
        var item = $(this).text();
        
//        if ($(this).hasClass("disabled")) {
//            
//        }
        if (!$(this).hasClass("disabled")) {
              
            if (item == "Siguiente") {
                
            item = pagActual + 1;
            }else if (item == "Anterior") {
            item = pagActual - 1;
            }
            
            
           
            pagActual = item;
            console.log("Pagina actual" + pagActual);
            index = (item*cantPublicaciones) - cantPublicaciones;
            limpiarDashboard();
            getPublicacionesIndex(index);
        }
      
    });
}


 function check(input)
 {
    	
    	var checkboxes = document.getElementsByName()("categoria");
    	
    	for(var i = 0; i < checkboxes.length; i++)
    	{
    		//uncheck all
    		if(checkboxes[i].checked == true)
    		{
                        console.log(checkboxes[i].toString());
    			checkboxes[i].checked = false;
    		}
    	}
    	
    	//set checked of clicked object
    	if(input.checked == true)
    	{
    		input.checked = false;
    	}
    	else
    	{
    		input.checked = true;
    	}	
}

$("#c01").click(function(){
	if($("#c01").is(':checked'))
  	$("#c02").prop("checked", false);
});