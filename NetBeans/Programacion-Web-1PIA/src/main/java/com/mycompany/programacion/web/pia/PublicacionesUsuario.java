/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.programacion.web.pia;


import Config.conexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import PostDOA.Post;
import UsuarioDBA.Usuario;
import jakarta.servlet.RequestDispatcher;
import static java.lang.System.out;
import java.util.List;
import org.json.simple.JSONObject;


@WebServlet(name = "PublicacionesUsuario", urlPatterns = {"/PublicacionesUsuario"})
public class PublicacionesUsuario extends HttpServlet {
     private Usuario us = new Usuario();
    Usuario instancia = new Usuario();
    Post inst = new Post();
    conexionSQL con = new conexionSQL();
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PublicacionesUsuario</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PublicacionesUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String pantalla = "";
        String accion = request.getParameter("accion");
        System.out.println("Entrando al get");
        us = (Usuario) instancia.UsuarioLog();
        
        
       if ("Recientes".equals(accion)) {
            
                String usuario = us.getUsuario();
            System.out.println("Recientes, entrando en el get" + accion);
            List<Post> pubs = inst.consultarPublicacionesUsuario(usuario);
            System.out.println("Pubs: " + pubs.get(0).getTitulo());
            PrintWriter out = response.getWriter();
            JSONObject json = new JSONObject();
            
                for (int i = 0; i < pubs.size(); i++) {
                    JSONObject jsoncito = new JSONObject();
                    jsoncito.put("idPublicacion", pubs.get(i).getId());
                    jsoncito.put("Contenido", pubs.get(i).getContenido());
                    jsoncito.put("Titulo", pubs.get(i).getTitulo());
                    jsoncito.put("FotoPublicacion", pubs.get(i).getFoto());
                    jsoncito.put("NombreUsuario", pubs.get(i).getUsuario());
                    jsoncito.put("idCategoria", pubs.get(i).getIdCat());
                    jsoncito.put("idEstatusPost", pubs.get(i).getIdEstatus());
                    jsoncito.put("EstatusPublicacion", pubs.get(i).getEstatus());
                    jsoncito.put("Categoria", pubs.get(i).getCategoria());
                    jsoncito.put("FechaCreacion", pubs.get(i).getFecha());
                    
                    json.put(i, jsoncito);
                    
                }
                System.out.println("Json : " +  json);
                out.print(json);
            }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
