
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

@WebServlet(name = "CreatePost", urlPatterns = {"/CreatePost"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 + 10,
        maxRequestSize = 1024 * 1024 * 50)
public class CreatePost extends HttpServlet {
    conexionSQL conexion = new conexionSQL();
    Post instancia = new Post();
    Post post = new Post();
    Usuario us = new Usuario();
    Usuario usuario = (Usuario)us.UsuarioLog();
    
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
             String Accion = request.getParameter("accion");
            // String index = request.getParameter("Index");
        
            
            if ("Recientes".equals(Accion)) {
            
        
                System.out.println("Recientes, entrando en el get" + Accion);
            List<Post> pubs = instancia.consultarRecientes();
            System.out.println("Pubs: " + pubs.get(0).getTitulo());
            PrintWriter out = response.getWriter();
            JSONObject json = new JSONObject();
            
                for (int i = 0; i < pubs.size(); i++) {
                    JSONObject jsoncito = new JSONObject();
                    jsoncito.put("idPublicacion", pubs.get(i).getId());
                    jsoncito.put("Contenido", pubs.get(i).getContenido());
                    jsoncito.put("Titulo", pubs.get(i).getTitulo());
                    jsoncito.put("FotoPublicacion", pubs.get(i).getFoto());
                    jsoncito.put("NombreUsuario", pubs.get(i).getUsuario());
                    jsoncito.put("idCategoria", pubs.get(i).getIdCat());
                    jsoncito.put("idEstatusPost", pubs.get(i).getIdEstatus());
                    jsoncito.put("EstatusPublicacion", pubs.get(i).getEstatus());
                    jsoncito.put("Categoria", pubs.get(i).getCategoria());
                    jsoncito.put("FechaCreacion", pubs.get(i).getFecha());
                    
                    json.put(i, jsoncito);
                    
                }
                System.out.println("Json : " +  json);
                out.print(json);
            }
            List<Post> publis = null;
            if ("index".equals(Accion)) 
            {
                 //int indice = Integer.parseInt(Accion);
                 String Indice = request.getParameter("index");
                 int indice = Integer.parseInt(Indice);
                 System.out.println("Recientes, entrando en el get con indice" + indice);
                 publis = instancia.consultarPublicacionesIndex(indice, 10);
                 PrintWriter out = response.getWriter();
                 JSONObject json = new JSONObject();
                 int totalPubs = instancia.consultarTotal();
                for (int i = 0; i < publis.size(); i++) {
                    JSONObject jsoncito = new JSONObject();
                    jsoncito.put("TotalPublicaciones", totalPubs);
                    jsoncito.put("idPublicacion", publis.get(i).getId());
                    jsoncito.put("Contenido", publis.get(i).getContenido());
                    jsoncito.put("Titulo", publis.get(i).getTitulo());
                    jsoncito.put("FotoPublicacion", publis.get(i).getFoto());
                    jsoncito.put("NombreUsuario", publis.get(i).getUsuario());
                    jsoncito.put("idCategoria", publis.get(i).getIdCat());
                    jsoncito.put("idEstatusPost", publis.get(i).getIdEstatus());
                    jsoncito.put("EstatusPublicacion", publis.get(i).getEstatus());
                    jsoncito.put("Categoria", publis.get(i).getCategoria());
                    jsoncito.put("FechaCreacion", publis.get(i).getFecha());
                    
                    json.put(i, jsoncito);
                    
                }
                  System.out.println("Json : " +  json);
                  out.print(json);

            }
        
    }
    
        
        
       
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       //Verificar como mandar el request de login otra vez que es lo que marca error
        //response.setContentType("text/jsp");
        String Title;
        String Titulo = request.getParameter("TituloText");
        String Contenido = request.getParameter("Contenido");
        String Categoria = request.getParameter("Categoria"); 
        String UsuarioDash = request.getParameter("UsuarioActual"); 
        String Estatus = "Activo";
        String filename = null;
        Part part = request.getPart("Fotografia");
        filename = extractFileName(part);
         List<Post> postDatatable = new ArrayList<>();
//        System.out.println("Filename " + filename);
//        if (filename != "") {
//            System.out.println("WRITE " + filename);
//        }//40:30 O POR AHI
        
        String pantalla;
        String NombreArchivo;
       
        NombreArchivo = extractFileName(part);
        String dirSave = "C:\\Users\\isaac\\Desktop\\Programacion Web 1\\Programacion-Web\\NetBeans\\Programacion-Web\\NetBeans\\Programacion-Web-1PIA\\src\\main\\webapp\\Imagenes" + File.separator + NombreArchivo;
        File fileSaveDir = new File(dirSave);
        part.write(fileSaveDir + File.separator);
        int i = -1;
        
        int obj = instancia.agregarPost(Titulo, Contenido, Estatus, Categoria, fileSaveDir, UsuarioDash);
        if (obj == 0) {
            postDatatable = post.consultarRecientes();
            if (postDatatable.size() == 0) {
                pantalla = "index.jsp";
                out.println("Sobrecarga de informacion");
            }
             else
            {
                request.setAttribute("PostRecientes", postDatatable);
            }
             System.out.println("Kevin se la come por que entramos al get");
             request.setAttribute("UsuarioLog", usuario);
             pantalla = "dashboard.jsp";
             System.out.println("Saliendo del get");
            //response.sendRedirect("dashboard.jsp");
            System.out.println("Realizado");
        }
        else{
             pantalla = "dashboard.jsp";
             System.out.println("No se publico");
        }
        
        RequestDispatcher rd = request.getRequestDispatcher(pantalla);      
        rd.forward(request, response);
       
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
    
    private void getPublicacionRecientes(HttpServletRequest request)
    {
         
    }
    
    
}
