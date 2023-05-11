
package com.mycompany.programacion.web.pia;

import UsuarioDBA.Usuario;
import Config.conexionSQL;
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

/**
 *
 * @author isaac
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
     Usuario user = new Usuario();
     conexionSQL conexion = new conexionSQL();
     
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
        
    }
     
    @Override
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
         
        PrintWriter out = response.getWriter();
        HttpSession session;
        //Login de usuario y password
        String username = request.getParameter("emailUsuario");
        String password = request.getParameter("passUsuario");
        //session = request.getSession();
        
        Usuario instancia = new Usuario();
        String pantalla;
        Usuario log = (Usuario) instancia.LoginUsuario(username, password);;
        if (log.getIdUsuario()!= 0) {
            //session.setAttribute("UsuarioLog", log);
            request.setAttribute("UsuarioLog", log);
            //response.sendRedirect("dashboard.jsp");
            pantalla = "dashboard.jsp";
          
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

/*
response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //Login de usuario y password
        String username = request.getParameter("emailUsuario");
        String password = request.getParameter("passUsuario");
        String stamentMySql = "Select * from usuario where NombreUsuario ='" + username + "' Contraseña'" + password + "'";
        try{
        Class.forName( "com.mysql.jdbc.Driver");
        conexion.getConnection();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Prueba", "root", "123456" );
        
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from usuario where NombreUsuario='" + username  + "' and Contraseña ='" + password + "'"); 
            if (rs.next() ==  true) {
                HttpSession session = request.getSession();
                response.sendRedirect("Profile.jsp");
            }
            else
            {
                 out.println("No estas dado de alta");
                 response.sendRedirect("index.jsp");
            }
            
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        
       }
*/
/*
{
    
        response.setContentType("text/jsp");
        PrintWriter out = response.getWriter();
        //Login de usuario y password
        String username = request.getParameter("emailUsuario");
        String password = request.getParameter("passUsuario");
        String stamentMySql = "Select * from usuario where NombreUsuario ='" + username + "' Contraseña'" + password + "'";
        var obj = user;
        var isSuccess = obj.login(username, password);;
        if (isSuccess == true) {
            response.sendRedirect("Profile.jsp");
        }
        else
        {
            out.println("Usuario o contraseña incorrecto");
        }
       }
*/