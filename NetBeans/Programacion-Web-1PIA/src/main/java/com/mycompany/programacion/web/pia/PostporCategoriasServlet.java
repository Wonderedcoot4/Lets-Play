
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
import java.util.List;
import org.json.simple.JSONObject;

@WebServlet(name = "PostporCategoriasServlet", urlPatterns = {"/PostporCategoriasServlet"})
public class PostporCategoriasServlet extends HttpServlet {
    
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
            out.println("<title>Servlet PostporCategoriasServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostporCategoriasServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Post postito = new Post();
        String Accion = request.getParameter("catPost");
        String Categoria = request.getParameter("accion");
          String pantalla = "";
        if ("1".equals(Accion)) {
            String cat ="Lucha";
                System.out.println("Recientes, entrando en el get" + cat);
            List<Post> pubs = instancia.busquedaPostCategoria(cat);
            System.out.println("Pubs: " + pubs.get(0).getTitulo());
            request.setAttribute("UsuarioLog", usuario);
            postito.getPostBuscado();
            pantalla ="PostPorCategoria.jsp";
            request.getSession(false).setAttribute("Accion", cat);
               
        }
         if ("2".equals(Accion)) {
            String cat ="AccionyAventura";
                System.out.println("Recientes, entrando en el get" + cat);
            List<Post> pubs = instancia.busquedaPostCategoria(cat);
            System.out.println("Pubs: " + pubs.get(0).getTitulo());
            request.setAttribute("UsuarioLog", usuario);
            postito.getPostBuscado();
            pantalla ="PostPorCategoria.jsp";
            request.getSession(false).setAttribute("Accion", cat);
               
        }
      
         response.sendRedirect(pantalla);
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
