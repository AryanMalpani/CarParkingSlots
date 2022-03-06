<html>
    <head>

        <link rel="stylesheet" href="dashboard.css">
        <script type="text/javascript">
function openNav() {
  document.getElementById("mySidepanel").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidepanel").style.width = "0";
}
</script>
    </head>
    <body>

    <div id="mySidepanel" class="sidepanel">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">Dashboard</a>
  <a href="#">Services</a>
  <a href="#">Current</a>
  <a href="http://localhost:8080/parking/Logout">Logout</a>
</div>

<button class="openbtn" onclick="openNav()">&#9776; Toggle Sidepanel</button>

<h1>Boom Worker</h1>

    <!--    <form method="GET" action="dash">


        <label for="start">Start date:</label>
        <input type="date" id="startdate" name="startdate">

        <label for="start">Start time:</label>
        <input type="time" id="starttime" name="starttime">

        <label for="end">End date:</label>
        <input type="date" id="enddate" name="enddate">

        <label for="end">End time:</label>
        <input type="time" id="endtime" name="endtime">

        <button type="submit" class="submit1">Submit</button>



    </form>
                <hr>
       <form action = "Logout">
            <input type = "submit" value = "Logout">
        </form>-->

    </body>
</html>