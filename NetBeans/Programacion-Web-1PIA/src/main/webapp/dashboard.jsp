<%-- 
    Document   : dashboard
    Created on : 24 mar 2023, 22:34:00
    Author     : isaac
--%>

<%@page import="java.util.List"%>
<%@page import="PostDOA.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="UsuarioDBA.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script  src="./DataTable/datatables.min.js"></script>
    <link href="./DataTable/datatables.min.css" rel="stylesheet">
   
    <script defer src="dashboard.js"></script>
    <title>Principal | Justplay</title>
</head>

<body class="colorBody slideBarScroll">
     <%
      
      Usuario usuario = new Usuario();
      Usuario usuario2 = new Usuario();
      List<Post> postEncontrado = new ArrayList<>();
      
     
      // usuario = (Usuario) request.getSession().getAttribute("UsuarioLog");
      
      //System.out.println("Usuario dashboard " + usuario);
     // String text;
      //usuario = (Usuario) session.getAttribute("UsuarioLog");
      
      usuario2 = (Usuario) request.getAttribute("UsuarioLog");
      postEncontrado = (List) request.getAttribute("PostRecientes");
       if (request.getAttribute("UsuarioLog") == null) 
       {
           RequestDispatcher rd = request.getRequestDispatcher("index.jsp");      
           rd.forward(request, response);
        
       }
       else{
      System.out.println("Usuario dashboard : " + usuario2.getUsuario());
      System.out.println("Correo dashboard : " + usuario2.getCorreo());
      System.out.println("Foto dashboard : " + usuario2.getFotografia());
     }
     
    %>
    <div class="static">
        <nav class="navbar navbar-expand-lg navColor">
            <div class="col alingImage">
                <a class="navbar-brand" href="#"><img src="./Imagenes/JustPlay2.png" alt="logo" width="55px" class="rounded-circle"></a>
            </div>
            <div class="col">
                <form class="d-flex position-relative" method="get" action="BusquedaPostServlet">
                   <!-- <button class="btn colorIcon" type="submit" id="btn-abrir-modal3" ><i class="icon ion-md-menu"></i></button> -->
                    <!-- AQUI ES PARA LA BUSQUEDA NORMAL -->
                    
                        <input class="form-control colorSearchBar colorText" type="text" placeholder="Buscar" name="barrabusquedakev" id="BarraBusqueda" aria-label="Buscar" required>
                    
                        <button class="btn position-absolute btn-search colorIcon" id="botonBusquedaPost" type="submit"><i class="icon ion-md-search"></i></button>
                </form>
                
            </div>
                        <form action="ProfileConfigServlet" method="get" >
                <input type="hidden" name="UserName" value="<% out.print(usuario2.getUsuario()); %>">
                 <input type="hidden" name="AccionServlet" value="<%out.print("Recientes"); %>">
                <button type="submit" class="btn colorIcon" ><i class="icon ion-md-construct iconConfig"><a>Configuracion</a></i></button>
          <!--  <a type="submit" href="configuration.jsp" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-construct iconConfig"></i></i>
                Configuración</a>  -->
            </form>  
                <form action="ProfileInfoServlet" method="get">
                <button type="submit" class="btn colorIcon" ><i class="icon ion-md-body iconConfig"></i><a>
                        Perfil</a></button>
            </form>
                <form action="CerrarSesion" method="post">
                <button type="submit" class="btn colorIcon" ><i class="icon ion-md-construct iconConfig"><a>Cerrar Sesion</a></i></button>
            </form>
            <div class="col alingFlex">
                <button type="button" class="mybutton" data-bs-container="body" id="btn-abrir-modal2">
                    <img src="<%
                    String imagen2 = usuario2.getFotografia();
                    int index2 = imagen2.indexOf("Imagenes");
                    
                    if (index2 != -1) {
                            String result = imagen2.substring(index2);
                            out.print(result);
                        }
                    
                    %>" alt="logo" width="55px" class="rounded-circle"></a>
            </div>


        </nav>
    </div>
    <div class="d-flex corrector" id="content-wrapper">
        <div id="sidebar-container" class="">
            <div class="logo">
                <h4 class="text-light font-weight-bold mb-0">Categorías</h4>
            </div>
            
            <div class="menu">
               <a href="PostporCategoriasServlet?catPost=1" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-star"></i></i>
                    Lucha</a>

                <a href="PostporCategoriasServlet?catPost=3 " class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-star"></i></i>
                    Clásicos</a>

                <a href="PostporCategoriasServlet?catPost=4" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-star"></i></i>
                    Plataformas</a>
                <a href="PostporCategoriasServlet?catPost=8" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-star"></i></i>
                    Independientes</a>
                <a href="PostporCategoriasServlet?catPost=7" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-star"></i></i>
                    Familiares</a>
                <a href="PostporCategoriasServlet?catPost=6" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-star"></i></i>
                    Carreras</a>
                <a href="PostporCategoriasServlet?catPost=2" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-star"></i></i>
                    Acción y Aventura</a>
                <a href="PostporCategoriasServlet?catPost=9" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-star"></i></i>
                    Disparos</a>
                 <a href="BusquedaAvanzada.jsp" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-star"></i></i>
                    Busqueda Avanzada</a>
                
            </div>
        </div>
        
      
        
        <div class="container mr-1">
            <div class="row" id="ColumnaPost">
                <div class="col" id="DivRowPost">
                    <div class="feed" id="rowPublicaciones">
                        <!--Post-->
                      
                        <!--Termina Post-->
            <table id="tablapublicaciones">
            <thead>
            <tr>
                <th></th>
            </tr>
            </thead>
            <tbody>
                <%
                Post post = new Post();
                for(Post elemento:postEncontrado)
                {
                %>
                <tr><td>
                        
                        
                        <div class="post" id="PostCentro">
                            <div class="post__avatar">
                                <img src=" <%
                    String imagen4 = elemento.getFotoPerfil();
                    int index4 = imagen4.indexOf("Imagenes");
                    
                    if (index4 != -1) {
                            String result = imagen4.substring(index4);
                            out.print(result);
                        }
                    
                                %>">
                            </div>
                            <div class="post__body">
                                <div class="post__header">
                                    <div class="post__headerText colorText">
                                        <h3>
                                           <% out.print(elemento.getUsuario()); %>
                                            <span class="post__headerSpecial"><% out.print(elemento.getCategoria()); %></span>
                                        </h3>
                                    </div>
                                    <div class="post__headerDescription colorText">
                                        <h4><% out.print(elemento.getTitulo()); %></h4>
                                        <p><% out.print(elemento.getContenido()); %></p>
                                        <img src="<%
                    String imagen5 = elemento.getFoto();
                    int index5 = imagen5.indexOf("Imagenes");
                    
                    if (index5 != -1) {
                            String result = imagen5.substring(index5);
                            out.print(result);
                        }
                    
                                %>
                                             ">
                                    </div>
                                </div>
                                <div class="post__footer">
                                    <div class="col allignIcon colorIcon">
                                        <button class="btn colorIcon" type="submit"><i class="icon ion-ios-heart iconConfig"></i></button>
                                    </div>
                                    <div class="col allignIcon colorIcon">
                                        <button class="btn colorIcon" type="submit"><i class="icon ion-md-share iconConfig"></i></button>
                                    </div>
                                    <div class="col allignIcon colorIcon">
                                        <button class="btn colorIcon" type="submit" id="btn-abrir-modal4"><i class="icon ion-md-flower iconConfig"></i></button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        
                    </div>
                
                                 
                    </td></tr>
                <%
                    }
                %>
            </tbody>
            
        </table>

                </div>
                      <div class="sticky-bottom" style="text-align: right;">
                        <button type="button" class="buttonPubli" data-bs-container="body" id="btn-abrir-modal">
                            <img src="./Imagenes/boton.png" width="80px" ></a>
                        </button>
                    </div>
                <div class="row" id="PaginadorRow" style="display: none">              
                     <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center" id="PaginadorLi">
                                             <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                          <li class="page-item"><a class="page-link" href="#">1</a></li>
                                     <li class="page-item"><a class="page-link" href="#">2</a></li>
                                   <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                          </ul>
                     </nav>
                </div>
            
                
            </div>
        </div>
          <footer class="bg-dark text-center text-white">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
          <p>Pagina creada por:</p>
          <p>Edson Eduardo Arguello Tienda & Isaac Espinoza Morales</p>
          <p>LMAD | UANL</p>

        </div>
      </footer> 
    </div>
            
            
    
      <!--Obtencion de info usuario -->
   
    
    
    
    
    <!--Aquie se crea el post
    Titulo, Contenido y Foto-->
    <dialog id="modal" class="dialog1">
        <form action="CreatePost" method="post" name="postForm" enctype="multipart/form-data">
        <div class="row">
            <div class="col-11"></div>
            <div class="col-1">
                <button class="btn colorIcon" id="id-no-cerrar" ><i class="icon ion-md-close iconConfig"></i></button>
            </div>
        </div>
        <div class="row">
            <input class="inTitle colorText" type="text" name="TituloText" placeholder="Titulo..." required>
        </div>
        <div class="row">
            <textarea name="Contenido"class="inText colorText" id="exampleFormControlTextarea1" placeholder="¿Que estas pensando?" rows="10" required></textarea>
        </div>
        <div class="row">
            <div class="post__footer">
                <div class="col colorIcon">
                    <div class="checkbox-inline">
                      <select name="Categoria" id="cbCategoria">
                    <option value="AccionyAventura" name="categoriacb">Accion y Aventura</option>
                    <option value="Lucha" name="categoriacb">Lucha</option>
                    <option value="Carreras" name="categoriacb">Carreras</option>
                    <option value="Clasicos" name="categoriacb">Clasicos</option>
                    <option value="Plataformas" name="categoriacb">Plataformas</option>
                    <option value="Independientes" name="categoriacb">Independientes</option>
                    <option value="Familiares" name="categoriacb">Familiares</option>
                    <option value="Disparos" name="categoriacb">Disparos</option>
                    
                    </select>
                    <input class="form-check-input" type="hidden" id="c07" name="UsuarioActual" value="<% out.print(usuario2.getUsuario());  %>">
                 
                </div>
                    <!--<button class="btn colorIcon" type="submit"><i class="icon ion-md-image iconConfig"></i></button> Boton Original como estaba antes de cambiarse, en caso de querer agregarlo-->
                    <input class="input" type="file" accept=".jpg, .jpeg, .png" name="Fotografia" required>
                    <!--<button class="btn colorIcon" type="submit"><i class="icon ion-md-compass iconConfig"></i></button>
                    <button class="btn colorIcon" type="submit"><i class="icon ion-md-happy iconConfig"></i></button>-->
                </div>
                <div class="col-1">
                    <!--EL BOTON ESTA LLAMADO AL SERVLET CUIDADO-->
                    <button class="btn colorIcon" id="btn-cerrar-modal"><i class="icon ion-md-send iconConfig"></i></button>
                </div>
                
            </div>
        </div>
        </form>
    </dialog>

    <!--End post-->
    
    
    <!--Informacion Usuario Modal-->
    

    
  
   <!-- <a href="#" class="UsuarioTag" style="display: none" name="UsuarioStore">
                    <% out.print(usuario2.getUsuario()); %></a>     -->
    <dialog id="modal2">
        
        <div class="row">
            <button type="button" class="mybutton" data-bs-container="body" id="btn-abrir-modal2">
                <img src="<%
                    String imagen = usuario2.getFotografia();
                    int index = imagen.indexOf("Imagenes");
                    
                    if (index != -1) {
                            String result = imagen.substring(index);
                            out.print(result);
                        }
                    
                    %>" alt="logo" width="80px" class="rounded-circle"></a>
            </button>
        </div>
        <div class="row colorText allignIcon">
            <h3 name="UsuarioDash"> <% out.print(usuario2.getUsuario()); %> </h3>
            <p  name="CorreoDash"class="post__headerSpecial"> <% out.print(usuario2.getCorreo()); %></p>
        </div>
        <div class="row colorText allignIcon">
            <form action="ProfileInfoServlet" method="get">
                <button type="submit" class="btn colorIcon" ><i class="icon ion-md-body iconConfig"></i><a>
                        Perfil</a></button>
            </form>
            <form action="ProfileConfigServlet" method="get" >
                <input type="hidden" name="UserName" value="<% out.print(usuario2.getUsuario()); %>">
                 <input type="hidden" name="AccionServlet" value="<%out.print("Recientes"); %>">
                <button type="submit" class="btn colorIcon" ><i class="icon ion-md-construct iconConfig"><a>Configuracion</a></i></button>
          <!--  <a type="submit" href="configuration.jsp" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-construct iconConfig"></i></i>
                Configuración</a>  -->
            </form>    
            <form action="CerrarSesion" method="post">
                <button type="submit" class="btn colorIcon" ><i class="icon ion-md-construct iconConfig"><a>Cerrar Sesion</a></i></button>
            </form>
        </div>
        <div class="row">
            <button class="btn colorIcon" id="btn-cerrar-modal2"><i class="icon ion-md-close iconConfig"></i></button>
    </div>
        
    </dialog>

    <dialog id="modal3">
        <div class="row">
            <div class="col-11"></div>
            <div class="col-1">
                <button class="btn colorIcon" id="btn-cerrar-modal3"><i class="icon ion-md-close iconConfig"></i></button>
            </div>
        </div>
        <div class="row">
            <h2 class="colorText allignIcon">Busqueda Avanzada</h2>
        </div>
        <div class="row marginSearch">
            <textarea class="inText colorText" id="exampleFormControlTextarea1" placeholder="Buscar..." rows="3"></textarea>
        </div>
        <div class="row">  
            <button class="btn SelectBox dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                Categorías
            </button>
                <ul class="dropdown-menu dropdown-menu-dark">
                <li><a class="dropdown-item active" href="#">Lucha</a></li>
                <li><a class="dropdown-item" href="#">Clásicos</a></li>
                <li><a class="dropdown-item" href="#">Plataformas</a></li>
                <li><a class="dropdown-item" href="#">Independientes</a></li>
                <li><a class="dropdown-item" href="#">Familiares</a></li>
                <li><a class="dropdown-item" href="#">Carreras</a></li>
                <li><a class="dropdown-item" href="#">Acción y Aventura</a></li>
                <li><a class="dropdown-item" href="#">Disparos</a></li>
                </ul>
        </div>
        <div class="row">
            <div class="col">
                <label for="text" class="colorText">Fecha Inicial</label>
                <input type="date" class="input colorText" id="date" required autocomplete="off">
            </div>
            <div class="col">
                <label for="text" class="colorText">Fecha Final</label>
                <input type="date" class="input colorText" id="date" required autocomplete="off">
            </div>
        </div>
        <div class="row">
            <div class="post__footer">
                <div class="col colorIcon">
                </div>
                <div class="col-1">
                    <button class="btn colorIcon"><i class="icon ion-md-search"></i></button>
                </div>
            </div>
        </div>
    </dialog>

    <dialog id="modal4">
        <div class="row">
            <div class="col-11"></div>
            <div class="col-1">
                <button class="btn colorIcon" id="btn-cerrar-modal4"><i class="icon ion-md-close iconConfig"></i></button>
            </div>
        </div>
        <div class="row">
            <input class="inTitle colorText" type="text" name="title" placeholder="Titulo..." value="Hola soy nuevo">
        </div>
        <div class="row">
            <textarea class="inText colorText" placeholder="¿Que estas pensando?" rows="10">Hola soy nuevo, pero no nuevo de nacer, nuevo en la pagina.</textarea>
        </div>
        <div class="row">
            <div class="post__footer">
                <div class="col colorIcon">
                    <button class="btn colorIcon" type="submit"><i class="icon ion-md-image iconConfig"></i></button>
                    <button class="btn colorIcon" type="submit"><i class="icon ion-md-compass iconConfig"></i></button>
                    <button class="btn colorIcon" type="submit"><i class="icon ion-md-happy iconConfig"></i></button>
                    <button class="btn colorIcon" type="submit"><i class="icon ion-md-trash iconConfig"></i></button>
                </div>
                <div class="col-1">
                    <button class="btn colorIcon"><i class="icon ion-md-send iconConfig"></i></button>
                </div>
            </div>
        </div>
    </dialog>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
      <script>
        $(document).ready(function() {
            $('#tablapublicaciones').DataTable({
                "paging":true,
                "pagingType":"full_numbers",
                "dom": '<"top"lp>rt<"bottom"lp><"clear">',
                "language": {
                    "emptyTable": "Aún no hay publicaciones, ¡sé el primero!",
                    "paginate": {
                        "previous": "Anterior",
                        "next": "Siguiente",
                        "first": "Inicio",
                        "last":"Final"
                    }
                },
                "ordering":false,
                "searching":false,
                "lengthChange":false,
                "pageLength":10
            });
        });
    </script>  

<script src="dashboard.js"></script>

</body>
</html>

