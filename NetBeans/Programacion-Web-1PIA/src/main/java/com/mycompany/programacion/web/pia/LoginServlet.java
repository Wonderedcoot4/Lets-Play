
package com.mycompany.programacion.web.pia;

import UsuarioDBA.Usuario;
import Config.conexionSQL;
import PostDOA.Post;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author isaac
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
     Usuario user = new Usuario();
     conexionSQL conexion = new conexionSQL();
     Post post = new Post();
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        
    }
     
    @Override
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
         List<Post> postDatatable = new ArrayList<>();
        PrintWriter out = response.getWriter();
        HttpSession session;
        //Login de usuario y password
        String username = request.getParameter("emailUsuario");
        String password = request.getParameter("passUsuario");
        //session = request.getSession();
        
        Usuario instancia = new Usuario();
        String pantalla;
        Usuario log = (Usuario) instancia.LoginUsuario_sp(username, password);
        if (log.getIdUsuario()!= 0) {
            //session.setAttribute("UsuarioLog", log);
            request.setAttribute("UsuarioLog", log);
            //response.sendRedirect("dashboard.jsp");
            pantalla = "dashboard.jsp";
            postDatatable = post.consultarRecientes();
            if (postDatatable.size() == 0) {
                pantalla = "index.jsp";
                 out.println("Usuario o contraseña incorrecto");
            }
            else
            {
                request.setAttribute("PostRecientes", postDatatable);
            }
          
        }
        else
        {
            //response.sendRedirect("index.jsp");
             pantalla = "index.jsp";
            out.println("Usuario o contraseña incorrecto");
        }
       
       RequestDispatcher rd = request.getRequestDispatcher(pantalla);      
       rd.forward(request, response);
       }
}

