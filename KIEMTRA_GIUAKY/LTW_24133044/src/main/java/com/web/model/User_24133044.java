package com.web.model;

import java.sql.Timestamp;

public class User_24133044 {
    private int id;
    private String email;
    private String fullname;
    private int phone;
    private String passwd;
    private Timestamp signupDate;
    private Timestamp lastLogin;
    private boolean isAdmin;

    // Constructors
    public User_24133044() {}

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }
    
    public int getPhone() { return phone; }
    public void setPhone(int phone) { this.phone = phone; }
    
    public String getPasswd() { return passwd; }
    public void setPasswd(String passwd) { this.passwd = passwd; }
    
    public Timestamp getSignupDate() { return signupDate; }
    public void setSignupDate(Timestamp signupDate) { this.signupDate = signupDate; }
    
    public Timestamp getLastLogin() { return lastLogin; }
    public void setLastLogin(Timestamp lastLogin) { this.lastLogin = lastLogin; }
    
    public boolean isAdmin() { return isAdmin; }
    public void setAdmin(boolean isAdmin) { this.isAdmin = isAdmin; }
}
