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
<link rel="stylesheet" href="AdminSlots.css">
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
        ResultSet live = (ResultSet) request.getAttribute("live");
        ResultSet past = (ResultSet) request.getAttribute("past");

          %>
          <br>
          <center>
          <h1 class="display-6">Past:</h1>
        
<table class="table  table-striped table-sm table-bordered" style="vertical-align: middle ;text-align: center ; width:90%">
  <thead>
    <tr>
        <th scope="col">Bookingid</th>
        <th scope="col">Location</th>
        <th scope="col">Slot no.</th>
        <th scope="col">WorkerId</th>
        
        <%-- <th scope="col" style="width:5%"></th> --%>
        <th scope="col" style="width:5%">Rating</th>
    </tr>
  </thead>
  <tbody>
    <%
        /*private Long calculateDifference(String date1, String date2, String value) {
        Timestamp date_1 = stringToTimestamp(date1);
        Timestamp date_2 = stringToTimestamp(date2);
        long milliseconds = date_1.getTime() - date_2.getTime();
        if (value.equals("second"))
            return milliseconds / 1000;
        if (value.equals("minute"))
            return milliseconds / 1000 / 60;
        if (value.equals("hours"))
            return milliseconds / 1000 / 3600;
        else
            return new Long(999999999);
        }

        private Timestamp stringToTimestamp(String date) {
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date parsedDate = dateFormat.parse(date);
            return new Timestamp(parsedDate.getTime());
        } catch (Exception e) {
            return null;
        }
        }*/

        //private static final SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //System.out.println(sdf3.format(timestamp)); 

    

    int count =0;
    while (past.next()) 
    {
        int bookingid  = past.getInt("bookingid");
        String location  = past.getString("lname");
        int slotno = past.getInt("slotno");
        int workerid = past.getInt("wid");
        int brating = past.getInt("brating");
    %>
    <tr>
      <td><%=bookingid%></td>
      <td><%=location%></td>
      <td><%=slotno%></td>
      <td><%=workerid%></td>
      <td align='right'>
      <%
      if(brating==0)
      {
    %>
                <%-- <div class="popup" > <input type="submit" class="btn btn-outline-danger" value = "Rate">
          <span class="popuptext" id="myPopup<%= count++ %>">Are you Sure?
            <br> --%>
            <form method="GET" action="Rate.jsp" style = "display: inline-block">
        <input type="hidden" id="workerid" name="workerid" value= "<%=workerid %>">
        <input type="hidden" id="bookingid" name="bookingid" value= "<%=bookingid %>">
          <button class="btn btn-outline-danger">Rate</button>
          </form>
          <%-- <button>Cancel</button>
          </span>
          
        </div> --%>
        <%
      }
      else
      {
          %>
          <%=brating%>
          <%
      }
      %>
      </td>
    </tr>
    <%
    }
    %>
    
  </tbody>
  
</table>
<br><hr style="width:95%"><br>
<h1 class="display-6">Live & Upcoming:</h1>

<table class="table  table-striped table-sm table-bordered" style="vertical-align: middle ;text-align: center ; width:90%">
  <thead>
    <tr>
        <th scope="col">Bookingid</th>
        <th scope="col">Location</th>
        <th scope="col">Slot no.</th>
        <th scope="col">Start Time</th>
        <th scope="col">End Time</th>
        
        <%-- <th scope="col" style="width:5%"></th> --%>
        <%-- <th scope="col" style="width:5%">Rating</th> --%>
    </tr>
  </thead>
  <tbody>
    <%

    
    while (live.next()) 
    {
        int bookingid  = live.getInt("bookingid");
        String location  = live.getString("lname");
        int slotno = live.getInt("slotno");
        int workerid = live.getInt("wid");
    %>
    <tr>
      <td><%=live.getInt("bookingid")%></td>
      <td><%=location%></td>
      <td><%=slotno%></td>
      <td><%=live.getTimestamp("starttime")%></td>
      <td><%=live.getTimestamp("endtime")%></td>
    </tr>
    <%
    }
    %>
    
  </tbody>
  
</table>



        </center>    
         <script src="./Bookings.js"></script>  

    </body>
</html>