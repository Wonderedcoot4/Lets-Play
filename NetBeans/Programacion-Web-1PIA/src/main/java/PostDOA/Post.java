

package PostDOA;
import Config.conexionSQL;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;
public class Post {
    
    private int id;
    private String Titulo;
    private String contenido;
    private int userID;
    private String Fecha;
    public Post()
    {
      
        
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
    public boolean agregarPost(String Titulo, String Contenido, String Estatus, String Categoria)
    {
        try {
              con.getConnection();
              cn = con.conectar();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String fecha = java.time.LocalDate.now().toString();
            String statement = "{CALL crearPost(?,?,?,?,?)}";
            PreparedStatement stm = cn.prepareCall(statement);
            stm.setString(1, Titulo);
            stm.setString(2, Contenido);
            stm.setString(3, Estatus);
            stm.setString(4, fecha);
            stm.setString(5, Categoria);
            //Por si no aparezco toy en el bañño 
            stm.execute();
            con.desconectar();
            return true;
            
        } catch (Exception e) {
            System.out.println("Error no se inserto en la DB");
            System.out.println(e.toString());
            con.desconectar();
            return false;
        }
  
    }
    
    public boolean agregarPost(String Titulo, String Contenido, String Estatus, String Categoria, File Fotografia, String Usuario)
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
    
    
}
