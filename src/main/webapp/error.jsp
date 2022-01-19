<%@ page language="java" contentType="text/html; charset=US-ASCII"
pageEncoding="US-ASCII" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sorry!Something went wrong</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
    body{
        background: linear-gradient(145deg,#00bfff,#808080 );
    }
    .error{
        background-color: linear-gradient(145deg,#00bfff,#808080 );
        text-align: center;
        justify-content: space-between;
     margin:    155px 0px 1px 1px;
     opacity: 0.69;
    }
    #dessign{

  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  text-decoration: none;
  border-radius: 5px;
  color: white;
  border: 1px solid green;
    }
    #dessign:hover{
        text-decoration: none;
        background-color: green;
        border-radius: 8px;
    }
    .error img{
        height: 200px;
        margin-right: 2px;
    }
    
a:visited {
  color: whitesmoke;
  text-decoration: none;
}


a:hover {

  text-decoration: black;
}

</style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <div class="container">
        <span class="navbar-brand mb-0 h1">Error-Page</span>
        <a href="WebHome.jsp" class="btn btn-outline-success" role="button">Home</a>
    </div>
</nav>
    <div class="error">
<img src="./images/4751207.png" alt="" srcset="">
<% if(response.getStatus() == 500){ %>
<font color="red">Error: <%=exception.getMessage() %></font><br>

<%-- include login page --%>
<%@ include file="WebHome.jsp"%>
<%}else {%>
    <h1>Ohh! Sorry This Data Not Found!</h1>
    <%=response.getStatus() %><br>
</p> Please go to <p>
   
    <div id="dessign">
 <a href="./SignIn.jsp">Back-Page</a>
<%} %>
</div>
</div>
</body>
</html>

</body>
</html>
<h1>
    
</h1>