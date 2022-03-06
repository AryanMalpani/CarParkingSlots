<%@ page import="java.sql.*" %> 
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="java.util.Date" %> 

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
      ResultSet rs = (ResultSet) request.getAttribute("rs");
    %>
        <br>
        <center><h1 class="display-4">List of Workers</h1></center>
        <br>
        <br>

<table class="table  table-striped table-sm table-bordered" style="vertical-align: middle ;text-align: center ; width:90%">
  <thead>
    <tr>
        <th scope="col">Serial</th>
        <th scope="col">Name</th>
        <th scope="col">Username</th>
        <th scope="col">WorkerID</th>
        <th scope="col">Rating</th>
        <th scope="col" style="width:5%"></th>
        <th scope="col" style="width:5%"></th>
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

    

    int c = 0;
    int count =0;
    while (rs.next()) 
    {
        int workerid  = rs.getInt("userid");
        String username  = rs.getString("username");
        String firstname  = rs.getString("firstname");
        float rating = rs.getFloat("rating");
    %>
    <tr>
      <th scope="row"><%=++c%></th>
      <td><%=firstname%></td>
      <td><%=username%></td>
      <td><%=workerid%></td>
      <td><%=rating%></td>
      <td align='right'>
        <form method="GET" action="AdminEditWorker.jsp" style="vertical-align: middle ;text-align: center ;">
        
        <input type="submit" class="btn btn-outline-secondary" value = "Edit">
        <%-- <input type="hidden" id="slotno" name="slotno" value= "<%= slotno %>"> --%>
        <input type="hidden" id="workerid" name="workerid" value= "<%= workerid %>">
        </form>
      </td>
      <td align='right'>
        <form onsubmit=" return false;">
        <input type="hidden" id="workerid" name="workerid" value= "<%= workerid %>">
        
                <div class="popup" id="popup"> <input type="submit" class="btn btn-outline-danger" value = "Delete">
          <span class="popuptext" id="myPopup<%= count++ %>">Are you Sure?</form>
            <br>
            <form method="GET" action="AdminRemoveWorker" style = "display: inline-block">
        <input type="hidden" id="workerid" name="workerid" value= "<%= workerid %>">
          <button>Yes</button>
          </form>
          <button>Cancel</button>
          </span>
          
        </div>
        
      </td>
    </tr>
    <%
    }
    %>
    
  </tbody>
</table>

<br>
<button type="button" class="btn btn-outline-dark" id="add1">Add Worker</button>
<br>
<br>
<div class = "loc1">

<form method="POST" action="AdminAddWorker" style = "width : 30%;">

<div class="form-group">
<input name = username type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Username" required>
</div>
<br>
<div class="form-group">
<input name = password type="password" class="form-control"  aria-describedby="emailHelp" placeholder="Set Password" required>
</div>
<br>
<div class="form-group">
<input name = firstname type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Firstname" required>
</div>
<br>
<div class="form-group">
<input name = lastname type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Lastname" required>
</div>
<br>
<div class="form-group">
<input name = email type="email" class="form-control"  aria-describedby="emailHelp" placeholder="Email" required>
</div>
<br>

<div class="form-group">
<%-- <label for="exampleInputPassword1">Password</label> --%>
<input type="number" name = "phoneno" class="form-control" id="exampleInputPassword1" placeholder="Phone Number" required>
</div>
<br>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>

 <script src="./AdminWorkers.js"></script>


</center>
</body>
</html>