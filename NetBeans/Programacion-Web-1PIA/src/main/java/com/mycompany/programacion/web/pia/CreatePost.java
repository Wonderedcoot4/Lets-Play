
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

@WebServlet(name = "CreatePost", urlPatterns = {"/CreatePost"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 + 10,
        maxRequestSize = 1024 * 1024 * 50)
public class CreatePost extends HttpServlet {
    conexionSQL conexion = new conexionSQL();
    Post instancia = new Post();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/jsp;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreatePost</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreatePost at " + request.getContextPath() + "</h1>");
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
       //Verificar como mandar el request de login otra vez que es lo que marca error
        response.setContentType("text/jsp");
        String Title;
        String Titulo = request.getParameter("TituloText");
        String Contenido = request.getParameter("Contenido");
        String Categoria = request.getParameter("categoria"); 
        String UsuarioDash = request.getParameter("UsuarioDash"); 
        String Estatus = "Activo";
        
        Part part = request.getPart("Fotografia");
        
        String NombreArchivo;
        NombreArchivo = extractFileName(part);
        String dirSave = "C:\\Users\\isaac\\Desktop\\Programacion Web 1\\Programacion-Web\\NetBeans\\Programacion-Web-1PIA\\src\\main\\webapp\\Imagenes" + File.separator + NombreArchivo;
        File fileSaveDir = new File(dirSave);
        part.write(fileSaveDir + File.separator);
        int i = -1;
        String pantalla;
        boolean obj = instancia.agregarPost(Titulo, Contenido, Estatus, Categoria, fileSaveDir, UsuarioDash);
        if (obj) {
            response.sendRedirect("dashboard.jsp");
            System.out.println("Realizado");
            return;
        }
        else{
             response.sendRedirect("dashboard.jsp");
             System.out.println("No se publico");
        }
       
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
