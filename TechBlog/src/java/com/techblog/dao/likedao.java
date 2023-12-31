
package com.techblog.dao;
import java.sql.*;


public class likedao {
    
    Connection con;

    public likedao(Connection con) {
        this.con = con;
    }
    
    
 
    public boolean insertLike(int pid, int uid){
          
          boolean f=false;
        try {
          
         
            String q ="Insert into liked(pid,uid) values (?,?)";
            
            PreparedStatement p = this.con.prepareStatement(q);
            
            p.setInt(1, pid);
            p.setInt(2, uid);
            
            p.executeUpdate();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f ;
    }
    
    
    public int countLikeOnPost(int pid){
        
        int count=0;
        
        try {
            
             String q =" select count(*) from liked  where pid=?";
             
             PreparedStatement p=this.con.prepareStatement(q);
             p.setInt(1,pid);
             
             // table mathi result kaarvu hoy to resultset use thy and executequery() thy..
             
             ResultSet set = p.executeQuery();
             
             if(set.next()){
                 
                 count = set.getInt("count(*)");
                 
             }else{
                 
             }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return count;
    }
    
    public boolean isLikeByUser(int pid, int uid){
        
        boolean f  = false;
        try {
            
            PreparedStatement p = this.con.prepareStatement("select * from liked where pid=? and uid=?");
            
            p.setInt(1,pid);
            p.setInt(2,uid);
            ResultSet set = p.executeQuery();
            if(set.next()){
                f=true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public boolean deleteLike(int pid, int uid){
        boolean f=false;
        try {
            
            PreparedStatement p = this.con.prepareStatement("delete from liked where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f=true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
}



