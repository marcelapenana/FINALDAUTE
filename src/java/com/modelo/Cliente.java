/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author najera
 */
public class Cliente {
     private int cli_id; //PRIMARY KEY AUTO_INCREMENT,
    private String cli_name; // VARCHAR(50)
    private String cli_date_birth; // DATE
    private String cli_dui; // VARCHAR(10)
    private String cli_residence; // TEXT(100)
    private String cli_telephone; // VARCHAR(15)
    private int cli_category_id; // INTEGER(10)
    private String cat_type;

    public Cliente() {
    }
        
    public Cliente(int cli_id, String cli_name, String cli_date_birth, String cli_dui, String cli_residence, String cli_telephone, int cli_category_id, String cat_type) {
        this.cli_id = cli_id;
        this.cli_name = cli_name;
        this.cli_date_birth = cli_date_birth;
        this.cli_dui = cli_dui;
        this.cli_residence = cli_residence;
        this.cli_telephone = cli_telephone;
        this.cli_category_id = cli_category_id;
        this.cat_type = cat_type;
    }

    public String getCat_type() {
        return cat_type;
    }

    public void setCat_type(String cat_type) {
        this.cat_type = cat_type;
    }

    public int getCli_id() {
        return cli_id;
    }

    public void setCli_id(int cli_id) {
        this.cli_id = cli_id;
    }

    public String getCli_name() {
        return cli_name;
    }

    public void setCli_name(String cli_name) {
        this.cli_name = cli_name;
    }

    public String getCli_date_birth() {
        return cli_date_birth;
    }

    public void setCli_date_birth(String cli_date_birth) {
        this.cli_date_birth = cli_date_birth;
    }

    public String getCli_dui() {
        return cli_dui;
    }

    public void setCli_dui(String cli_dui) {
        this.cli_dui = cli_dui;
    }

    public String getCli_residence() {
        return cli_residence;
    }

    public void setCli_residence(String cli_residence) {
        this.cli_residence = cli_residence;
    }

    public String getCli_telephone() {
        return cli_telephone;
    }

    public void setCli_telephone(String cli_telephone) {
        this.cli_telephone = cli_telephone;
    }

    public int getCli_category_id() {
        return cli_category_id;
    }

    public void setCli_category_id(int cli_category_id) {
        this.cli_category_id = cli_category_id;
    }
}
