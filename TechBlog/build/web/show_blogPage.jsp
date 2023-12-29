

<%@page import="com.techblog.dao.likedao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.techblog.dao.userdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.entities.Post"%>
<%@page import="com.techblog.helper.connectionprovider"%>
<%@page import="com.techblog.dao.postdao"%>
<%@page import="com.techblog.entities.User"%>
<%@page errorPage="errorpage.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        
        response.sendRedirect("loginpage.jsp");
    }

%>

<%    int Postid = Integer.parseInt(request.getParameter("post_id"));
    
    postdao d = new postdao(connectionprovider.getConnection());
    
    Post p = d.getPostbyPostid(Postid);
    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=  p.getPtitle()%></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .container-fluid{
                clip-path: circle(62.6% at 50% 35%);

            }

            .post-title{

                font-weight: 100;
                font-size: 40px;
            }

            .post-content{

                font-weight: 100;
                font-size: 30px;
            }
            .post-user{
                font-size: 20px;

            }
            .post-date{
                font-style: italic;
                font-weight: bold;

            }

            .row-user{
                border: 2px dotted #9900cc;
                padding-top: 3px;

            }

            body{
                background: url(img/white-unsplash-9d0375d2.jpg);
                background-size: cover;
                background-attachment: fixed;
            }



        </style>
        
       <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0" nonce="1GYLa7zF"></script>

    </head>
    <body>
      

        <!-- NAVIGATION BAR -->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-building"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-comment"></span> ParthModi<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-mobile-phone"></span> Catagory
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming language</a>
                            <a class="dropdown-item" href="#">Programming Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-id-badge"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"  data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> DO-POST</a>
                    </li>

                </ul>


                <li class="nav-item navbar-nav mr-right">
                    <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                </li>      
                <li class="nav-item navbar-nav mr-right">
                    <a class="nav-link" href="logout"><span class="fa fa-drivers-license" ></span> LOG-OUT</a>
                </li>



            </div>
        </nav>



        <!-- END navbar -->

        <!--main content of body-->
        <div class="container">

            <div class="row my-4">
                <div class="col-md-8 offset-md-2">

                    <div class="card">
                        <div class="card-header text-center primary-background text-white">

                            <h2 class="post-title"><%= p.getPtitle()%></h2>
                        </div>

                        <div class="card-body">
                            <img class="card-img-top my-2" src="blog_pic/<%= p.getPpic()%>" alt="Card image cap">


                            <div class="row row-user">
                                <div class="col-md-8">
                                    <%
                                        
                                        userdao ud = new userdao(connectionprovider.getConnection());
                                        
                                    %>


                                    <p class="post-user"><a href="#!"><%=  ud.getUserbyuserid(p.getUserId()).getName() %></a> has posted..</p>

                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getPdate())  %></p>

                                </div>


                            </div>



                            <p class="post-content" ><b>Content : </b> <%= p.getPcontent()%></p>

                            <br>
                            <br>

                            <div class="post-code"
                                 <pre><b>Code : </b><%= p.getPcode()%></pre>
                            </div>

                        </div>

                        <div class="card-footer primary-background text-white">

