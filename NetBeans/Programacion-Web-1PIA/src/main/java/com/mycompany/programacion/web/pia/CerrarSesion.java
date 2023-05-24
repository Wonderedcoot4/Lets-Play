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


@WebServlet(name = "CerrarSesion", urlPatterns = {"/CerrarSesion"})
public class CerrarSesion extends HttpServlet {
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
            out.println("<title>Servlet CerrarSesion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CerrarSesion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Pantalla = "";
        Pantalla = "Principal.jsp";
        
        
        if (usuario != null ) {
            
             
             usuario.CerrarSesion();
             Pantalla = "Principal.jsp";
        
        }
              RequestDispatcher rd = request.getRequestDispatcher(Pantalla);      
                rd.forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String Pantalla = "";
        Pantalla = "Principal.jsp";
        
        
        if (usuario != null ) {
            
             usuario.CerrarSesion();
             Pantalla = "Principal.jsp";
        
        }
              RequestDispatcher rd = request.getRequestDispatcher(Pantalla);      
                rd.forward(request, response);
        
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
