/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author najera
 */
public class AuthDAO extends Conexion{
    public boolean login(String user, String password) {
        boolean pass = false;

        try {
            this.conectar();
            String query = "SELECT u.*, r.rol_type\n"
                    + "FROM users u\n"
                    + "JOIN roles r on u.use_rol_id = r.rol_id\n"
                    + "WHERE u.use_username = ? and u.use_password = ?";
            PreparedStatement ps = this.getCon().prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                //Se carga el objeto usuario
                pass = true;
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        } finally {
            this.desconectar();
        }

        return pass;
    }

}
