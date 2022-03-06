<%@ page import="java.sql.*" %> 
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Timestamp"%>
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
<!--<div id="mySidepanel" class="sidepanel">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a href="#">Dashboard</a>
            <a href="#">Services</a>
            <a href="#">Current</a>
            
</div>
          
          <nav class="navbar navbar-light bg-light">
            <button class="openbtn" onclick="openNav()">&#9776; </button>
            <a href="http://localhost:8080/parking/Logout" class="logout">Logout</a>
          </nav> -->

        

        <%
        ResultSet userinfo = (ResultSet) request.getAttribute("userinfo");
          userinfo.next();

          String firstname = userinfo.getString("firstname");
          String lastname = userinfo.getString("lastname");
          String username = userinfo.getString("username");
          String email = userinfo.getString("email");
          String phoneno = userinfo.getString("phoneno");
          String wallet = userinfo.getString("wallet");
          String carno = userinfo.getString("carno");
          String promocode = userinfo.getString("promocode");

          SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
          Timestamp timestamp = new Timestamp(System.currentTimeMillis());
          
          %>
          <br>
        <center>
        <h1 class="display-1"><%=firstname%> <%=lastname%></h1>
        <br><hr style="width:40%"><br>
        
        <h1 class="display-6">Username: <%=username%></h1>
        <%-- <br> --%>
        <h1 class="display-6">Email: <%=email%></h1>
        <%-- <br> --%>
        <h1 class="display-6">Phone Number: <%=phoneno%></h1>
        <br><hr style="width:40%"><br>
        <h1 class="display-6">Wallet Balance: <%=wallet%></h1>
        <%
        if(userinfo.getInt("workings") == 5)
          {
              %>
              <br><hr style="width:40%"><br>
              <h1 class="display-6">Promo Code: <%=promocode%></h1>
              Apply this code during checkout to get 25% off on your booking
              <%            
          }
        %>



        </center>      

    </body>
</html>