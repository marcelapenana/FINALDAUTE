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
 * @author Luis
 */
public class BlogDAO extends Conexion {

    //INSERT
    public int insertNewBlog(Blog b) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO blog(blo_header, blo_paragraph, blo_publish_date, blo_user_id) values(?,?,?,?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, b.getBlo_header());
            pre.setString(2, b.getBlo_paragraph());
            pre.setString(3, b.getBlo_publish_date());
            pre.setInt(4, b.getBlo_user_id());

            res = pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al agregar nuevo blog: " + e.getMessage());
        } finally {
            this.desconectar();
        }

        return res;
    }

    //READ
    public ArrayList<Blog> mostrarBlogs() {
        ArrayList<Blog> listaBlogs = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM blog b INNER JOIN users u ON b.blo_user_id = u.use_id";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Blog b = new Blog();
                b.setBlo_id(rs.getInt(1));
                b.setBlo_header(rs.getString(2));
                b.setBlo_paragraph(rs.getString(3));
                b.setBlo_publish_date(rs.getString(4));
                b.setBlo_user_id(rs.getInt(5));
                b.setUse_real_nameOT(rs.getString(7));
                listaBlogs.add(b);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar los Blogs: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return listaBlogs;
    }

    //UPDATE
    public int actualizarBlog(Blog b) {
        int res = 0;
        try {
            this.conectar();
            String sql = "";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            res = pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al actualizar el blog: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    //DELETE
    public int eliminarBlogs(Blog b) {
        int res = 0;
        try {
            this.conectar();
            String sql = "";
            PreparedStatement pre = this.getCon().prepareStatement(sql);

            res = pre.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error al Eliminar el blog: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

}
