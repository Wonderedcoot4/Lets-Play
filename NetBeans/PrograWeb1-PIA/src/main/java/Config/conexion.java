package Config;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class conexion {
    String url = "jdbc:mysql://localhost:3306/";
    String db = "test";
    String user = "root";
    String pass = "soyDiamante";
    public String driver = "com.mysql.jdbc.Driver";
    
    Connection con;
    
    public conexion (){}
    
    public Connection conectar () throws ClassNotFoundException{
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url+db, user, pass);
        } catch (SQLException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
    
    public void desconectar() {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Connection getConnection()
    {
        return con;
    }
}
