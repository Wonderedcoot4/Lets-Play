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
          
        conexionSQL con = new conexionSQL();
        Connection cn;
        
        
        PreparedStatement ps;
        ResultSet rs;
        public boolean login(String User, String pass)
        {
            try{
           
             con.getConnection();
             con.conectar();
             Statement stm = cn.createStatement();
             String stamentMySql = "Select * from usuario where NombreUsuario ='" + User + "' Contraseña'" + pass + "';";
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
    
}
