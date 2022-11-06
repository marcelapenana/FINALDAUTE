/*   
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Luis
 */
public class SaleTicketDAO extends Conexion {

    public int saveTicket(SaleTicket sale) {
        int res = 0;

        try {
            this.conectar();
            String sql = "insert into sale_ticket(sal_date_sale, sal_user_dealer, "
                    + "sal_client_buyer, sal_payment_met, sal_total) \n"
                    + "values (curdate(), ?, ?, 'Efectivo', ?)";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setString(1, sale.getUser().getUserName());
            ps.setString(2, sale.getClient().getCli_dui());
            ps.setDouble(3, sale.getSalTotal());

            res = ps.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();

        } finally {
            this.desconectar();
        }

        return res;
    }

    public int getLastIdSale() {
        int id = 0;

        try {
            this.conectar();
            String sql = "select distinct sal_id from sale_ticket order by "
                    + "sal_id desc limit 1;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                id = rs.getInt(1);
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        } finally {
            this.desconectar();
        }

        return id;
    }

    public List<SaleTicket> showAllSalesByDays() {
        List<SaleTicket> saleTickets = new ArrayList<>();

        try {
            this.conectar();
            String sql = "select sum(sal_total) as Ganancias, sal_date_sale as Fecha\n"
                    + "from sale_ticket\n"
                    + "where sal_date_sale <= curdate()\n"
                    + "group by sal_date_sale;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SaleTicket saleTicket = new SaleTicket();

                saleTicket.setSalTotal(rs.getDouble(1));
                saleTicket.setDateSale(rs.getString(2));

                saleTickets.add(saleTicket);
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        } finally {
            this.desconectar();
        }

        return saleTickets; 
    }
    
    public List<SaleTicket> showAllSales() {
        List<SaleTicket> saleTickets = new ArrayList<>();

        try {
            this.conectar();
            String sql = "select * from sale_ticket;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SaleTicket saleTicket = new SaleTicket();
                UsersC user = new UsersC();
                Cliente client = new Cliente();
                
                saleTicket.setId(rs.getInt(1));
                saleTicket.setDateSale(rs.getString(2));
                user.setUserName(rs.getString(3));
                client.setCli_dui(rs.getString(4));
                saleTicket.setSalTotal(rs.getDouble(6));
                saleTicket.setUser(user);
                saleTicket.setClient(client);
                
                saleTickets.add(saleTicket);
                System.out.println("Esto: " + saleTicket.getSalTotal());
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        } finally {
            this.desconectar();
        }

        return saleTickets;
    }
}
