/*   
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author Luis
 */
public class SaleTicket {

    private int id;
    private String dateSale;
    private UsersC user;
    private Cliente client;
    private String sal_payment_met;
    private double salTotal;

    public SaleTicket() {
    }

    public SaleTicket(String dateSale, UsersC user, Cliente client, String 
            sal_payment_met, double salTotal) {
        this.dateSale = dateSale;
        this.user = user;
        this.client = client;
        this.sal_payment_met = sal_payment_met;
        this.salTotal = salTotal;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDateSale() {
        return dateSale;
    }

    public void setDateSale(String dateSale) {
        this.dateSale = dateSale;
    }

    public UsersC getUser() {
        return user;
    }

    public void setUser(UsersC user) {
        this.user = user;
    }

    public Cliente getClient() {
        return client;
    }

    public void setClient(Cliente client) {
        this.client = client;
    }

    public String getSal_payment_met() {
        return sal_payment_met;
    }

    public void setSal_payment_met(String sal_payment_met) {
        this.sal_payment_met = sal_payment_met;
    }

    public double getSalTotal() {
        return salTotal;
    }

    public void setSalTotal(double salTotal) {
        this.salTotal = salTotal;
    }
}