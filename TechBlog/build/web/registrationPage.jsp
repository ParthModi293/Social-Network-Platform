
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: circle(62.6% at 50% 35%);



            }
        </style>




        <title>Registration Page</title>
    </head>
    <body>

        <%@include file="navigationbar.jsp" %>
        <main class="primary-background   banner-background" style="padding-bottom:5px">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-user-circle fa-3x">

                            </span>
                            <h3> REGISTRATION</h3>

                        </div>

                        <div class="card-body">
                            <form id="reg-form" action="registerservlet" method="POST">

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input  name="user_name"type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input  name="user_password"type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>


                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <input type="radio" id="gender" name="gender" value="male" >male
                                    <input type="radio" id="gender" name="gender" value="female">female
                                </div>

                                <div class="form-group">

                                    <textarea  class=form-control  name="About" rows="3" cols="50" placeholder="write something about you"></textarea>


                                </div>


                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
                                </div>
                                <br>

                                <button id="submit-btn"  type="submit" class="btn btn-primary"  >Submit</button>
                            </form>

                        </div>                        
                    </div>

                </div>


            </div>



        </main>


        <script
            src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="javascript/MYJS.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <script>

                $(document).ready(function () {

                    console.log("loaded.......");

                    $('#reg-form').on('submit', function (event) {

                        event.preventDefault();

                        let form = new FormData(this);

                        //send register servlet..

                        $.ajax({

                            url: "registerservlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                                console.log(data)
                                
                                if(data.trim() === "done"){

                                swal("Successfully Registered.. we redirectd to login page..")
                                        .then((value) => {
                                            window.location("loginpage.jsp")
                                        });
                                        
                                        }
                                        else{
                                            swal(data);
                                        }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                swal("Something went wrong..");
                                     
                                        
                            },

                            processData: false,
                            contentType: false
                        });



                    });



                });

    </script>



</body>
</html>
