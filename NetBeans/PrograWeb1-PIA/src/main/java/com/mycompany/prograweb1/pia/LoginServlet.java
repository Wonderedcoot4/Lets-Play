/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.prograweb1.pia;

import UsuarioDBA.Usuario;
import Config.conexionSQL;
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
import java.sql.Connection;
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
    @Override
       protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        response.setContentType("text/jsp");
        PrintWriter out = response.getWriter();
        //Login de usuario y password
        String username = request.getParameter("emailUsuario");
        String password = request.getParameter("passUsuario");
        String stamentMySql = "Select * from usuario where NombreUsuario ='" + username + "' Contraseña'" + password + "'";
        try{
        Class.forName( "com.mysql.jdbc.Driver");
        conexion.getConnection();
        Connection con = conexion.conectar();
        
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from usuario where NombreUsuario='" + username  + "' and Contraseña ='" + password + "'"); 
            if (rs.next()) {
                response.sendRedirect("configuration.html");
            }
            else
            {
                out.println("No estas dado de alta");
            }
            
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        
       }
 

}
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