/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author najera
 */
public class Brands {
     private int braID;
    private String braName;

    public Brands() {
    }

    public Brands(int braID, String braName) {
        this.braID = braID;
        this.braName = braName;
    }

    public int getBraID() {
        return braID;
    }

    public void setBraID(int braID) {
        this.braID = braID;
    }

    public String getBraName() {
        return braName;
    }

    public void setBraName(String braName) {
        this.braName = braName;
    }
}
