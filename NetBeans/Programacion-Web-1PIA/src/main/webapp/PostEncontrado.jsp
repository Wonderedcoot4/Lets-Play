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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
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
                                <img src="<% out.print(elemento.getFotoPerfil()); %>">
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
    </body>
</html>
