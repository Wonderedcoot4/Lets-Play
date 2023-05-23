

package PostDOA;
import Config.conexionSQL;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
public class Post {
    
    private int id;
    private String Titulo;
    private String contenido;
    private int userID;
    private String Fecha;
    private String Usuario;
    private int IdCat;
    private int IdEstatus;
    private String Categoria;
    private String Estatus;
    private String FotoPerfil;
    private List<Post> postBuscado = new ArrayList<>();

    public String getFotoPerfil() {
        return FotoPerfil;
    }

    public void setFotoPerfil(String FotoPerfil) {
        this.FotoPerfil = FotoPerfil;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

    public List<Post> getPostBuscado() {
        return postBuscado;
    }

    public void setEstatus(String Estatus) {
        this.Estatus = Estatus;
    }

    public String getCategoria() {
        return Categoria;
    }

    public String getEstatus() {
        return Estatus;
    }

    public void setIdCat(int IdCat) {
        this.IdCat = IdCat;
    }

    public void setIdEstatus(int IdEstatus) {
        this.IdEstatus = IdEstatus;
    }

    public int getIdCat() {
        return IdCat;
    }

    public int getIdEstatus() {
        return IdEstatus;
    }
    
    
    
    public String getTitulo() {
        return Titulo;
    }

    public String getUsuario() {
        return Usuario;
    }

    public String getFoto() {
        return Foto;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }
    
    public void setFoto(String Foto) {
        this.Foto = Foto;
    }
    private String Foto;
    
   
    public Post()
    {
      
        
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }
    /*
     public Post(int id, String titulo, String Contenido, String fechaCreacion, int idUsuario )
    {
        //Pendiente revisar lo de IdEstatusPublicacion
        this.id = id;
        this.Titulo = titulo;
        this.contenido = Contenido;
        this.Fecha = fechaCreacion;
        this.userID = idUsuario;
        
    }
    */
    conexionSQL con = new conexionSQL();
    Connection cn;
        //No jalara ahoria con los cambios que hice al nuevo crear post, 
//    public int agregarPost(String Titulo, String Contenido, String Estatus, String Categoria)
//    {
//        try {
//              con.getConnection();
//              cn = con.conectar();
//            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd:mm:ss");
//            LocalDateTime now = LocalDateTime.now();
//            String fecha = java.time.LocalDate.now().toString();
//            String statement = "{CALL crearPost(?,?,?,?,?)}";
//            PreparedStatement stm = cn.prepareCall(statement);
//            stm.setString(1, Titulo);
//            stm.setString(2, Contenido);
//            stm.setString(3, Estatus);
//            stm.setString(4, fecha);
//            stm.setString(5, Categoria);
//            //Por si no aparezco toy en el bañño 
//            stm.execute();
//            con.desconectar();
//            return 0;
//            
//        } catch (Exception e) {
//            System.out.println("Error no se inserto en la DB");
//            System.out.println(e.toString());
//            con.desconectar();
//            return 1;
//        }
//  
//    }
//    
    public int agregarPost(String Titulo, String Contenido, String Estatus, String Categoria, File Fotografia, String Usuario)
    {
        try
        {
              con.getConnection();
              cn = con.conectar();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd:mm:ss");
            String Fotito = Fotografia.toString();
            LocalDateTime now = LocalDateTime.now();
            String fecha = java.time.LocalDate.now().toString();
            String statement = "{CALL creacionPost(?,?,?,?,?,?,?)}";
            PreparedStatement stm = cn.prepareCall(statement);
            stm.setString(1, Titulo);
            stm.setString(2, Contenido);
            stm.setString(3, Estatus);
            stm.setString(4, Categoria);
            stm.setString(5, Fotito);
            stm.setString(6, Usuario);
            stm.setString(7, fecha);
            stm.execute();
            con.desconectar();
            return 0;
        }
        catch(Exception e)
        {
            System.out.println("Error no se inserto en la DB");
            System.out.println(e.toString());
            return 1;
        }
        finally
        {
            con.desconectar();
        }
    }
    
    
    
    public boolean crearPost(String Titulo, String Contenido, String Estatus, String Categoria, File Fotografia)
    {
        try
        {
              con.getConnection();
              cn = con.conectar();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd:mm:ss");
            String Fotito = Fotografia.toString();
            LocalDateTime now = LocalDateTime.now();
            String fecha = java.time.LocalDate.now().toString();
            String statement = "{CALL creacionPostSinUsuario(?,?,?,?,?)}";
            PreparedStatement stm = cn.prepareCall(statement);
            stm.setString(1, Titulo);
            stm.setString(2, Contenido);
            stm.setString(3, Estatus);
            stm.setString(4, Categoria);
            stm.setString(5, Fotito);
            stm.execute();
            con.desconectar();
            return true;
        }
        catch(Exception e)
        {
            System.out.println("Error no se inserto en la DB");
            System.out.println(e.toString());
            return false;
        }
        finally
        {
            con.desconectar();
        }
    }
    
      public boolean agregarPostTest(String Titulo, String Contenido, String Estatus, String Categoria)
    {
        try {
            int res = 0;
              con.getConnection();
              cn = con.conectar();
            
            String statement = "{CALL crearPostSencillo(?,?,?,?)}";
            PreparedStatement stm = cn.prepareCall(statement);
            stm.setString(1, Titulo);
            stm.setString(2, Contenido);
            stm.setString(3, Estatus);
            stm.setString(4, Categoria);
            stm.execute();
           
            con.desconectar();
            return true;
            
            
            //Intentar luego como la profe hize una tabla con 3 datos llamados categoria 1, 2 y 3 y esos con join correspondian a cierta categoria en otra tabla
        } catch (Exception e ) {
            System.out.println("Error no se inserto en la DB");
            System.out.println(e.toString());
            con.desconectar();
            return false;
        }
       
    }
    
      public boolean modificarPost(String Titulo, String Contenido, String Categoria, int idPost)
    {
        try {
            int res = 0;
              con.getConnection();
              cn = con.conectar();
            
            String statement = "{CALL ActualizarPublicacion(?,?,?,?)}";
            PreparedStatement stm = cn.prepareCall(statement);
            stm.setString(1, Titulo);
            stm.setString(2, Contenido);
            stm.setString(3, Categoria);
            stm.setInt(4, idPost);
            stm.execute();
           
            con.desconectar();
            return true;
            
            
            //Intentar luego como la profe hize una tabla con 3 datos llamados categoria 1, 2 y 3 y esos con join correspondian a cierta categoria en otra tabla
        } catch (Exception e ) {
            System.out.println("Error no se inserto en la DB");
            System.out.println(e.toString());
            con.desconectar();
            return false;
        }
       
    }  
      
        public boolean borrarPost(int idPost)
    {
        try {
            int res = 0;
              con.getConnection();
              cn = con.conectar();
            
            String statement = "{CALL BorrarrPublicacion(?)}";
            PreparedStatement stm = cn.prepareCall(statement);
            stm.setInt(1, idPost);
            stm.execute();
           
            con.desconectar();
            return true;
            
            
            //Intentar luego como la profe hize una tabla con 3 datos llamados categoria 1, 2 y 3 y esos con join correspondian a cierta categoria en otra tabla
        } catch (Exception e ) {
            System.out.println("Error no se inserto en la DB");
            System.out.println(e.toString());
            con.desconectar();
            return false;
        }
       
    }  
        
      
    
    public int getId()
    {
        return id;
    }
    
    public String getTitle()
    {
        return Titulo;
    }
    public String getContenido()
    {
        return contenido;
    }
    public String getFecha()
    {
        return Fecha;
    }
    
    public int getUserId()
    {
        return userID;
    }
    
    public List<Post> consultarRecientes()
    {
        List<Post> datos = new ArrayList();
        Connection conn;
        PreparedStatement stm;
        ResultSet rs;
        
        try{
            con.getConnection();
            conn = con.conectar();
            
            String statement = "{CALL consultaPostRecientes}";
            
            stm = conn.prepareCall(statement);
            rs = stm.executeQuery(statement);
            while(rs.next())
            {
               Post poste = new Post();
               poste.setId(rs.getInt("idPublicacion"));
               poste.setContenido(rs.getString("Contenido"));
               poste.setFecha(rs.getString("FechaCreacion"));
               poste.setTitulo(rs.getString("Titulo"));
               poste.setFoto(rs.getString("FotoPublicacion"));
               poste.setUsuario(rs.getString("NombreUsuario"));
               poste.setIdCat(rs.getInt("idCategoria"));
               poste.setIdEstatus(rs.getInt("idEstatusPost"));
               poste.setCategoria(rs.getString("Categoria"));
               poste.setEstatus(rs.getString("EstatusPublicacion"));
               
               datos.add(poste);
               //Notas de isaac
               /*
               Ya entro en el get y guarda la consulta, verificar que marca en consola
               Isaac 4:46pm 
                */
            }
            conn.close();
            System.out.println("Consulta exitosa");
        }catch(Exception e)
        {
            System.out.println("Error en la consulta de post");
        }
        return datos;
    }
    
    public List<Post> consultarPublicacionesUsuario(String user)
    {
        List<Post> datos = new ArrayList();
        Connection conn;
        PreparedStatement stm;
        ResultSet rs;
        int res;
        
        try{
            con.getConnection();
            cn = con.conectar();
            
            String statement = "{CALL ConsultaPublicacionesUsuario(?)}";
           
            stm = cn.prepareCall(statement);
           stm.setString(1, user);
            
            rs = stm.executeQuery();
            //NO ME TRAJE LA FOTO DE PERFIL XD
            while(rs.next())
            {
               Post poste = new Post();
               poste.setId(rs.getInt("idPublicacion"));
               poste.setContenido(rs.getString("Contenido"));
               poste.setFecha(rs.getString("FechaCreacion"));
               poste.setTitulo(rs.getString("Titulo"));
               poste.setFoto(rs.getString("FotoPublicacion"));
               poste.setUsuario(rs.getString("NombreUsuario"));
               poste.setIdCat(rs.getInt("idCategoria"));
               poste.setIdEstatus(rs.getInt("idEstatusPost"));
               poste.setCategoria(rs.getString("Categoria"));
               poste.setEstatus(rs.getString("EstatusPublicacion"));
               
               datos.add(poste);
               //Notas de isaac
               /*
               Ya entro en el get y guarda la consulta, verificar que marca en consola
               Isaac 4:46pm 
                */
            }
            cn.close();
            System.out.println("Consulta exitosa");
        }catch(Exception e)
        {
            System.out.println("Error en la consulta de post");
            
        }
        
        return datos;
    }
    
    
    public List<Post> busquedaPublicaciones(String texto)
    {
        List<Post> datos = new ArrayList();
        Connection conn;
        PreparedStatement stm;
        ResultSet rs;
        int res;
        
        try{
            con.getConnection();
            cn = con.conectar();
            
            String statement = "{CALL busquedaPublicacion(?)}";
           
            stm = cn.prepareCall(statement);
           stm.setString(1, texto);
            
            rs = stm.executeQuery();
            //NO ME TRAJE LA FOTO DE PERFIL XD
            while(rs.next())
            {
               Post poste = new Post();
               poste.setId(rs.getInt("idPublicacion"));
               poste.setContenido(rs.getString("Contenido"));
               
               poste.setFecha(rs.getString("FechaCreacion"));
               poste.setTitulo(rs.getString("Titulo"));
               poste.setFoto(rs.getString("FotoPublicacion"));
               poste.setUsuario(rs.getString("NombreUsuario"));
               poste.setIdCat(rs.getInt("idCategoria"));
               poste.setIdEstatus(rs.getInt("idEstatusPost"));
               poste.setCategoria(rs.getString("Categoria"));
               poste.setFotoPerfil(rs.getString("FotoPerfl"));
               poste.setEstatus(rs.getString("EstatusPublicacion"));
               
               datos.add(poste);
               postBuscado.add(poste);
               //Notas de isaac
               /*
               Ya entro en el get y guarda la consulta, verificar que marca en consola
               Isaac 4:46pm 
                */
            }
            cn.close();
            System.out.println("Consulta exitosa");
        }catch(Exception e)
        {
            System.out.println("Error en la consulta de post");
            
        }
        
        return datos;
    }
    
    
    
    public List<Post> consultarPublicacionesIndex(int indice, int Cantidad)
    {
        List<Post> datos = new ArrayList();
        Connection conn;
        PreparedStatement stm;
        ResultSet rs;
        int res;
        
        try{
            con.getConnection();
            cn = con.conectar();
            
            String statement = "{CALL consultaPostRecientesIndex(?,?)}";
           
            stm = cn.prepareCall(statement);
            stm.setInt(1, indice);
            stm.setInt(2, Cantidad);
            
            rs = stm.executeQuery();
            
            while(rs.next())
            {
               Post poste = new Post();
               poste.setId(rs.getInt("idPublicacion"));
               poste.setContenido(rs.getString("Contenido"));
               poste.setFecha(rs.getString("FechaCreacion"));
               poste.setTitulo(rs.getString("Titulo"));
               poste.setFoto(rs.getString("FotoPublicacion"));
               poste.setUsuario(rs.getString("NombreUsuario"));
               poste.setIdCat(rs.getInt("idCategoria"));
               poste.setIdEstatus(rs.getInt("idEstatusPost"));
               poste.setCategoria(rs.getString("Categoria"));
               poste.setEstatus(rs.getString("EstatusPublicacion"));
               
               datos.add(poste);
               //Notas de isaac
               /*
               Ya entro en el get y guarda la consulta, verificar que marca en consola
               Isaac 4:46pm 
                */
            }
            cn.close();
            System.out.println("Consulta exitosa");
        }catch(Exception e)
        {
            System.out.println("Error en la consulta de post");
            
        }
        
        return datos;
    }
    
    
     public int consultarTotal()
    {
        List<Post> datos = new ArrayList();
        Connection conn;
        PreparedStatement stm;
        ResultSet rs;
        int res;
        int total = 0;
        try{
            con.getConnection();
            cn = con.conectar();
            
            String statement = "{CALL consultarTotalPublicaciones}";
           
            stm = cn.prepareCall(statement);
          
            rs = stm.executeQuery();
            
            while(rs.next())
            {
               
               total = rs.getInt("Total");
            }
            cn.close();
            System.out.println("Consulta exitosa");
        }catch(Exception e)
        {
            System.out.println("Error en la consulta de post");
            
        }
        
        return total;
    }
    
    
}
