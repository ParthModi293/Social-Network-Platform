
package com.techblog.entities;
import java.sql.*;

public class User {
    private int ID;
    private String name;
    private String email;
    private String password;
    private String gender;
    private String about;
    private Timestamp DateTime;
    private String profile;

    public User(int ID, String name, String email, String password, String gender, String about,Timestamp DateTime){
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
     this.DateTime=DateTime;
    }

    public User() {
    }

    public User(String name, String email, String password, String gender, String about) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
      //this.DateTime = DateTime;
    }
    
    // getter and setter

    public int getId() {
        return ID;
    }

    public void setId(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getDateTime() {
        return DateTime;
    }

    public void setDateTime(Timestamp DateTime) {
        this.DateTime = DateTime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
    
}
