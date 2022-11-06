/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author najera
 */
public class Models {
    private int modId;
    private String modCode;
    private String modName;
    private String modYear;
    private double modPrice;
    private String modColor;
    private int modBrandid;
    private String modBraname;

    public Models(int modId, String modCode, String modName, String modYear, double modPrice, String modColor, int modBrandid, String modBraname) {
        this.modId = modId;
        this.modCode = modCode;
        this.modName = modName;
        this.modYear = modYear;
        this.modPrice = modPrice;
        this.modColor = modColor;
        this.modBrandid = modBrandid;
        this.modBraname = modBraname;
    }

    public Models() {
    }

    public int getModId() {
        return modId;
    }

    public void setModId(int modId) {
        this.modId = modId;
    }

    public String getModCode() {
        return modCode;
    }

    public void setModCode(String modCode) {
        this.modCode = modCode;
    }

    public String getModName() {
        return modName;
    }

    public void setModName(String modName) {
        this.modName = modName;
    }

    public String getModYear() {
        return modYear;
    }

    public void setModYear(String modYear) {
        this.modYear = modYear;
    }

    public double getModPrice() {
        return modPrice;
    }

    public void setModPrice(double modPrice) {
        this.modPrice = modPrice;
    }

    public String getModColor() {
        return modColor;
    }

    public void setModColor(String modColor) {
        this.modColor = modColor;
    }

    public int getModBrandid() {
        return modBrandid;
    }

    public void setModBrandid(int modBrandid) {
        this.modBrandid = modBrandid;
    }

    public String getModBraname() {
        return modBraname;
    }

    public void setModBraname(String modBraname) {
        this.modBraname = modBraname;
    }
    
}
