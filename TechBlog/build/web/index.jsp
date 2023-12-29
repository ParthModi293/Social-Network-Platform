
<%@page import="com.techblog.helper.connectionprovider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>

  

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .container-fluid{
            clip-path: circle(62.6% at 50% 35%);
            
        }
    </style>


    <body>
        <!--aa navigation import   -->

        <%@include file="navigationbar.jsp" %>

       

        <div class=" container-fluid p-0 m-0">

            <div class="jumbotron primary-background text-white">

                <div class="container ">

                    <h2 class="display-3">WELCOME TO SOCIAL LEARNING PORTAL</h2>
                    <P>Here, You Can share your ability to teach someone...</P>
                    <p>Java is a set of computer software and specifications developed by James Gosling at Sun Microsystems, which was later acquired by the Oracle Corporation, that provides a system for developing application software and deploying it in a cross-platform computing environment</p>


<!--                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-line-chart"></span>  Start Here! </button>-->
                    <a href="registrationPage.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-line-chart"></span>  START HERE</a>

                    <a href="loginpage.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa fa-gear fa-spin"></span>  LOGIN</a>


                </div>



            </div>



        </div>
        <br>

        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">JAVA SERVLET</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">GO TO..</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">JAVA MVC</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">GO TO..</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">JAVA SPRING-BOOT</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background text-white">GO TO..</a>
                        </div>
                    </div>
                </div>

            </div>


        </div>




     

        <script
            src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
            crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="javascript/MYJS.js" type="text/javascript"></script>


    </body>

</html>
