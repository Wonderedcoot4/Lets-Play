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
import java.util.List;
import org.json.simple.JSONObject;

/**
 *
 * @author isaac
 */
@WebServlet(name = "ProfileConfigServlet", urlPatterns = {"/ProfileConfigServlet"})
public class ProfileConfigServlet extends HttpServlet {
    private Usuario us = new Usuario();
    Usuario instancia = new Usuario();
    conexionSQL con = new conexionSQL();
    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileConfigServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileConfigServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pantalla = "";
        System.out.println("Entrando al get");
        us = (Usuario) instancia.UsuarioLog();
         String Accion = request.getParameter("accion");
        System.out.println("Usuario actual :  " + us.getUsuario() + "Correo : " + us.getCorreo());
        
        if("Return".equals(Accion))
        {
            System.out.println("Regresando al dashboard");
           
            pantalla = "dashboard.jsp";
            
            request.setAttribute("UsuarioLog", us);
            System.out.println("Regresando...");
        }
        else if (Accion == null) {
            
         if (us == null) {
            System.out.println("Error no se recupero el Usuario");
            request.setAttribute("UsuarioLog", us);
            pantalla = "dashboard.jsp";
            }
            else{
            System.out.println("Entrando a la pantalla de configuracion");
            request.setAttribute("UsuarioLog", us);
            pantalla = "configuration.jsp";
        
         }
        }
        RequestDispatcher rd = request.getRequestDispatcher(pantalla);      
        rd.forward(request, response);
        
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String accion = request.getParameter("accion");
        
        if ("UpdateUser".equals(accion)) {
            System.out.print("Actualizar usuario sin foto, entrando en el post " + accion);
            String Nombre = request.getParameter("");
            String ApellidoP = request.getParameter("");
            String ApellidoM = request.getParameter("");
            String Correo = request.getParameter("");
            String Usuario = request.getParameter("");
            String Pass = request.getParameter("");
            String FechaNacimiento = request.getParameter("");
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
