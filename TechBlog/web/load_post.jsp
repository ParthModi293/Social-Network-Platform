


<%@page import="com.techblog.entities.User"%>
<%@page import="com.techblog.dao.likedao"%>
<%@page import="java.util.List"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.helper.connectionprovider"%>
<%@page import="com.techblog.dao.postdao"%>

<div class="row">

    <%
        
        User uu =(User) session.getAttribute("currentUser");

        Thread.sleep(1000);
        postdao d = new postdao(connectionprovider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {

            posts = d.getAllPosts();
        } else {

            posts = d.getPostbyCatid(cid);
        }
        if(posts.size()==0){
        
        out.println("<h3 class='display-3 text-center' >   NO POST AVAILABLE IN THIS  ...</h3>");
        
        }
        
        
        for (Post p : posts) {

    %>

    <div class="col-md-6 mt-2 " >

        <div class="card">
            <img class="card-img-top" src="blog_pic/<%= p.getPpic()%>" alt="Card image cap">

            <div class="card-body">

                <b><%= p.getPtitle()%> </b>
                <p><%= p.getPcontent()%> </p>

            </div>
                
                <div class="card-footer text-center primary-background">
                    
                       <% 
                            
                                likedao ld = new likedao(connectionprovider.getConnection());
                                
                                %>
                            
                                <a href="#!" onclick="doLike(<%= p.getPid()  %>,<%= uu.getId()  %>)"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
                          
                      <a href="show_blogPage.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More..</a>
<!--                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>-->
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                    
                </div>

        </div>

    </div>

    <%

        }

    %>

</div>