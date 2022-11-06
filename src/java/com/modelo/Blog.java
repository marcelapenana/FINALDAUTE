/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author esteb
 */
public class Blog {
    private int blo_id;
    private String blo_header;
    private String blo_paragraph;
    private String blo_publish_date;
    private int blo_user_id;
    private String use_real_nameOT;

    public Blog() {
    }

    public Blog(int blo_id, String blo_header, String blo_paragraph, String blo_publish_date, int blo_user_id, String use_real_nameOT) {
        this.blo_id = blo_id;
        this.blo_header = blo_header;
        this.blo_paragraph = blo_paragraph;
        this.blo_publish_date = blo_publish_date;
        this.blo_user_id = blo_user_id;
        this.use_real_nameOT = use_real_nameOT;
    }

    public int getBlo_id() {
        return blo_id;
    }

    public void setBlo_id(int blo_id) {
        this.blo_id = blo_id;
    }

    public String getBlo_header() {
        return blo_header;
    }

    public void setBlo_header(String blo_header) {
        this.blo_header = blo_header;
    }

    public String getBlo_paragraph() {
        return blo_paragraph;
    }

    public void setBlo_paragraph(String blo_paragraph) {
        this.blo_paragraph = blo_paragraph;
    }

    public String getBlo_publish_date() {
        return blo_publish_date;
    }

    public void setBlo_publish_date(String blo_publish_date) {
        this.blo_publish_date = blo_publish_date;
    }

    public int getBlo_user_id() {
        return blo_user_id;
    }

    public void setBlo_user_id(int blo_user_id) {
        this.blo_user_id = blo_user_id;
    }

    public String getUse_real_nameOT() {
        return use_real_nameOT;
    }

    public void setUse_real_nameOT(String use_real_nameOT) {
        this.use_real_nameOT = use_real_nameOT;
    }

    
        
}
