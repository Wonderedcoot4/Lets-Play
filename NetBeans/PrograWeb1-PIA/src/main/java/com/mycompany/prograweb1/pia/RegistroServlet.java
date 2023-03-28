/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.prograweb1.pia;

import Config.conexionSQL;
import UsuarioDBA.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author isaac
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {
    conexionSQL conexion = new conexionSQL();
    Usuario user = new Usuario();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/jsp;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistroServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegistroServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/jsp");
        String Nombre = request.getParameter("Nombretext");
        String ApellidoPaterno = request.getParameter("ApAtext");
        String ApellidoMaterno = request.getParameter("ApMtext");
        String Email = request.getParameter("CorreoText");
        String FechaNacimiento = request.getParameter("FechaBirthDTP");
        String Usuario = request.getParameter("UsuarioText");
        String pass = request.getParameter("Passwordtext");
        
        var obj = user;
        //SI NO ESTA REPETIDO DEBE ENTRAR AL DALSE
         var isRepited = obj.noseRepite(Usuario); //SI ES TRUE ES QUE YA EXISTE, SI ES FALSE NO Y SE REGISTRA
         
        if ( isRepited == true) {
            response.sendRedirect("Registro.jsp");
            System.out.println("EL USUARIO YA ESTA REPETIDO");
            return;
        }
         var isSuccess = obj.Registro(Nombre, ApellidoPaterno, ApellidoMaterno, Email, FechaNacimiento, Usuario, pass);
            if (isSuccess) {
            response.sendRedirect("index.jsp");
         }
         else
         {
           response.sendRedirect("Registro.jsp");
         }
             // String ContraseñaConfirm = request.getParameter("");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
