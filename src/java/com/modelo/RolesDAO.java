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
public class RolesDAO extends Conexion {

    public int insertarR(RolesC c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "insert into roles(rol_type) values (?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getRolType());
            res = pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al insertar" + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public ArrayList<RolesC> mostrarR() {
        ArrayList<RolesC> listaR = new ArrayList<>();
        try {
            this.conectar();
            String mysql = ("SELECT * FROM roles");
            PreparedStatement pre = this.getCon().prepareStatement(mysql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                RolesC r = new RolesC();
                r.setIdRol(rs.getInt(1));
                r.setRolType(rs.getString(2));
                listaR.add(r);
            }

        } catch (Exception e) {
            System.out.println("Error al mostrar" + e.getMessage());
        } finally {
            this.desconectar();
        }
        return listaR;
    }

    public int modificarR(RolesC r) {
        int res = 0;
        try {
            this.conectar();
            String mysql = ("UPDATE roles SET rol_type=? WHERE rol_id=?");
            PreparedStatement pre = this.getCon().prepareStatement(mysql);
            pre.setString(1, r.getRolType());
            pre.setInt(2, r.getIdRol());
            res = pre.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error al modificar" + e.getMessage());
        } finally {
            this.desconectar();
        }

        return res;
    }

    public int eliminarR(RolesC r) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM roles WHERE rol_id=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, r.getIdRol());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar" + e.getMessage());
        }
        return res;
    }
}
