
package com.mycompany.programacion.web.pia;

import Config.conexionSQL;
import UsuarioDBA.Usuario;
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

/**
 *
 * @author isaac
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 + 10,
        maxRequestSize = 1024 * 1024 * 50)
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
        
        Part part = request.getPart("archivito");
        
        String NombreArchivo;
        NombreArchivo = extractFileName(part);
        String dirSave = "C:\\Users\\isaac\\Desktop\\Programacion Web 1\\Programacion-Web\\NetBeans\\PrograWeb1-PIA\\src\\main\\webapp\\Imagenes\\" + File.separator + NombreArchivo;
        File fileSaveDir = new File(dirSave);
        
        part.write(fileSaveDir + File.separator);
        
        //SI NO ESTA REPETIDO DEBE ENTRAR AL DALSE
         Boolean isRepited = user.noseRepite(Usuario); //SI ES TRUE ES QUE YA EXISTE, SI ES FALSE NO Y SE REGISTRA
         
        if ( isRepited == true) {
            response.sendRedirect("Registro.jsp");
            System.out.println("EL USUARIO YA ESTA REPETIDO");
            return;
        }
        Boolean isMailRepited = user.CorreoNoRepeat(Email);
        if ( isMailRepited == true) {
            response.sendRedirect("Registro.jsp");
            System.out.println("EL CORREO YA ESTA REPETIDO");
            return;
        }
         Boolean isSuccess = user.InsertarImagen(Nombre, ApellidoPaterno, ApellidoMaterno, Email, FechaNacimiento, Usuario, pass, fileSaveDir);
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
