<%-- 
    Document   : Profile
    Created on : 22 mar 2023, 23:15:55
    Author     : Isaac Espinoza y Edson Arguello
--%>

<%@page import="UsuarioDBA.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="profile.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
   
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
    <script defer src="profile.js"></script>
    <title>Perfil | Justplay</title>
</head>


<%
    Usuario usuario = new Usuario();
    usuario = (Usuario) request.getAttribute("UsuarioLog");
    String user = usuario.getUsuario();
    String nombre = usuario.getNombre();
    String ApellidoP = usuario.getApellidoP();
    String ApelidoM = usuario.getApellidoM();
    String correo = usuario.getCorreo();
    String Foto = usuario.getFotografia();
    
    String NombreCompleto = nombre + " " + ApellidoP + " " + ApelidoM;
    
    
    String info;

%>

<body class="colorBody slideBarScroll">
   
    <div class ="static">
        <nav class="navbar navbar-expand-lg navColor">
            
                <div class="col alingImage">
                    <form action="ReturnToDashboard" method="get">
                        <button type="submit" class="btn colorIcon"><a class="navbar-brand" type="submit"><img src="./Imagenes/JustPlay2.png" alt="logo" width="55px" class="rounded-circle"></a></button>
                    </form>
                </div>
                <div class="col">
                    <form class="d-flex position-relative">
                        <button class="btn colorIcon" type="submit"><i class="icon ion-md-menu" id="btn-abrir-modal6"></i></button>
                        <input class="form-control colorSearchBar colorText" type="search" placeholder="Buscar" aria-label="Buscar">
                        <button class="btn position-absolute btn-search colorIcon" type="submit"><i class="icon ion-md-search"></i></button>
                    </form>
                </div>
                <div class="col alingFlex">
                    <button type="button" class="mybutton" data-bs-container="body" id="btn-abrir-modal5">
                        <img src="<%
                    String imagen2 = usuario.getFotografia();
                    int index2 = imagen2.indexOf("Imagenes");
                    
                    if (index2 != -1) {
                            String result = imagen2.substring(index2);
                            out.print(result);
                        }
                    
                    %>" id="imagenPerfil" alt="logo" width="55px" class="rounded-circle"></a>
                    </button>
                </div>
        </nav>
    </div>

    <div class="seccion-perfil-usuario corrector">
        <div class="perfil-usuario-header">
            <div class="perfil-usuario-portada">
                <div class="perfil-usuario-avatar">
                    <img src="<%
                    String imagen3 = usuario.getFotografia();
                    int index3 = imagen3.indexOf("Imagenes");
                    
                    if (index3 != -1) {
                            String result = imagen3.substring(index3);
                            out.print(result);
                        }
                    
                    %>" alt="img-avatar">
                </div>
                
            </div>
        </div>
        <div class="perfil-usuario-body">
            <div class="perfil-usuario-bio">
                <h3 class="titulo" name="UsuarioPerfil"> <% out.print(user); %> </h3>
            </div>
            <div class="perfil-usuario-footer">
                <ul class="lista-datos">
                    <li>Nombre:</li>
                    <li>Usuario:</li>
                    <li>Email:</li>
                   <!-- <li>Edad:</li> -->
                </ul>
                <ul class="lista-datos">
                    <li><% out.print(NombreCompleto); %></li>
                    <li><% out.print(user); %></li>
                    <li><% out.print(correo ); %></li>
                 <!--   <li>20 años</li>  -->
                </ul>
            </div>
            
            <div class="publicacion-body">
                <div class="row" id="DivRowPost">
                    <p class="text-publi">Publicaciones</p>
                </div>
                <div class="post" >
                    <div class="post__avatar">
                        <img src="./Imagenes/icon.png">
                    </div>
                    <div class="post__body">
                        <div class="post__header">
                            <div class="post__headerText colorText">
                                <h3>
                                    NachtDenos
                                    <span class="post__headerSpecial">#Disparos</span>
                                </h3>
                            </div>
                            <div class="post__headerDescription colorText">
                                <h4>Hola soy nuevo</h2>
                                <p>Hola soy nuevo, pero no nuevo de nacer, nuevo en la pagina.</p>
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
                                <button class="btn colorIcon" id="btn-abrir-modal4" type="submit"><i class="icon ion-md-flower iconConfig"></i></button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <footer class="bg-dark text-center text-white">
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
              <p>Pagina creada por:</p>
              <p>Edson Eduardo Arguello Tienda & Isaac Espinoza Morales</p>
              <p>LMAD | UANL</p>

            </div>
          </footer>
    </div>



    <dialog id="modal5">
            <div class="row">
                <button type="button" class="mybutton" data-bs-container="body" id="btn-abrir-modal5">
                    <img src="<%
                    String imagen4 = usuario.getFotografia();
                    int index4 = imagen4.indexOf("Imagenes");
                    
                    if (index4 != -1) {
                            String result = imagen4.substring(index4);
                            out.print(result);
                        }
                    
                    %>" alt="logo" width="80px" class="rounded-circle"></a>
                </button>
            </div>
            <div class="row colorText allignIcon">
                <h3>NachtDenos</h3>
                <p class="post__headerSpecial">eeatienda2001@hotmail.com</p>
            </div>
            <div class="row colorText allignIcon">
                <a href="Profile.jsp" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-body iconConfig"></i></i></i>
                    Perfil</a>

                <a href="configuration.jsp" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-construct iconConfig"></i></i>
                    Configuración</a>

                <a href="Principal.jsp" class="d-block colorText texHover p-3 border-0"><i class="icon ion-md-exit iconConfig"></i></i>
                    Cerrar Sesión</a>
            </div>
            <div class="row">
                <button class="btn colorIcon" id="btn-cerrar-modal5"><i class="icon ion-md-close iconConfig"></i></button>
        </div>
    </dialog>

    <dialog id="modal6">
            <div class="row">
                <div class="col-11"></div>
                <div class="col-1">
                    <button class="btn colorIcon" id="btn-cerrar-modal6"><i class="icon ion-md-close iconConfig"></i></button>
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
         <form action="EditarPublicacionServlet" method="post" name="postForm">
        <div class="row">
            <div class="col-11"></div>
            <div class="col-1">
                <button class="btn colorIcon" id="btn-cerrar-modal4"><i class="icon ion-md-close iconConfig"></i></button>
            </div>
        </div>
        <div class="row">
            <input class="inTitle colorText" type="text" name="title" id="TituloPostModal" placeholder="Titulo..." value="Hola soy nuevo">
        </div>
        <div class="row">
             
            <textarea name="Contenido" class="inText colorText" placeholder="¿Que estas pensando?" rows="10" id="ContenidoPostModal">Hola soy nuevo, pero no nuevo de nacer, nuevo en la pagina.</textarea>
            <select name="Categoria" id="cbCategoria">
                    <option value="AccionyAventura" name="categoria">Accion y Aventura</option>
                    <option value="Lucha" name="categoria">Lucha</option>
                    <option value="Carreras" name="categoria">Carreras</option>
                    <option value="Clasicos" name="categoria">Clasicos</option>
                    <option value="Plataformas" name="categoria">Plataformas</option>
                    <option value="Independientes" name="categoria">Independientes</option>
                    <option value="Familiares" name="categoria">Familiares</option>
                    
                </select>
           
            <input type="hidden" id="postId" name="postIdInput">
            
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
                    <button type="submit" class="btn colorIcon"><i class="icon ion-md-send iconConfig"></i></button>
                </div>
            </div>
        </div>
         </form>
    </dialog>
                
     <dialog id="modal12">
         <form action="BorrarPublicacion" method="post" name="postForm">
        <div class="row">
            <div class="col-11"></div>
            <div class="col-1">
                <button class="btn colorIcon" id="btn-cerrar-modal4"><i class="icon ion-md-close iconConfig"></i></button>
            </div>
        </div>
        <div class="row">
            <input class="inTitle colorText" type="text" name="title2" id="TituloPostModal2" placeholder="Titulo..." value="Hola soy nuevo">
        </div>
        <div class="row">
             
            <textarea name="Contenido" class="inText colorText" placeholder="¿Que estas pensando?" rows="10" id="ContenidoPostModal2">Hola soy nuevo, pero no nuevo de nacer, nuevo en la pagina.</textarea>
            <select name="Categoria" id="cbCategoria2">
                    <option value="AccionyAventura" name="categoria">Accion y Aventura</option>
                    <option value="Lucha" name="categoria">Lucha</option>
                    <option value="Carreras" name="categoria">Carreras</option>
                    <option value="Clasicos" name="categoria">Clasicos</option>
                    <option value="Plataformas" name="categoria">Plataformas</option>
                    <option value="Independientes" name="categoria">Independientes</option>
                    <option value="Familiares" name="categoria">Familiares</option>
                    
                </select>
           
            <input type="" id="postId3" name="postIdInput">
            <input type="" id="postId4" name="postIdInput2">
            
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
                    <button type="submit" class="btn colorIcon"><i class="icon ion-md-send iconConfig"></i></button>
                </div>
            </div>
        </div>
         </form>
    </dialog>
            


 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>