
package UsuarioDBA;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Config.conexionSQL;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLData;
import java.sql.Statement;


/**
 *
 * @author isaac
 */
public class Usuario {
        
        public int IdUsuario;
        public String Nombre;
        public String ApellidoP;
        public String ApellidoM;
        public String Correo;
        public String FechaNacimiento;
        public String UsuarioNombre;
        public String Password;
        public String ConfirmarContraseña;
        public String Fotografia;
        public static Usuario log;
    public void setFotografia(String Fotografia) {
        this.Fotografia = Fotografia;
    }

    public String getFotografia() {
        return Fotografia;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public String getNombre() {
        return Nombre;
    }

    public String getApellidoP() {
        return ApellidoP;
    }

    public String getApellidoM() {
        return ApellidoM;
    }

    public String getCorreo() {
        return Correo;
    }

    public String getFechaNacimiento() {
        return FechaNacimiento;
    }

    public String getUsuario() {
        return UsuarioNombre;
    }

    public String getPassword() {
        return Password;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public void setApellidoP(String ApellidoP) {
        this.ApellidoP = ApellidoP;
    }

    public void setApellidoM(String ApellidoM) {
        this.ApellidoM = ApellidoM;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public void setFechaNacimiento(String FechaNacimiento) {
        this.FechaNacimiento = FechaNacimiento;
    }

    public void setUsuario(String Usuario) {
        this.UsuarioNombre = Usuario;
    }
    
    public Object UsuarioLog()   //Por si falla ponerle override
    {
      return log;
    }
    public void setPassword(String Password) {
        this.Password = Password;
    }

   
        conexionSQL con = new conexionSQL();
        Connection cn;
        
         public void SetNombre(String name)
        {
            this.Nombre = name;
        }
        
        public String ObtenerNombre()
        {
            return Nombre;
        }
        PreparedStatement ps;
        ResultSet rs;
        
        public boolean Registro(String Nombre, String ApellidoP, String ApellidoM,
                String Correo, String Fecha, String Usuario, String Contraseña)
        {
            int res;
            try{
                con.getConnection();
                cn = con.conectar();
                String state = "INSERT INTO usuario(Nombre, ApellidoPaterno, ApellidoMaterno, Correo, NombreUsuario,Contrasena,FechaNacimiento) values "
                        + "(?,?,?,?,?,?,?);";
                //String state = "INSERT INTO usuario(Nombre, ApellidoPaterno, ApellidoMaterno, Correo, NombreUsuario,Contrasena,FechaNacimiento) values ('" + Nombre + "','" + ApellidoP + "','" + ApellidoM + "','" + Correo + "','" + Usuario + "','" + Contraseña + "','" + Fecha + "');";
                PreparedStatement stm = cn.prepareStatement(state);
                stm.setString(1, Nombre);
                stm.setString(2, ApellidoP);
                stm.setString(3, ApellidoM);
                stm.setString(4, Correo);
                stm.setString(5, Usuario);
                stm.setString(6, Contraseña);
                stm.setString(7, Fecha);
                res = stm.executeUpdate();
                if (res != 0) {
                    con.desconectar();
                    return true;
                }
            }catch(Exception e)
            {
                 System.out.println("Error : " + e);
                con.desconectar();
                return false;
            }
             System.out.println("Error no se inserto en la DB");
            return false;
        }
        
        public boolean login(String User, String pass)
        {
            Usuario logged = new Usuario();
            try{
           
             con.getConnection();
             cn = con.conectar();
             Statement stm = cn.createStatement();
             String stamentMySql = "Select NombreUsuario, Contrasena, idUsuario, FotoPerfl from usuario where BINARY NombreUsuario ='" + User + "' AND  Contrasena='" + pass + "'";
             /*
             cn = con.getConnection();
             ps = cn.prepareStatement(stamentMySql);*/
             
             rs = stm.executeQuery(stamentMySql);
            
             if (rs.next()) 
                {
                     logged.setIdUsuario(rs.getInt("idUsuario"));
                     logged.setUsuario(rs.getString("NombreUsuario"));
                     logged.setCorreo(rs.getString("Correo"));
                     logged.setFotografia(rs.getString("FotoPerfl"));
                    
                     con.desconectar();
                     return true;
                     
                }
            }catch(Exception e)
            {
            System.out.println("Error : " + e);
           
            return false;
            }
           
            con.desconectar();
            System.out.println("Error : " + "User not Found");
            return false;
        }
        
     
        
        public Object LoginUsuario(String User, String pass)
        {
            Usuario logged = new Usuario();
            logged.setIdUsuario(0);
            
            try{
           
             con.getConnection();
             cn = con.conectar();
             Statement stm = cn.createStatement();
             String stamentMySql = "Select NombreUsuario, Contrasena, idUsuario, FotoPerfl, Correo from usuario where BINARY NombreUsuario ='" + User + "' AND  Contrasena='" + pass + "'";
             /*
             cn = con.getConnection();
             ps = cn.prepareStatement(stamentMySql);*/
             
             rs = stm.executeQuery(stamentMySql);
            
             if (rs.next()) 
                {
                     logged.setIdUsuario(rs.getInt("idUsuario"));
                     logged.setUsuario(rs.getString("NombreUsuario"));
                     logged.setCorreo(rs.getString("Correo"));
                     logged.setFotografia(rs.getString("FotoPerfl"));
                     System.out.println("Login CORRECTO, DATOS GUARDADOS DE MANERA EXITOSA");
                     log = logged;
                     con.desconectar();
                    
                     
                }
            }catch(Exception e)
            {
            System.out.println("Error : " + e);
            System.out.println("Error : " + "User not Found");
            System.out.println("Login INCORRECTO, NO SE GUARDARON DATOS Y NO PROCEDARA LA PAGINA");
            con.desconectar();
            return logged;
            }
            con.desconectar();
            return logged;
           
           
        }
        
        
        public boolean noseRepite(String user)
        {
            try{
                   con.getConnection();
                   cn = con.conectar();
                   Statement stm = cn.createStatement();
                   String elStatement = "Select NombreUsuario from usuario where NombreUsuario ='" + user + "' ";
                   rs = stm.executeQuery(elStatement);
                   if (rs.next() == true) {
                       con.desconectar();
                    return true;
                }
            }catch(Exception e)
            {
                con.desconectar();
                return false;
            }
            return false;
        }
        
        public boolean InsertarImagen(String Nombre, String ApellidoP, String ApellidoM,
                String Correo, String Fecha, String Usuario, String Contraseña, File Foto)
        {
            try{
                con.getConnection();
                cn = con.conectar();
                int res;
               
               String state = "INSERT INTO usuario(Nombre, ApellidoPaterno, ApellidoMaterno, Correo, NombreUsuario,Contrasena,FechaNacimiento, FotoPerfl) values "
                        + "(?,?,?,?,?,?,?,?);";
                //String state = "INSERT INTO usuario(Nombre, ApellidoPaterno, ApellidoMaterno, Correo, NombreUsuario,Contrasena,FechaNacimiento) values ('" + Nombre + "','" + ApellidoP + "','" + ApellidoM + "','" + Correo + "','" + Usuario + "','" + Contraseña + "','" + Fecha + "');";
                PreparedStatement stm = cn.prepareStatement(state);
                String ARCHIVE = Foto.toString();
                stm.setString(1, Nombre);
                stm.setString(2, ApellidoP);
                stm.setString(3, ApellidoM);
                stm.setString(4, Correo);
                stm.setString(5, Usuario);
                stm.setString(6, Contraseña);
                stm.setString(7, Fecha);
                stm.setString(8, ARCHIVE);
                res = stm.executeUpdate();
                if (res != 0) {
                    con.desconectar();
                    return true;
                }
                
            }catch(Exception e)
            {
                System.out.println("nO SE INSERTO");
                return false;
            }
            return false;
            
            
        }
        
        
         public boolean CorreoNoRepeat(String user)
        {
            try{
                   con.getConnection();
                   cn = con.conectar();
                   Statement stm = cn.createStatement();
                   String elStatement = "Select Correo from usuario where Correo ='" + user + "' ";
                   rs = stm.executeQuery(elStatement);
                   if (rs.next() == true) {
                       con.desconectar();
                    return true;
                }
            }catch(Exception e)
            {
                con.desconectar();
                return false;
            }
            return false;
        }
    
}
