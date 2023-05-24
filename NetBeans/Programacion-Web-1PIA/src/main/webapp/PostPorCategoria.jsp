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
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
        <link href="./DataTable/datatables.min.css" rel="stylesheet">
        <script defer src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
        <script  src="./DataTable/datatables.min.js"></script>
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
                    <div class="d-flex position-relative">
                        <button class="btn colorIcon" id="btn-abrir-modal3" ><i class="icon ion-md-menu"></i></button>
                        <input class="form-control colorSearchBar colorText" type="search" placeholder="Buscar" aria-label="Buscar">
                        <button class="btn position-absolute btn-search colorIcon" ><i class="icon ion-md-search"></i></button>
                    </div>
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
        
        <table id="tablapublicaciones">
            <thead>
            <tr>
                <th></th>
            </tr>
            </thead>
            <tbody>
                <%
                Post post = new Post();
                for(Post elemento:post.busquedaPostCategoria((String) request.getSession(false).getAttribute("Accion")))
                {
                %>
                <tr><td>
                     <div class="feed" id="rowPublicaciones">
                        <!--Post-->
                      
                        <!--Termina Post-->
                        
                        
                        
                        <div class="post" id="PostCentro">
                            <div class="post__avatar">
                                <img src="" height="125px" width="50px">
                            </div>
                            <div class="post__body">
                                <div class="post__header">
                                    <div class="post__headerText colorText">
                                        <h3>
                                            <% out.print(elemento.getTitulo()); %>
                                            <span class="post__headerSpecial"></span>
                                        </h3>
                                    </div>
                                    <div class="post__headerDescription colorText">
                                        <h4></h4>
                                        <p><</p>
                                        <img src=" 
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
    </body>
</html>