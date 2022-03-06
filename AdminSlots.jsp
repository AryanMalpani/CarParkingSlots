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
      ResultSet locations = (ResultSet) request.getAttribute("locations");
      ResultSet loc1 = (ResultSet) request.getAttribute("loc1");
      ResultSet loc2 = (ResultSet) request.getAttribute("loc2");
      ResultSet loc3 = (ResultSet) request.getAttribute("loc3");
      ResultSet loc4 = (ResultSet) request.getAttribute("loc4");
      
        int count = 0;
    %>
        <br>
        <h1 class="display-4">List of Slots</h1>
        <br>
 
                
 
        <%-- <option value="T1" id="t1">abcd1</option>
        <option value="T2" id="t2">T2</option>
        <option value="T3" id="t3">T3</option>
        <option value="T4" id="t4">T4</option> --%>
        
        
 
 
<div  id="tablediv1">
 
        <br>
        <% locations.next();%>
        <h1 class="display-6"> <%= locations.getString("lname")%></h1>
        <br>
<table class="table  table-striped table-sm table-bordered" style="vertical-align: middle ;text-align: center ; width:90%">
  <thead>
    <tr>
        <th scope="col">Slot no</th>
        <th scope="col">Type</th>
        <th scope="col">Slot Id</th>
        <th scope="col">Worker Username</th>
        <th scope="col">Worker Id</th>
        <th scope="col">Worker Rating</th>
        <th scope="col" style="width:5%"></th>
        <th scope="col" style="width:5%"></th>
    </tr>
  </thead>
  <tbody>
    <%
    while (loc1.next()) 
    {
        int slotno  = loc1.getInt("slotno");
        int typeno  = loc1.getInt("stype");
        int sid = loc1.getInt("sid");
        String workername = loc1.getString("username");
        int workerid = loc1.getInt("userid");
        float rating = loc1.getFloat("rating");
        String type = "";
        if (typeno == 1)
            type = "Big";
        else if (typeno == 0)
            type = "Small";
    %>
    <tr>
      <%-- <input type="hidden" id="sid" name="sid" value= "<%= sid %>"> --%>
      <td><%=slotno%></td>
      <td><%=type%></td>
      <td><%=sid%></td>
      <td><%=workername%></td>
      <td><%=workerid%></td>
      <td><%=rating%></td>
      <td align='right'>
        <form method="GET" action="AdminEditSlot.jsp" style="vertical-align: middle ;text-align: center ;">
        
        <input type="submit" class="btn btn-outline-secondary" value = "Edit">
        <input type="hidden" id="slotno" name="slotno" value= "<%= slotno %>">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
        </form>
      </td>
      <td align='right'>
        <form onsubmit=" return false;">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
        
                <div class="popup" id="popup"> <input type="submit" class="btn btn-outline-danger" value = "Delete">
          <span class="popuptext" id="myPopup<%= count++ %>">Are you Sure?</form>
            <br>
            <form method="GET" action="AdminRemoveSlot" style = "display: inline-block">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
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
 
<button type="button" class="btn btn-outline-dark" id="add1">Add Slot</button>
<br>
<br>
<div class = "loc1">
 
<form method="GET" action="AdminAddSlot" style = "width : 30%;">
 
  <div class="form-group">
<input name = username type="text" class="form-control"  aria-describedby="emailHelp" placeholder="Username" required>
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
<br>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
 
<br>
<br>
 
</div>
 
<div  id="tablediv2">
        <br>
        <% locations.next();%>
        <h1 class="display-6"> <%= locations.getString("lname")%></h1>
        <br>
<table class="table  table-striped table-sm table-bordered" style="vertical-align: middle ;text-align: center ; width:90%">
              <thead>
    <tr>
        <th scope="col">Slot no</th>
        <th scope="col">Type</th>
        <th scope="col">Slot Id</th>
        <th scope="col">Worker Username</th>
        <th scope="col">Worker Id</th>
        <th scope="col">Worker Rating</th>
        <th scope="col" style="width:5%"></th>
        <th scope="col" style="width:5%"></th>
    </tr>
  </thead>
  <tbody>
    <%
    while (loc2.next()) 
    {
        int slotno  = loc2.getInt("slotno");
        int typeno  = loc2.getInt("stype");
        int sid = loc2.getInt("sid");
        String workername = loc2.getString("username");
        int workerid = loc2.getInt("userid");
        float rating = loc2.getFloat("rating");
        String type = "";
        if (typeno == 1)
            type = "Big";
        else if (typeno == 0)
            type = "Small";
    %>
    <tr>
      <%-- <input type="hidden" id="sid" name="sid" value= "<%= sid %>"> --%>
      <td><%=slotno%></td>
      <td><%=type%></td>
      <td><%=sid%></td>
      <td><%=workername%></td>
      <td><%=workerid%></td>
      <td><%=rating%></td>
      <td align='right'>
        <form method="GET" action="AdminEditSlot.jsp" style="vertical-align: middle ;text-align: center ;">
        
        <input type="submit" class="btn btn-outline-secondary" value = "Edit">
        <input type="hidden" id="slotno" name="slotno" value= "<%= slotno %>">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
        </form>
      </td>
      <td align='right'>
        <form onsubmit=" return false;">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
        
                <div class="popup" id="popup"> <input type="submit" class="btn btn-outline-danger" value = "Delete">
          <span class="popuptext" id="myPopup<%= count++ %>">Are you Sure?</form>
            <br>
            <form method="GET" action="AdminRemoveSlot" style = "display: inline-block">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
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
 
<button type="button" class="btn btn-outline-dark" id="add2">Add Slot</button>
<br>
<br>
 
<div class = "loc2">
 
<form method="GET" action="AdminAddSlot" style = "width : 30%;">
 
  <div class="form-group">
    <%-- <label for="exampleInputEmail1">Email address</label> --%>
    <input name = slotno type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Slot Number" required>
    <small id="emailHelp" class="form-text text-muted">Try to maintain the consistency in the slot numbers.</small>
  </div>
  <br>
 
    <div class="form-check" style = "width : 85%;">
        <select name = size class="form-control" required>
        <option selected hidden>Slot Size</option>
        <option value="0">Small</option>
        <option value="1">Big</option>
        </select>
    </div>
 
    <br>
 
    <div class="form-group">
    <%-- <label for="exampleInputPassword1">Password</label> --%>
    <input type="number" name = "workerid" class="form-control" id="exampleInputPassword1" placeholder="Worker Id" required>
    <input type="hidden" name = "loc_id" class="form-control" value = 2 required>
  </div>
<br>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
 
 
<br>
<br>
 
          </table>
 
</div>
 
        <div  id="tablediv3">
                <br>
        <% locations.next();%>
        <h1 class="display-6"> <%= locations.getString("lname")%></h1>
        <br>
<table class="table  table-striped table-sm table-bordered" style="vertical-align: middle ;text-align: center ; width:90%">
              <thead>
    <tr>
        <th scope="col">Slot no</th>
        <th scope="col">Type</th>
        <th scope="col">Slot Id</th>
        <th scope="col">Worker Username</th>
        <th scope="col">Worker Id</th>
        <th scope="col">Worker Rating</th>
        <th scope="col" style="width:5%"></th>
        <th scope="col" style="width:5%"></th>
    </tr>
  </thead>
  <tbody>
    <%
    while (loc3.next()) 
    {
        int slotno  = loc3.getInt("slotno");
        int typeno  = loc3.getInt("stype");
        int sid = loc3.getInt("sid");
        String workername = loc3.getString("username");
        int workerid = loc3.getInt("userid");
        float rating = loc3.getFloat("rating");
        String type = "";
        if (typeno == 1)
            type = "Big";
        else if (typeno == 0)
            type = "Small";
    %>
    <tr>
      <%-- <input type="hidden" id="sid" name="sid" value= "<%= sid %>"> --%>
      <td><%=slotno%></td>
      <td><%=type%></td>
      <td><%=sid%></td>
      <td><%=workername%></td>
      <td><%=workerid%></td>
      <td><%=rating%></td>
      <td align='right'>
        <form method="GET" action="AdminEditSlot.jsp" style="vertical-align: middle ;text-align: center ;">
        
        <input type="submit" class="btn btn-outline-secondary" value = "Edit">
        <input type="hidden" id="slotno" name="slotno" value= "<%= slotno %>">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
        </form>
      </td>
      <td align='right'>
        <form onsubmit=" return false;">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
        
                <div class="popup" id="popup"> <input type="submit" class="btn btn-outline-danger" value = "Delete">
          <span class="popuptext" id="myPopup<%= count++ %>">Are you Sure?</form>
            <br>
            <form method="GET" action="AdminRemoveSlot" style = "display: inline-block">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
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
 
<button type="button" class="btn btn-outline-dark" id="add3">Add Slot</button>
 
<br>
<br>
<div class = "loc3">
<form method="GET" action="AdminAddSlot" style = "width : 30%;">
 
  <div class="form-group">
    <%-- <label for="exampleInputEmail1">Email address</label> --%>
    <input name = slotno type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Slot Number" required>
    <small id="emailHelp" class="form-text text-muted">Try to maintain the consistency in the slot numbers.</small>
  </div>
  <br>
 
    <div class="form-check" style = "width : 85%;">
        <select name = size class="form-control" required>
        <option selected hidden>Slot Size</option>
        <option value="0">Small</option>
        <option value="1">Big</option>
        </select>
    </div>
 
    <br>
 
    <div class="form-group">
    <%-- <label for="exampleInputPassword1">Password</label> --%>
    <input type="number" name = "workerid" class="form-control" id="exampleInputPassword1" placeholder="Worker Id" required>
    <input type="hidden" name = "loc_id" class="form-control" value = 3 required>
  </div>
<br>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<br>
<br>
 
        </div>
 
        <div  id="tablediv4">
                <br>
        <% locations.next();%>
        <h1 class="display-6"> <%= locations.getString("lname")%></h1>
        <br>
<table class="table  table-striped table-sm table-bordered" style="vertical-align: middle ;text-align: center ; width:90%">
              <thead>
    <tr>
        <th scope="col">Slot no</th>
        <th scope="col">Type</th>
        <th scope="col">Slot Id</th>
        <th scope="col">Worker Username</th>
        <th scope="col">Worker Id</th>
        <th scope="col">Worker Rating</th>
        <th scope="col" style="width:5%"></th>
        <th scope="col" style="width:5%"></th>
    </tr>
  </thead>
  <tbody>
    <%
    while (loc4.next()) 
    {
        int slotno  = loc4.getInt("slotno");
        int typeno  = loc4.getInt("stype");
        int sid = loc4.getInt("sid");
        String workername = loc4.getString("username");
        int workerid = loc4.getInt("userid");
        float rating = loc4.getFloat("rating");
        String type = "";
        if (typeno == 1)
            type = "Big";
        else if (typeno == 0)
            type = "Small";
    %>
    <tr>
      <%-- <input type="hidden" id="sid" name="sid" value= "<%= sid %>"> --%>
      <td><%=slotno%></td>
      <td><%=type%></td>
      <td><%=sid%></td>
      <td><%=workername%></td>
      <td><%=workerid%></td>
      <td><%=rating%></td>
      <td align='right'>
        <form method="GET" action="AdminEditSlot.jsp" style="vertical-align: middle ;text-align: center ;">
        
        <input type="submit" class="btn btn-outline-secondary" value = "Edit">
        <input type="hidden" id="slotno" name="slotno" value= "<%= slotno %>">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
        </form>
      </td>
      <td align='right'>
        <form onsubmit=" return false;">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
        
                <div class="popup" id="popup"> <input type="submit" class="btn btn-outline-danger" value = "Delete">
          <span class="popuptext" id="myPopup<%= count++ %>">Are you Sure?</form>
            <br>
            <form method="GET" action="AdminRemoveSlot" style = "display: inline-block">
        <input type="hidden" id="sid" name="sid" value= "<%= sid %>">
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
 
 
 
 
 
 
<button type="button" class="btn btn-outline-dark" id = "add4">Add Slot</button>
<br>
<br>
 
<div class = "loc4">
<form method="GET" action="AdminAddSlot" style = "width : 30%;">
 
  <div class="form-group">
    <%-- <label for="exampleInputEmail1">Email address</label> --%>
    <input name = slotno type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Slot Number" required>
    <small id="emailHelp" class="form-text text-muted">Try to maintain the consistency in the slot numbers.</small>
  </div>
  <br>
 
    <div class="form-check" style = "width : 85%;">
        <select name = size class="form-control" required>
        <option selected hidden>Slot Size</option>
        <option value="0">Small</option>
        <option value="1">Big</option>
        </select>
    </div>
 
    <br>
 
    <div class="form-group">
    <%-- <label for="exampleInputPassword1">Password</label> --%>
    <input type="number" name = "workerid" class="form-control" id="exampleInputPassword1" placeholder="Worker Id" required>
    <input type="hidden" name = "loc_id" class="form-control" value = 4 required>
  </div>
<br>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
<br>
<br>
 
 </div>
          <script src="./AdminSlots.js"></script>
 
</center>
</body>
</html>