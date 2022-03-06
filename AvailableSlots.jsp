<%@ page import="java.sql.*" %> 

<html>
    <head>

        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="dashboard.css">
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

    <body>
        <%@ include file="DashTemplate.jsp" %>

        <br>
        <center>

        <%
        
        ResultSet rs = (ResultSet) request.getAttribute("rs");
        ResultSet rs2 = (ResultSet) request.getAttribute("rs2");
        String startdate = (String) request.getAttribute("startdate");
        String starttime = (String) request.getAttribute("starttime");
        String enddate = (String) request.getAttribute("enddate");
        String endtime = (String) request.getAttribute("endtime");

        request.setAttribute("startdate",startdate);
        request.setAttribute("starttime",starttime);
        request.setAttribute("enddate",enddate);
        request.setAttribute("endtime",endtime);


        //RequestDispatcher rd = request.getRequestDispatcher("BookingServlet.java");
        //rd.forward(request,response);

        //yeh upar waale comments hatake dekhna maza aaega

        int no;
        int sid;
        int count = 1;

        %>

        <h1 class="display-6">Available Slots:</h1>
        <br>
        <figure class="text-center">
        <figcaption class="blockquote-footer" style = "font-size:20px">
        Price:   &#8377 25/hr <cite title="Source Title"></cite>
        </figcaption>
        </figure>
        <br>
                    
        <%
        while (rs.next()) 
        {
            no = rs.getInt("slotno");
            sid = rs.getInt("sid");
            %>
            <form method="GET" action="Services" style = "display: inline-block">
            
                <input type="hidden" id="startdate" name="startdate" value= "<%= startdate %>">
                <input type="hidden" id="enddate" name="enddate" value= "<%= enddate %>">
                <input type="hidden" id="starttime" name="starttime" value= "<%= starttime %>">
                <input type="hidden" id="endtime" name="endtime" value= "<%= endtime %>">
                <button type="submit" name="sid" value ="<%=sid%>" class="btn btn-outline-success">Slot <%= no%></button>
            </form>
            <%
        }
        %>
        <!--<form method="GET" action="book">
            <label for="slotno" class="sr-only"></label>
            <input type="number" id="slotno" name="slotno" class="form-control bg-transparent" placeholder="Slot" >
            <div class="mt-3">
            <button class="btn btn-lg btn-primary btn-block w-100">Submit</button>
            </div>
        </form>-->
        <br><br><hr style="width:40%">
        <h1 class="display-6">Unavailable Slots:</h1>
        <br>
        <%        
        while (rs2.next()) 
        {
            no = rs2.getInt("slotno");
            %>
            <button type="button" class="btn btn-outline-danger">Slot <%= no%></button>
            <%
        }        
        %>

        </center>
    </body>
</html>