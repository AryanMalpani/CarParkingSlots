<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>Insert title here</title>
   <script src="https://apis.google.com/js/platform.js" async defer></script>
   <meta name="google-signin-client_id" content="358520903505-uft49j3kfieml51sh9p5on423gm5sego.apps.googleusercontent.com">
  <title>Sign in - Auto Park</title>
  <!--<link rel="stylesheet" href="carparking.css">-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body style="background-color:rgb(0, 0, 0);">

  <div class="text-center mt-5">
    <form method="POST" action="LoginServlet" style="max-width:300px; margin:auto;" >
      <!-- <img class="mt-4 mb-5" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREUp-bFOyhaDU_t_tuGto7DtWD4eYhySi9dg&usqp=CAU" height="100" alt="Auto Park logo"> -->
      <img class="mt-5 mb-4" src="car logo.svg" height="100" alt="Auto Park logo">
      <h1 class="h3 mb-1" style="color: rgb(185, 185, 185); font-weight: lighter;">Sign in</h1><br>
      <label for="uname" class="sr-only"></label>
      <input type="username" id="uname" name="uname" class="form-control bg-transparent" placeholder="Username" style="color: #DDD" required autofocus>
      <br><label for="pword" class="sr-only"></label>
      <input type="password" id="pword" name="pword" class="form-control bg-transparent" placeholder="Password" style="color: #DDD">

      <div class="mt-3">
        <button class="btn btn-lg btn-primary btn-block w-100">Sign in</button>
      </div>
      <!--<div class="mt-1">
        <a href="#" class="nav-link">Forgot password?</a>
      </div>-->
    </form>
    <div class="mt-3" style="max-width:300px; margin:auto">
      <a href="Register.html" class="btn btn-lg btn-success btn-block w-100">Sign up</a>
    </div>
  </div>
  <div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
      <img id="myImg"><br>
      <p id="name"></p>
      <div id="status">
   </div>
   <button onclick="myFunction()">Sign Out</button>
  <!-- <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
    <div class="container">
      <a href="#" class="navbar-brand">Auto Park</a>
      
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navmenu">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a href="#home" class="nav-link">Home</a>
          </li>
          <li class="nav-item">
            <a href="#Support" class="nav-link">Support</a>
          </li>
          <li class="nav-item">
            <a href="#temp" class="nav-link">temp</a>
          </li>
        </ul>
      </div>
    </div>
  </nav> -->
  <!-- Bootstrap scripts -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
    integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
    integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
    crossorigin="anonymous"></script>
    <script type="text/javascript">
        function onSignIn(googleUser) {
        // window.location.href='success.jsp';
        var profile = googleUser.getBasicProfile();
        var imagurl=profile.getImageUrl();
        var gname=profile.getName();
        var gemail=profile.getEmail();
        document.getElementById("myImg").src = imagurl;
        document.getElementById("name").innerHTML = name;
        document.getElementById("myP").style.visibility = "hidden";
        document.getElementById("status").innerHTML = 'Welcome '+gname+'!<a href=success.jsp?                  
        email='+gemail+'&name='+gname+'/>Continue with Google login</a></p>'
     
        }
     </script>
     <script>
      function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      location.reload();
   }
   </script>
</body>

</html>