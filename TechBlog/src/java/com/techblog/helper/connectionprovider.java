
package com.techblog.helper;



import java.sql.*;
public class connectionprovider {
    
    private static Connection con;
     public static Connection getConnection(){
         
         try{
             if(con==null){
                 Class.forName("com.mysql.jdbc.Driver");
                 
                 con= DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "1111");
                 
             }
         
         }
         catch(Exception e){
          
             e.printStackTrace();
         }
         
         
         
         return con;
     }
    
    
    
    
}
