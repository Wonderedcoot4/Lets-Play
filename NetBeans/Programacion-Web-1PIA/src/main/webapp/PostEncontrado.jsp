<%-- 
    Document   : PostEncontrado
    Created on : 23 may 2023, 2:22:27
    Author     : isaac
--%>

<%@page import="PostDOA.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <script defer src="dashboard.js"></script>
            <title>JSP Page</title>
    </head>
    <body class="slideBarScroll" style="background-color: black">
        <div class="static">
            <nav class="navbar navbar-expand-lg navColor">
                <div class="col alingImage">
                    <form action="ReturnToDashboard" method="get">
                    <button style="background-color: black"class="btn colorIcon" href="#"><img src="./Imagenes/JustPlay2.png" alt="logo" width="45px" class="rounded-circle"></button>
                    </form>
                </div>
                <div class="col">
                    
                </div>
                <div class="col alingFlex">
                    <button type="button" class="mybutton" data-bs-container="body" id="btn-abrir-modal2">
                        <img src="./Imagenes/icon.png" alt="logo" width="55px" class="rounded-circle"></a>
                </div>
            </nav>
        </div>
        <br>
        <br>
        <br>
        
        
        <%
          Post postEncontrados = new Post(); 
          String accion;
          accion = (String) request.getSession(false).getAttribute("Accion");
        %>
        
        <%
            
           for(Post elemento:postEncontrados.busquedaPublicaciones(accion))
           {
           
           
            
        %>
        
        <div class="feed" id="rowPublicaciones">
                        <!--Post-->
                      
                        <!--Termina Post-->
                        
                        
                        
                        <div class="post" id="PostCentro">
                            <div class="post__avatar">
                                <img src="<%
                    String imagen2 = elemento.getFotoPerfil();
                    int index2 = imagen2.indexOf("Imagenes");
                    
                    if (index2 != -1) {
                            String result = imagen2.substring(index2);
                            out.print(result);
                        }
                    
                                %>" height="125px" width="50px">
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
                                        <img src=" <%
                    String imagen3 = elemento.getFoto();
                    int index3 = imagen3.indexOf("Imagenes");
                    
                    if (index3 != -1) {
                            String result = imagen3.substring(index3);
                            out.print(result);
                        }
                    
                    %>">
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
        
        <%
            
            }
            %>
            <footer class="bg-dark text-center text-white">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
          <p>Pagina creada por:</p>
          <p>Edson Eduardo Arguello Tienda & Isaac Espinoza Morales</p>
          <p>LMAD | UANL</p>

        </div>
      </footer> 
    </body>
</html>