
package com.techblog.dao;

import com.techblog.entities.Category;
import com.techblog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class postdao {
    
    Connection con;

    public postdao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        
        
        try {
            
            String q = "select * from category";
            
            Statement st=this.con.createStatement();
            
            ResultSet set=st.executeQuery(q);
            while(set.next()){
                
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description = set.getString("description");
                
                Category c = new Category(cid,name,description );
                list.add(c);
                
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
    
    
    public boolean postsave(Post p){
        boolean f=false;
        
        try {
            
            
            String q = "insert into post(ptitle, pcontent, pcode, ppic, catid, userId) values(?,?,?,?,?,?)";
            
            PreparedStatement pst = con.prepareStatement(q);
            
            
            pst.setString(1, p.getPtitle());
            pst.setString(2, p.getPcontent());
            pst.setString(3, p.getPcode());
            pst.setString(4, p.getPpic());
            pst.setInt(5, p.getCatid());
            pst.setInt(6, p.getUserId());
            
            pst.executeUpdate();
            
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
//    get all the post
    
    public List<Post> getAllPosts(){
        
      List<Post> list = new ArrayList<>();
      
//      fetch all post

        try {
            
            PreparedStatement p = con.prepareStatement("select * from post order by pid desc");
            
            ResultSet set = p.executeQuery();
            
            while(set.next()){
            
            int pid = set.getInt("pid");
            String ptitle = set.getString("ptitle");
            String pcontent = set.getString("pcontent");
            String pcode = set.getString("pcode");
            String ppic = set.getString("ppic");
            Timestamp date = set.getTimestamp("pdate");
            int catid = set.getInt("catid");
            int userId = set.getInt("userId");
            
            Post ps= new Post(pid, ptitle, pcontent, pcode, ppic, date, catid, userId);
            
            list.add(ps);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

      return list;
    }
    
    
    
    public List<Post> getPostbyCatid(int catid){
        
        List<Post> list = new ArrayList<>();
        
        // fetch post by Id
        
        try {
            
            PreparedStatement p = con.prepareStatement("select * from post where catid=?");
            p.setInt(1, catid);
            
            ResultSet set = p.executeQuery();
            
            while(set.next()){
            
            int pid = set.getInt("pid");
            String ptitle = set.getString("ptitle");
            String pcontent = set.getString("pcontent");
            String pcode = set.getString("pcode");
            String ppic = set.getString("ppic");
            Timestamp date = set.getTimestamp("pdate");
            int userId = set.getInt("userId");
            
            Post ps= new Post(pid, ptitle, pcontent, pcode, ppic, date, catid, userId);
            
            list.add(ps);
        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        
        return list;
    }
    
    
    public Post getPostbyPostid(int postid){
        Post post=null;
        String q="select * from post where pid=?";
        try{
        PreparedStatement p= this.con.prepareStatement(q);
        
        p.setInt(1, postid);
        
        
        ResultSet set = p.executeQuery();
        if(set.next()){
               int pid = set.getInt("pid");
            String ptitle = set.getString("ptitle");
            String pcontent = set.getString("pcontent");
            String pcode = set.getString("pcode");
            String ppic = set.getString("ppic");
            Timestamp date = set.getTimestamp("pdate");
            int userId = set.getInt("userId");
            int cid= set.getInt("catid");
            
            post= new Post(pid, ptitle, pcontent, pcode, ppic, date, cid, userId);
         
            
        }else{
            
        }
        
        
        }
        catch(Exception e){
            e.printStackTrace();
        }
    
    return post;
    }
    
    
}
