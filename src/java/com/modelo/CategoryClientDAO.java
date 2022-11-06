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
public class CategoryClientDAO extends Conexion{
    public int insertarC(CategoryClient c){
        int res = 0;
        try {
            this.conectar();
            String sql= "insert category_client(cat_type) values(?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getCatType());          
            res = pre.executeUpdate();
            
        }catch(SQLException e){
            System.out.println("Error al insertar"+e.getMessage());
        }finally {
            this.desconectar();
        }
        return res;
    }
     
     public ArrayList<CategoryClient> mostrarC(){
        ArrayList<CategoryClient> listaC = new ArrayList<>();
         try {
            this.conectar();
            String sql = "select * from category_client";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                CategoryClient p = new CategoryClient();
                p.setCatId(rs.getInt(1));
                p.setCatType(rs.getString(2));             
                listaC.add(p);
            }
                      
        }catch(SQLException e){
            System.out.println("Error al mostrar"+e.getMessage());
        } finally {
            this.desconectar();
            
        }
         return listaC;
    }
    
    
     public int modificarC(CategoryClient p){
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE category_client SET cat_type=? WHERE cat_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, p.getCatType());
            pre.setInt(2, p.getCatId());
            
            res = pre.executeUpdate();
        }catch(SQLException e){
            System.out.println("Error al modificar"+e.getMessage());
        } finally {
            this.desconectar();            
        }
        
      return res;
    }
        public int eliminarC(CategoryClient p){
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM category_client WHERE cat_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, p.getCatId());
                     
            res = pre.executeUpdate();
        }catch(SQLException e){
            System.out.println("Error al eliminar"+e.getMessage());
        } 
        return res;
    }
}
