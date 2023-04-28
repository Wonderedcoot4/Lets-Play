

package PostDOA;
import Config.conexionSQL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
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
        
    public boolean agregarPost(String Titulo, String Contenido, String Estatus, String Fecha, String Categoria)
    {
        try {
              con.getConnection();
              cn = con.conectar();
            String statement = "CALL crearPost(?,?,?,?,?)";
            PreparedStatement stm = cn.prepareStatement(statement);
            stm.setString(1, Fecha);
            stm.setString(2, Fecha);
            stm.setString(3, Fecha);
            stm.setString(4, Fecha);
            stm.setString(5, Fecha);
            
        } catch (Exception e) {
            return false;
        }
        return false;
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
