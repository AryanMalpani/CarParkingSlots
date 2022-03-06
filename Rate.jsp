<%@ page import="java.sql.*" %> 
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html>
    <head>

        <link rel="stylesheet" href="dashboard.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

        <script type="text/javascript">
function openNav() {
  document.getElementById("mySidepanel").style.width = "200px"
  document.getElementById("mySidepanel").style.height = "1000px";
}

function closeNav() {
  document.getElementById("mySidepanel").style.width = "0";
}
</script>
    </head>
    <body ><!--

    <div id="mySidepanel" class="sidepanel">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">Dashboard</a>
  <a href="#">Services</a>
  <a href="#">Current</a>
  <a href="http://localhost:8080/parking/Logout">Logout</a>
</div>

<button class="openbtn" onclick="openNav()">&#9776; Toggle Sidepanel</button>-->

<%@ include file="DashTemplate.jsp" %>
<%
      String workerid=request.getParameter("workerid");
      String bookingid=request.getParameter("bookingid");
    %>
<center>
<br>
<form method="GET" action="Rated" style = "width : 30%;">
<input type="hidden" id="workerid" name="workerid" value= "<%=workerid %>">
        <input type="hidden" id="bookingid" name="bookingid" value= "<%=bookingid %>">
<div class="form-group">
<input min="1" max="5" name = rating type="number" class="form-control"  aria-describedby="emailHelp" placeholder="Rating" required>
</div>
<br>
<input type="submit" class="btn btn-secondary" value = "Submit">

<div class="form-group">

</center>