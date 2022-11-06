/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author najera
 */
public class UsersC {
   private int useId;
    private String useRealName;
    private String userName;
    private String password;    
    private String rolType;
    private int rolId;
    

    public UsersC() {
    }

    public UsersC(int useId, String useRealName, String userName, String password, int rolId) {
        this.useId = useId;
        this.useRealName = useRealName;
        this.userName = userName;
        this.password = password;    
        this.rolId = rolId;
    }

    public int getUseId() {
        return useId;
    }

    public void setUseId(int useId) {
        this.useId = useId;
    }

    public String getUseRealName() {
        return useRealName;
    }

    public void setUseRealName(String useRealName) {
        this.useRealName = useRealName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRolType() {
        return rolType;
    }

    public void setRolType(String rolType) {
        this.rolType = rolType;
    }

    public int getRolId() {
        return rolId;
    }

    public void setRolId(int rolId) {
        this.rolId = rolId;
    }

   
    
}
