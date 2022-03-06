<html>
    <body>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
        Welcome
        <%
        out.println(session.getAttribute("username"));
        String username = (String)session.getAttribute("username");
        String s = "Not Found";  

  try {
    java.sql.Connection con;
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/parking", "root", "Mysqlpwd@123");
    out.println ("database successfully opened.");
    stmt = con.prepareStatement("select email from user where username=?");
    stmt.setString(1, username);

    ResultSet rs=stmt.executeQuery();
    while (rs.next()) {
	 s = rs.getString("email");
    out.println (s);
  }}
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
        %>
        <hr>
        <form action = "Logout">
            <input type = "submit" value = "Logout">
        </form>

        <%= username%>
        <%= s%>
 
        
    </body>
</html>