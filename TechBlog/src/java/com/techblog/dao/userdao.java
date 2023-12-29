package com.techblog.dao;

import com.techblog.entities.User;
import java.sql.*;

public class userdao {

    private Connection con;

    public userdao(Connection con) {
        this.con = con;
    }

    // we will cretae method to insert user to database...
    public boolean saveuser(User user) {

        boolean f = false;   // aprne kbr kevi rite pre ke user e add kryu ena mate first value false rakhvani,  jevu add thse value true thai jse...
        try {
            //user--> to databse

            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";

            PreparedStatement ps = this.con.prepareStatement(query);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());

            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // get user by usremail and userpassword
    public User getuserByEmailAndPassword(String email, String password) {

        User user = null;

        try {

            String query = "select * from user where email=? and password=?";
            PreparedStatement pt = con.prepareStatement(query);

            pt.setString(1, email);
            pt.setString(2, password);

            ResultSet set = pt.executeQuery();

            if (set.next()) {

                user = new User();

                // data from database
                //  String name=set.getString("name");
                //set to user object..
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setGender(set.getString("gender"));
                user.setId(set.getInt("ID"));
                user.setPassword(set.getString("password"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("regtime"));
                user.setProfile(set.getString("profile"));

            } else {

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateuser(User user) {
boolean f= false;
        try {
            
            String query = " update user set name=?, email=?, password=?, gender=?, about=?, profile=? where ID=?";
            
            PreparedStatement p = con.prepareStatement(query);
            
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());
            
            p.executeUpdate();
            f=true;
            
            
        } catch (Exception e) {

            e.printStackTrace();

        }
return f;
    }
    
    public User getUserbyuserid(int userId){
        
        User user=null;
        try {
                String q = "select* from user where ID=?";
        PreparedStatement ps =this.con.prepareStatement(q);
        
        ps.setInt(1, userId);
        
        ResultSet set = ps.executeQuery();
        
        if(set.next()){
                user = new User();

                // data from database
                //  String name=set.getString("name");
                //set to user object..
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setGender(set.getString("gender"));
                user.setId(set.getInt("ID"));
                user.setPassword(set.getString("password"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("regtime"));
                user.setProfile(set.getString("profile"));
            
            
        }else{
            
            
        }
        
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }

}
