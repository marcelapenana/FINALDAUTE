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
public class ModelsDAO extends Conexion{
    
    public int insertarModels(Models m) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO models(mod_code,mod_name,mod_year,mod_price,mod_color, mod_brand_id ) VALUES (?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, m.getModCode());
            pre.setString(2, m.getModName());
            pre.setString(3, m.getModYear());
            pre.setDouble(4, m.getModPrice());
            pre.setString(5, m.getModColor());
            pre.setInt(6, m.getModBrandid());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    
    public ArrayList<Models> mostrarModels() {
        ArrayList<Models> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT *FROM models mo INNER JOIN brands br ON mo.mod_brand_id=br.bra_id";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Models m = new Models();
                m.setModId(rs.getInt(1));
                m.setModCode(rs.getString(2) );
                m.setModName(rs.getString(3));
                m.setModYear(rs.getString(4));
                m.setModPrice(rs.getDouble(5));
                m.setModColor(rs.getString(6));
                m.setModBrandid(rs.getInt(7));
                m.setModBraname(rs.getString(9));
                
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar vehiculos" + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    //Hecho por otro
    public Models getByCode(String code) {
        Models m = new Models();
        try {
            this.conectar();
            String sql = "SELECT *FROM models mo INNER JOIN brands br ON "
                    + "mo.mod_brand_id=br.bra_id where mod_code = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, code);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                m.setModId(rs.getInt(1));
                m.setModCode(rs.getString(2) );
                m.setModName(rs.getString(3));
                m.setModYear(rs.getString(4));
                m.setModPrice(rs.getDouble(5));
                m.setModColor(rs.getString(6));
                m.setModBrandid(rs.getInt(7));
                m.setModBraname(rs.getString(9));
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar vehiculos" + e.getMessage());
        } finally {
            this.desconectar();
        }
        return m;
    }

    public int modificarModels(Models m) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE models SET mod_code=?,mod_name=?,mod_year=?,mod_price=?,mod_color=?,mod_brand_id=? WHERE mod_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
           pre.setString(1, m.getModCode());
            pre.setString(2, m.getModName());
            pre.setString(3, m.getModYear());
            pre.setDouble(4, m.getModPrice());
            pre.setString(5, m.getModColor());
            pre.setInt(6, m.getModBrandid());
            pre.setInt(7, m.getModId());
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al modificar" + e.getMessage());
        } finally {
            this.desconectar();
        }

        return res;
    }

    public int eliminarModels(Models m) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM models WHERE mod_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, m.getModId());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Eliminar" + e.getMessage());
        } finally {
            this.desconectar();
        }

        return res;
    }
}
