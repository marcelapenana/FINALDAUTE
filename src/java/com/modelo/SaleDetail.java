/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author Luis
 */
public class SaleDetail {   
      
          
   private int id;
   private Models model;
   private int qty;
   private double unitPrice;
   private double total;
   private SaleTicket sale;

    public SaleDetail() {
    }
   
    public SaleDetail(Models model, int qty, double unitPrice, double total, 
            SaleTicket sale) {
        this.model = model;
        this.qty = qty;
        this.unitPrice = unitPrice;
        this.total = total;
        this.sale = sale;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Models getModel() {
        return model;
    }

    public void setModel(Models model) {
        this.model = model;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public SaleTicket getSale() {
        return sale;
    }

    public void setSale(SaleTicket sale) {
        this.sale = sale;
    }
}