<!--                            <a href="show_blogPage.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More..</a>-->
                            
                            <% 
                            
                                likedao ld = new likedao(connectionprovider.getConnection());
                                
                                %>
                            
                                <a href="#!" onclick="doLike(<%= p.getPid()  %>,<%= user.getId()  %>)"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
                            <a href="#!"  class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
                        </div>
                            
                            <div class="card-footer">
                                
                                <div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blogPage.jsp?post_id=<%= p.getPid() %>" data-width=""  data-numposts="5"></div>
                                
                                
                            </div>
                            


                    </div>



                </div>


            </div>






            <!--end of main content of body-->








            <!-- Modal -->
            <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header primary-background text-white">
                            <h5 class="modal-title " id="exampleModalLabel" >TECHBLOG</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="container text-center">
                                <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 200px">
                                <h5 class="modal-title  mt-3" id="exampleModalLabel" ><%=   user.getName()%></h5>

                                <!-- details.. -->
                                <div id="profile-detail">

                                    <table class="table">

                                        <tbody>
                                            <tr>
                                                <th scope="row">ID :</th>
                                                <td><%= user.getId()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Email : </th>
                                                <td><%= user.getEmail()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Gender : </th>
                                                <td><%= user.getGender()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">About  : </th>
                                                <td><%= user.getAbout()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Registered on  : </th>
                                                <td><%= user.getDateTime().toString()%></td>

                                            </tr>
                                        </tbody>
                                    </table>

                                </div>

                                <!-- profile-edit -->

                                <div id="profile-edit" style="display: none">

                                    <h3 class="mt-2"> EDIT INFORMATION </h3>
                                    <form action="editservlet" method="post" enctype="multipart/form-data">
                                        <table class="table">
                                            <tr>
                                                <td>ID :</td>
                                                <td><%= user.getId()%></td>

                                            </tr>
                                            <tr>
                                                <td>EMAIL :</td>
                                                <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>" </td>

                                            </tr>

                                            <tr>
                                                <td>NAME  :</td>
                                                <td><input type="text" name="user_name" class="form-control" value="<%= user.getName()%>" </td>

                                            </tr>

                                            <tr>
                                                <td>PASSWORD :</td>
                                                <td><input type="password" name="user_password" class="form-control" value="<%= user.getEmail()%>" </td>

                                            </tr>

                                            <tr>
                                                <td>ABOUT  :</td>
                                                <td><textarea  name="user_about" class="form-control" rows="3"><%= user.getAbout()%></textarea> </td>

                                            </tr>

                                            <tr>
                                                <td>PROFILE PIC :</td>
                                                <td> <input type="file" name="image" class="form-control"> </td>

                                            </tr>

                                        </table>

                                        <div class="container">
                                            <button type="submit" class="btn btn-outline-primary">SAVE</button>

                                        </div>

                                    </form>


                                </div>

                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button id="edit-profile-btn" type="button" class="btn btn-primary">EDIT</button>
                        </div>
                    </div>
                </div>
            </div>







            <!--end of  profile model -->


            <!-- start addpost modal -->




            <!-- Modal -->
            <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Post Details..</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <form id="add-post-form" action="AddPostServlet" method="post">

                                <div class="form-group">

                                    <select class="form-control " name="cid">
                                        <option selected disabled>...Select Category...</option>

                                        <%
                                            
                                            postdao ps = new postdao(connectionprovider.getConnection());
                                            
                                            ArrayList<Category> list = ps.getAllCategories();
                                            for (Category c : list) {
                                        %>


                                        <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                        <%
                                            }

                                        %>

                                    </select>

                                </div>

                                <div class="form-group">
                                    <input  name="pTitle" type="text" placeholder="enter Title" class="form-control"/>
                                </div>

                                <div class="form-group">
                                    <textarea name="pContent" class="form-control" placeholder="Enter Your Content" style="height: 200px;"></textarea>

                                </div>

                                <div class="form-group">
                                    <textarea name="pCode" class="form-control" placeholder="Enter Your Code" style="height: 200px;"></textarea>

                                </div>

                                <div class="form-group">
                                    <label>Choose pic..</label>
                                    <br>
                                    <input  type="file" name="pic">

                                </div>

                                <div class="container text-center" >
                                    <button type="submit" class="btn btn-outline-primary" >POST</button>

                                </div>


                            </form>    


                        </div>

                    </div>
                </div>
            </div>



            <!-- end of addpost modal -->




     
            
            
            
            


            <script
                src="https://code.jquery.com/jquery-3.6.1.min.js"
                integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
                crossorigin="anonymous">
            </script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
            <script src="javascript/MYJS.js" type="text/javascript"></script>



            <script>
                    
                    $(document).ready(function () {
                        
                        let editStatus = false;
                        $('#edit-profile-btn').click(function () {
                            
                            if (editStatus == false) {
                                
                                $('#profile-detail').hide();
                                $('#profile-edit').show();
                                editStatus = true;
                                $(this).text("BACK");
                            } else {
                                
                                $('#profile-detail').show();
                                $('#profile-edit').hide();
                                editStatus = false;
                                $(this).text("EDIT")
                            }
                            
                        });
                    });
            </script>

            <!-- now add post js-->

            <script>
                $(document).ready(function (e) {
                    
                    $("#add-post-form").on("submit", function (event) {
                        
                        // when submit the form..
                        
                        event.preventDefault();
                        console.log("you have clicked on submit.")
                        let form = new FormData(this);
                        $.ajax({
                            
                            url: "AddPostServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                                
                                console.log(data);
                                if (data.trim() == 'done') {
                                    
                                    swal("Good job!", " Saved succesfully ", " success ");
                                } else {
                                    
                                    swal("Error..", "something went wrong.", "error");
                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                swal("Error..", "something went wrong.", "error");
                            },
                            processData: false,
                            contentType: false
                                    
                                    
                        })
                        
                        
                    })
                    
                    
                })
                
                
            </script>


    </body>
</html>
