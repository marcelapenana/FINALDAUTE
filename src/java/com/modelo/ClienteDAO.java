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
public class ClienteDAO extends Conexion{
    public int insertarCliente(Cliente c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO clients(cli_name, cli_date_birth, cli_dui, cli_residence, cli_telephone, cli_category_id) VALUES(?,?,?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getCli_name());
            pre.setString(2, c.getCli_date_birth());
            pre.setString(3, c.getCli_dui());
            pre.setString(4, c.getCli_residence());
            pre.setString(5, c.getCli_telephone());
            pre.setInt(6, c.getCli_category_id());

            res = pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al insertar el cliente: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    // READ
    public ArrayList<Cliente> mostrarClientes() {
        ArrayList<Cliente> listaClientes = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM clients c INNER JOIN category_client k ON c.cli_category_id = k.cat_id";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setCli_id(rs.getInt(1));
                c.setCli_name(rs.getString(2));
                c.setCli_date_birth(rs.getString(3));
                c.setCli_dui(rs.getString(4));
                c.setCli_residence(rs.getString(5));
                c.setCli_telephone(rs.getString(6));
                c.setCli_category_id(rs.getInt(7));
                c.setCat_type(rs.getString(9));
                listaClientes.add(c);
            }

        } catch (SQLException e) {
            System.out.println("Error al mostrar los registros: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return listaClientes;
    }

    // UPDATE
    public int actualizarClientes(Cliente c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE clients SET cli_name=?, cli_date_birth=?, cli_dui=?, cli_residence=?, cli_telephone=?, cli_category_id=? WHERE cli_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getCli_name());
            pre.setString(2, c.getCli_date_birth());
            pre.setString(3, c.getCli_dui());
            pre.setString(4, c.getCli_residence());
            pre.setString(5, c.getCli_telephone());
            pre.setInt(6, c.getCli_category_id());
            pre.setInt(7, c.getCli_id());

            res = pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al actualizar los registros: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    // DELETE
    public int eliminarClientes(Cliente c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM clients WHERE cli_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getCli_id());

            res = pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al Eliminar los registros: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
    
    public Cliente getClientByDUI(String dui) {
        Cliente cl = new Cliente();
        try {   
            this.conectar();
            String sql = "SELECT cli_dui FROM clients WHERE cli_dui = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, dui);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                //cl.setCli_id(rs.getInt(1));
                //c.setCli_name(rs.getString(2));
                //c.setCli_date_birth(rs.getString(3));
                cl.setCli_dui(rs.getString(1));
                //c.setCli_residence(rs.getString(5));
                //c.setCli_telephone(rs.getString(6));
                //c.setCli_category_id(rs.getInt(7));
                //c.setCat_type(rs.getString(9));

            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar el registro por DUI: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return cl;
    }  
}
