<%@ page import="java.sql.*" %> 

<html>
    <head>

        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="services.css">
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
        String startdate = (String) request.getAttribute("startdate");
        String starttime = (String) request.getAttribute("starttime");
        String enddate = (String) request.getAttribute("enddate");
        String endtime = (String) request.getAttribute("endtime");
        Long minutes = (Long) request.getAttribute("minutes");
        Long price = minutes/60*25;

        request.setAttribute("startdate",startdate);
        request.setAttribute("starttime",starttime);
        request.setAttribute("enddate",enddate);
        request.setAttribute("endtime",endtime);


        //RequestDispatcher rd = request.getRequestDispatcher("BookingServlet.java");
        //rd.forward(request,response);

        //yeh upar waale comments hatake dekhna maza aaega

        int no;
        int sid;
        float rating;
        int count = 1;

        while (rs.next()) 
        {
            no = rs.getInt("slotno");
            sid = rs.getInt("sid");
            rating = rs.getFloat("rating");
            %>


        <%-- <h1 class="display-2">Slot <%=no%>:</h1>
        <br> --%>
        <br>

        <h1 class="display-6">Worker Rating:</h1>
        <br>
        <figure class="text-center">
        <figcaption class="blockquote-footer" style = "font-size:20px">
           <%=rating%> <cite title="Source Title"></cite>
        </figcaption>

        <h1 class="display-6">Available Services:</h1>
        <br>
        <figure class="text-center">
        <figcaption class="blockquote-footer" style = "font-size:20px">
        Air Refill:   &#8377 100 <cite title="Source Title"></cite>
        </figcaption>
        <figcaption class="blockquote-footer" style = "font-size:20px">
        Car Wash:   &#8377 200 <cite title="Source Title"></cite>
        </figcaption>
        <figcaption class="blockquote-footer" style = "font-size:20px">
        Car Service:   &#8377 1000 <cite title="Source Title"></cite>
        </figcaption>
        </figure>
        <br>

        

        <button type="button" name="sid" data-toggle="button" aria-pressed="false" class="btn btn-outline-success btn-price" id = "Arprice">Air Refill</button>

        <button type="submit" name="sid"  class="btn btn-outline-success btn-price" id="Cwprice">Car Wash</button>

        <button type="submit" name="sid"  class="btn btn-outline-success btn-price" id = "Csprice">Car Service</button>
<center><hr style="width:40%"></center>
        
        <div class="tprice">
            <h1 class="display-5">Total: &#8377</h1>
            <h1 class="display-5 pp"> <%=price%> </h1>
            <h1 class="display-5 show" ><%=price%></h1>
            
        </div>
        <br>
        <figcaption class="blockquote-footer" style = "font-size:20px">
        Booking:   &#8377 <%=price%> <cite title="Source Title"></cite>
        </figcaption>

        <div class="tprice">
            <figcaption style = "font-size:20px; margin: 0;" class="blockquote-footer">
                Services:   &#8377<cite title="Source Title"></cite>
            </figcaption>
            
            <figcaption style = "font-size:20px; color: #6c757d; margin: 0;" id="total1">
                0<cite title="Source Title"></cite>
            </figcaption>
        </div>

        
                    
        
            <form method="GET" action="book" style = "display: inline-block">
            
                <input type="hidden" id="startdate" name="startdate" value= "<%= startdate %>">
                <input type="hidden" id="enddate" name="enddate" value= "<%= enddate %>">
                <input type="hidden" id="starttime" name="starttime" value= "<%= starttime %>">
                <input type="hidden" id="endtime" name="endtime" value= "<%= endtime %>">
                <br>
                <input type = "hidden" name = "stotal" id = "stotal">
                <input type = "hidden" name = "Arp" id = "Arp">
                <input type = "hidden" name = "Cwp" id = "Cwp">
                <input type = "hidden" name = "Csp" id = "Csp">
                
                

                <button type="submit" name="sid" value ="<%=sid%>" class="btn btn-success">Book</button>
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
        

        </center>
        <script src="./Services.js"></script>
    </body>
</html>