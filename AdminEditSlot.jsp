<%@ page import="java.sql.*" %> 
<%
if((int)session.getAttribute("type") != 0){
	response.sendRedirect("Login.jsp");}
%>
<html>
    <head>
 
        <link rel="stylesheet" href="dashboard.css">
 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
 
        <script type="text/javascript">
function openNav() {
  document.getElementById("mySidepanel").style.width = "250px"
  document.getElementById("mySidepanel").style.height = "1000px";
}
 
function closeNav() {
  document.getElementById("mySidepanel").style.width = "0";
 
  
}
</script>
 
    <link rel="stylesheet" href="AdminSlots.css">
    </head>
    <body>
      <%@ include file="AdminDashTemplate.jsp" %>
      <center>
    <%
      String slotno=request.getParameter("slotno");
      String sid=request.getParameter("sid");
    %>
    <br>

    <h1 class="display-6">Edit Slot <%=slotno%></h1>
    <br>

<form method="GET" action="AdminEditSlot" style = "width : 30%;">

  <%-- <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name = sid type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Slot Number" required>
    <small id="emailHelp" class="form-text text-muted">Try to maintain the consistency in the slot numbers.</small>
  </div>
  <br> --%>

    <div class="form-check" style = "width : 85%;">
        <select name = size class="form-control" required>
        <option selected hidden>Slot Size</option>
        <option value="0">Small</option>
        <option value="1">Big</option>
        </select>
    </div>
<input type="hidden" id="sid" name="sid" value= "<%= sid %>">
    <br>

    <div class="form-group">
    <%-- <label for="exampleInputPassword1">Password</label> --%>
    <input type="number" name = "workerid" class="form-control" id="exampleInputPassword1" placeholder="Worker Id" required>
  </div>
<br>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
    