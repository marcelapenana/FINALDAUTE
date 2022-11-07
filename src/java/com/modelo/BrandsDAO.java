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
public class BrandsDAO extends Conexion {

    public int insertarB(Brands b) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO brands(bra_name) VALUES(?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, b.getBraName());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("ERROR AL insertar DATOS " + e.getMessage());

        } finally {
            this.desconectar();
        }
        return res;

    }

    public ArrayList<Brands> mostrarB() {
        ArrayList<Brands> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM brands";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Brands b = new Brands();
                b.setBraID(rs.getInt(1));
                b.setBraName(rs.getString(2));

                lista.add(b);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar marcas" + e.getMessage());

        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int modificarB(Brands b) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE brands SET bra_name=? WHERE bra_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            pre.setString(1, b.getBraName());
            pre.setInt(2, b.getBraID());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("ERROR AL modificar datos  " + e.getMessage());
        } finally {

        }
        return res;

    }

    public int eliminarB(Brands b) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM brands WHERE bra_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            pre.setInt(1, b.getBraID());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("ERROR AL eliminar  datos  " + e.getMessage());
        } finally {

        }
        return res;

    }
}
