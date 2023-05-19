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

/**
 *
 * @author isaac
 */
@WebServlet(name = "ProfileConfigServlet", urlPatterns = {"/ProfileConfigServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 + 10,
        maxRequestSize = 1024 * 1024 * 50)
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
        //Hacemos otro servlet y ya
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
      //  String Accion = request.getParameter("AccionServlet");
        String pantalla = "";
        String NombreArchivo;
        
       
        
        
        
        String Accion = request.getParameter("AccionServlet");
        if ("UpdatePerfil".equals(Accion)) {
            
        
            System.out.print("Actualizar usuario sin foto, entrando en el post " + Accion);
            String Nombre = request.getParameter("Nombre");
            String ApellidoP = request.getParameter("ApellidoP");
            String ApellidoM = request.getParameter("ApellidoM");
            String Correo = request.getParameter("Correo");
            String Usuario = request.getParameter("Usuario");
            String Pass = request.getParameter("password");
            String FechaNacimiento = request.getParameter("FechaNacimiento");
            
            
            
            Usuario success = new Usuario();
            success = (Usuario) instancia.UpdateUsuario_sp(Nombre, ApellidoP, ApellidoM, Correo, FechaNacimiento, Usuario, Pass);
            
            if (success.getIdUsuario() != 0) {
                Usuario us = new Usuario();
                us = (Usuario) instancia.UsuarioLog();
                request.setAttribute("UsuarioLog", us);
                pantalla = "configuration.jsp";
                out.println("Listo update, intentando regresar y refresacar");
            }
        }
        
        if ("UpdateFoto".equals(Accion)) {
             Part part = request.getPart("archivo");
               NombreArchivo = extractFileName(part);
        
              String dirSave = "C:\\Users\\isaac\\Desktop\\Programacion Web 1\\Programacion-Web\\NetBeans\\Programacion-Web-1PIA\\src\\main\\webapp\\Imagenes" + File.separator + NombreArchivo;
             File fileSaveDir = new File(dirSave);
             part.write(fileSaveDir + File.separator);
            Usuario us = new Usuario();
            Usuario usua = new Usuario();
            
            
            us = (Usuario) instancia.UsuarioLog();
            
            usua = (Usuario) instancia.UpdateUsuarioFoto_sp(fileSaveDir);
            if (usua.getIdUsuario() != 0) {
       
                 System.out.println("Actualizar foto");
                 request.setAttribute("UsuarioLog", us);
                 pantalla = "configuration.jsp";
                out.println("Listo update, intentando regresar y refresacar");
                        
            }
            
            
            
            
        }
        RequestDispatcher rd = request.getRequestDispatcher(pantalla);      
        rd.forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
      private String extractFileName(Part part)
    {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
    
    

}
