

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <title>SOMETHING WENT WRONG!!!!</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="CSS/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background{
                clip-path: circle(62.6% at 50% 35%);

            }
            </style>
            
            </head>
            <body>
                
                <div class="container text-center">
                    
                    <image src="img/error.png " class="img-fluid">
                    <h3>Sorry!! Something went wrong!</h3>
                    
                    
                    <%=exception %>
                    <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">HOME</a>
                </div>
                
                
                
            </body>
            </html>
