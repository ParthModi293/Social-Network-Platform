
<%@page import="com.techblog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.helper.connectionprovider"%>
<%@page import="com.techblog.dao.postdao"%>
<%@page import="com.techblog.entities.Message"%>
<%@page import="com.techblog.entities.User"%>
<%@page errorPage="errorpage.jsp" %>


<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {

        response.sendRedirect("loginpage.jsp");
    }

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .container-fluid{
            clip-path: circle(62.6% at 50% 35%);

        }
        
           body{
                background: url(img/pexels-pixabay-255464.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
    </style>





    <title>JSP Page</title>
</head>



<body>

    <!-- here is a navbar -->

    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-building"></span> TechBlog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><span class="fa fa-comment"></span> ParthModi<span class="sr-only">(current)</span></a>
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



    <!-- end-navbar -->




    <%

        Message m = (Message) session.getAttribute("msg");

        if (m != null) {

    %>
    <div class="alert alert-success" role="alert">
        <%= m.getContent()%>
    </div>

    <%

            session.removeAttribute("msg");

        }

    %>

    <!-- AA MAIN CONTENT of PROFILE-->


    <main>
        <div class="container">
            <div class="row mt-4">

            
                <div class="col-md-4">

                    <!--category-->
                    <div class="list-group">
                        <a href="#" onclick="getPosts(0, this)" class=" c-link list-group-item list-group-item-action active primary-background text-white">  ALL POSTS  </a>


                        <!--Categories-->

                        <%                            postdao d = new postdao(connectionprovider.getConnection());
                            ArrayList<Category> list1 = d.getAllCategories();

                            for (Category cc : list1) {

                        %>

                        <a href="#" onclick =" getPosts(<%= cc.getCid()%>, this)"class="c-link list-group-item list-group-item-action primary-background text-white"><%=  cc.getName()%></a>



                        <%
                            }


                        %>


                    </div>


                </div>
                <!--second colum-->

                <div class="col-md-8" >

                    <!--post-->

                    <div class="container text-center" id="loader">

                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h2 class="mt-4"> Please Wait... </h2>
                    </div>

                    <div class="container" id="post-container">

                    </div>

                </div>

            </div>



        </div>


    </main>



    <!-- ENDING OF BODY -->







    <!-- profile model -->
    
            <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="editservlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control" >
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>    

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->

        <!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        postdao postd = new postdao(connectionprovider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>

    
    
    



    
    <!--LOADING POST-->
    <script
            src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="javascript/MYJS.js" type="text/javascript"></script>
        
        
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function ()
                                    {
                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()
                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()
                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit")
                                        }
                                    })
                                });
        </script>
        <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

        <script>
        
        

        function getPosts(catid, temp) {
            $("#loader").show();
            $("#post-container").hide();
            $(".c-link").removeClass('active')

            $.ajax({

                url: "load_post.jsp",
                data: {cid: catid},
                success: function (data, textStatus, jqXHR) {
                    console.log(data);
                    $("#loader").hide();
                    $("#post-container").show();

                    $("#post-container").html(data);
                    $(temp).addClass('active')
                }
            })

        }




        $(document).ready(function (e)
        {
            let getAllRef = $('.c-link')[0]
            getPosts(0,getAllRef);
        })
    </script>

</body>   
</html>



