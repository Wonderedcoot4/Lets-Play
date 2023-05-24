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
import java.util.ArrayList;
import java.util.List;
import org.json.simple.JSONObject;


@WebServlet(name = "BusquedaAvanzada", urlPatterns = {"/BusquedaAvanzada"})
public class BusquedaAvanzada extends HttpServlet {
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
            out.println("<title>Servlet BusquedaAvanzada</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BusquedaAvanzada at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            Post postito = new Post();
            List<Post> postFound = new ArrayList<>();
             String textico = request.getParameter("TituloPost");
             String textico2 = request.getParameter("ContenidoPost");
             String Categoria = request.getParameter("catselec");
             String Fecha1 = request.getParameter("fechainicialname");
             String Fecha2 = request.getParameter("fechafinalname");
              String pantalla = "";
        
            System.out.println("Busqueda entrando en el get");
            List<Post> pubs = instancia.busquedaAvanzada(textico, textico2, Categoria, Fecha1, Fecha2);
            if (pubs.size() == 0) {
            System.out.println("Error no se encontro nada");
             pantalla = "BusquedaAvanzada.jsp";
            }
            else
            {
            request.setAttribute("UsuarioLog", usuario);
            postito.getPostBuscado();
             pantalla = "PostBusquedaAvanzada.jsp";
                System.out.println("Saliendo del get");
            //response.sendRedirect("dashboard.jsp");
             System.out.println("Realizado");
            System.out.println("Pubs: " + pubs.get(0).getTitulo());
            postito.setPostBuscado(pubs);
            postFound = pubs;
             request.getSession(false).setAttribute("Postfound", postFound);
            }
        
            RequestDispatcher rd = request.getRequestDispatcher(pantalla);      
            rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
