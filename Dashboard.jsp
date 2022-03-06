<%@ page import="java.sql.*" %> 

<html>
    <head>

        <link rel="stylesheet" href="dashboard1.css">
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
    <body style = "background-image:"><div class = "background"><!--
      
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

      <br><%= (String)session.getAttribute("username")%>
        <center><h1 class="display-2" style = "color:white; text-shadow:1px 1px black;">Dashboard</h1>
        <!--<hr class="line" style = "width:40%">-->
        

        <%
        ResultSet userinfo = (ResultSet) request.getAttribute("userinfo");
          userinfo.next();
          if(userinfo.getInt("workings") == 5)
          {
              %>
              Congratulations You are Eligible For Coupon Code To Get 25% off on your next book<br>
              Check Profile to find promo code
              <%
          }
          %>
        <center><div class="container1">
        <form method="GET" action="dash">
        <label for="start" class="mb-5" style="color: black; font-weight:normal; font-size: 20px;" >Location :</label>
        <select name="lid" id="lid">
          <%
          ResultSet locations = (ResultSet) request.getAttribute("locations");

          

          while (locations.next()) 
          {
              int lid  = locations.getInt("lid");
              String lname  = locations.getString("lname");
              
              %>
              <option value="<%= lid%>" id="t1"><%= lname%></option>
              <%
          }
          %>
          </select>
        <br>
        <label for="start" class="mb-5" style="color: black; font-weight:normal; font-size: 20px;">Start date :</label>
        <input type="date" id="start" name="startdate" class="date">&nbsp;&nbsp;&nbsp;
        <label for="appt" class="mb-5" style="color: black; font-weight:normal; font-size: 20px;">Start Time :</label>
        <input type="time" id="appt" name="starttime" class="date1"><br>
        <label for="end" class="mb-5" style="color: black; font-weight:normal; font-size: 20px;">End date :</label>
        <input type="date" id="end" name="enddate" class="date">&nbsp;&nbsp;&nbsp;
        <label for="appt" class="mb-5" style="color: black; font-weight:normal; font-size: 20px;">End Time :</label>
        <input type="time" id="appt" name="endtime" class="date1"><br>
        <center><button type="submit" class="submit1">Submit</button></center>
</form> 
      </div></center>
                
   <!--        <form action = "Logout">
            <input type = "submit" value = "Logout">
        </form>-->
      </div>  
      </div>
      

    </body>
</html>