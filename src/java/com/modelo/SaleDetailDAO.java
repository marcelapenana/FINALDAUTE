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
public class SaleDetailDAO extends Conexion {

    public int saveSaleDetails(List<SaleDetail> details) {
        int res = 0;

        try {
            this.conectar();

            for (SaleDetail sd : details) {
                String sql = "insert into sale_detail_cars(sdc_cars, sdc_cars_qty, "
                        + "sdc_cars_unit_price, sdc_total_product, sdc_sale) \n"
                        + "values (?, ?, ?, ?, ?);";
                PreparedStatement ps = this.getCon().prepareStatement(sql);
                ps.setString(1, sd.getModel().getModCode());
                ps.setInt(2, sd.getQty());
                ps.setDouble(3, sd.getUnitPrice());
                ps.setDouble(4, sd.getTotal());
                ps.setDouble(5, sd.getSale().getId());

                res += ps.executeUpdate();
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        } finally {
            this.desconectar();
        }

        return res;
    }

    public SaleDetail showSaleById(int id) {
        SaleDetail saleDetail = new SaleDetail();

        try {
            this.conectar();
            String sql = "select sdc.*, st.sal_user_dealer as usuario, st.sal_client_buyer as cliente, st.sal_date_sale, m.mod_name  \n"
                    + "from sale_detail_cars sdc\n"
                    + "join sale_ticket st on sdc.sdc_sale = st.sal_id\n"
                    + "join models m on sdc.sdc_cars = m.mod_code\n"
                    + "where sdc.sdc_sale = ?;";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SaleTicket saleTicket = new SaleTicket();
                Models model = new Models();
                UsersC user = new UsersC();
                Cliente client = new Cliente();

                saleDetail.setId(rs.getInt(1));
                model.setModCode(rs.getString(2)); //code goes here
                saleDetail.setQty(rs.getInt(3));
                saleDetail.setUnitPrice(rs.getDouble(4));
                saleDetail.setTotal(rs.getDouble(5));
                saleTicket.setId(rs.getInt(6));
                user.setUserName(rs.getString(7));
                client.setCli_dui(rs.getString(8));
                saleTicket.setDateSale(rs.getString(9));
                model.setModName(rs.getString(10));

                saleTicket.setUser(user);  
                saleTicket.setClient(client);
                saleDetail.setModel(model);
                saleDetail.setSale(saleTicket);
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        } finally {
            this.desconectar();
        }

        return saleDetail;
    }

    public List<SaleDetail> showAllSales() {
        List<SaleDetail> details = new ArrayList<>();

        try {
            this.conectar();
            String sql = "select sdc.*, st.sal_user_dealer as usuario, st.sal_client_buyer as cliente, st.sal_date_sale, m.mod_name  \n"
                    + "from sale_detail_cars sdc\n"
                    + "join sale_ticket st on sdc.sdc_sale = st.sal_id\n"
                    + "join models m on sdc.sdc_cars = m.mod_code";
            PreparedStatement ps = this.getCon().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SaleDetail saleDetail = new SaleDetail();
                SaleTicket saleTicket = new SaleTicket();
                Models model = new Models();
                UsersC user = new UsersC();
                Cliente client = new Cliente();

                saleDetail.setId(rs.getInt(1));
                model.setModCode(rs.getString(2)); //code goes here
                saleDetail.setQty(rs.getInt(3));
                saleDetail.setUnitPrice(rs.getDouble(4));
                saleDetail.setTotal(rs.getDouble(5));
                saleTicket.setId(rs.getInt(6));
                user.setUserName(rs.getString(7));
                client.setCli_dui(rs.getString(8));
                saleTicket.setDateSale(rs.getString(9));
                model.setModName(rs.getString(10));

                saleTicket.setUser(user);
                saleTicket.setClient(client);
                saleDetail.setModel(model);
                saleDetail.setSale(saleTicket);

                details.add(saleDetail);
            }

        } catch (Exception ex) {
            ex.printStackTrace();

        } finally {
            this.desconectar();
        }

        return details;
    }

}
