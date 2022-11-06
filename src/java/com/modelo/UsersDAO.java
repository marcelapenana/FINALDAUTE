/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author najera
 */
public class UsersDAO extends Conexion{
    
     public int insertarU(UsersC r) {
        int res = 0;
        try {
            this.conectar();
            String sql = "insert into users(use_real_name, use_username, use_password, use_rol_id) values (?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, r.getUseRealName());
            pre.setString(2, r.getUserName());
            pre.setString(3, r.getPassword());
            pre.setInt(4, r.getRolId());
            
            res = pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al insertar" + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
 
    
    public ArrayList<UsersC> mostrarU() {
        ArrayList<UsersC> listaUsers = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM users cl INNER JOIN roles ca ON cl.use_rol_id=ca.rol_id";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                UsersC u = new UsersC();
                u.setUseId(rs.getInt(1));
                u.setUseRealName(rs.getString(2));
                u.setUserName(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setRolId(rs.getInt(6));
                listaUsers.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar" + e.getMessage());
        } finally {
            this.desconectar();

        }
        return listaUsers;
    }
    
     
    
    public int modificarU(UsersC r){
    int res=0; 
        try {
            this.conectar();
            String mysql=("UPDATE users SET use_real_name=?, use_username=?,use_password=?, use_rol_id=? WHERE use_id=?");
            PreparedStatement pre= this.getCon().prepareStatement(mysql);
            pre.setString(1, r.getUseRealName());
            pre.setString(2, r.getUserName());
            pre.setString(3, r.getPassword());
            pre.setInt(4, r.getRolId());
            pre.setInt(5, r.getUseId());
            res=pre.executeUpdate();
           
        } catch (Exception e) {
            System.out.println("Error al modificar"+e.getMessage());
        }finally{
        this.desconectar();
        }
    
    return res;
    }
    
       public int eliminarU(UsersC r){
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM users WHERE use_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, r.getUseId());
                     
            res = pre.executeUpdate();
        }catch(SQLException e){
            System.out.println("Error al eliminar"+e.getMessage());
        } 
        return res;
    }

}
