/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
        
        public String Nombre;
        public String ApellidoP;
        public String ApellidoM;
        public String Correo;
        public String FechaNacimiento;
        public String Usuario;
        public String Password;
        public String ConfirmarContraseña;
        
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
            try{
           
             con.getConnection();
             cn = con.conectar();
             Statement stm = cn.createStatement();
             String stamentMySql = "Select NombreUsuario, Contrasena from usuario where BINARY NombreUsuario ='" + User + "' AND  Contrasena='" + pass + "'";
             /*
             cn = con.getConnection();
             ps = cn.prepareStatement(stamentMySql);*/
             
             rs = stm.executeQuery(stamentMySql);
            
             if (rs.next()) 
                {
                     
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
