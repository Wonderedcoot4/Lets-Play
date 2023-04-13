

package PostDOA;

/**
 *
 * @author isaac
 */
public class Post {
    
    private int id;
    private String Titulo;
    private String contenido;
    private int userID;
    private String Fecha;
    public Post(int id, String titulo, String Contenido, String fechaCreacion, int idUsuario )
    {
        //Pendiente revisar lo de IdEstatusPublicacion
        this.id = id;
        this.Titulo = titulo;
        this.contenido = Contenido;
        this.Fecha = fechaCreacion;
        
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
}
