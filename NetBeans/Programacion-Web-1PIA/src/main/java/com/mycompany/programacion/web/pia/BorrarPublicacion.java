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


@WebServlet(name = "BorrarPublicacion", urlPatterns = {"/BorrarPublicacion"})
public class BorrarPublicacion extends HttpServlet {
conexionSQL conexion = new conexionSQL();
    Post instancia = new Post();
    Post post = new Post();
    Usuario us = new Usuario();
    Usuario usuario = (Usuario)us.UsuarioLog();
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BorrarPublicacion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BorrarPublicacion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String pantalla = "";
        String idPost = request.getParameter("postIdInput"); 
        int idDelPost = Integer.parseInt(idPost);
        boolean success = post.borrarPost(idDelPost);
        if (success) {
            System.out.println("Entramos al post y fue exitoso");
             request.setAttribute("UsuarioLog", usuario);
             pantalla = "Profile.jsp";
             System.out.println("Saliendo del get");
            //response.sendRedirect("dashboard.jsp");
             System.out.println("Realizado");
        }
        else{
            pantalla = "Profile.jsp";
             System.out.println("No se publico");
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(pantalla);      
        rd.forward(request, response);
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
