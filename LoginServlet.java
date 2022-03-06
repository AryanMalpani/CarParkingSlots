import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
public class LoginServlet extends HttpServlet {
static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/parking";
   //  Database credentials
   static final String USER = "root";
   static final String PASS = "Mysqlpwd@123";  
   Connection conn = null;
   PreparedStatement stmt = null;
public void doPost(HttpServletRequest request,HttpServletResponse response)
throws IOException,ServletException{
response.setContentType("text/html");
PrintWriter out = response.getWriter();
String uname=request.getParameter("uname");
String pword=request.getParameter("pword");
if(uname==null||uname.equals("")||pword==null||pword.equals("")){
out.println("Username and password cannot be empty");
response.sendRedirect("Login.jsp");
return;
}
try{
      //STEP 2: Register JDBC driver
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
stmt = conn.prepareStatement("select * from users where username=? and password=?");
stmt.setString(1,uname);
stmt.setString(2,pword);
ResultSet rs=stmt.executeQuery();
if(rs.next()){
out.println("Welcome "+uname);
HttpSession session = request.getSession();
session.setAttribute("username", uname);
session.setAttribute("type", rs.getInt("type"));
if (rs.getInt("type") == 0)
{
   response.sendRedirect("AdminDashboard.jsp");
}
else if (rs.getInt("type") == 1)
{
   response.sendRedirect("Dashboard");
}
else if (rs.getInt("type") == 2)
{
   response.sendRedirect("WorkerDashboard.jsp");
}
//response.sendRedirect("Dashboard.jsp");
}
else{
out.println("Given username and password are wrong");
out.println("Please try again");
}
}catch(SQLException e){
System.out.println("There is an exception with the database");
}
catch(Exception e){e.printStackTrace();}
finally{
      //finally block used to close resources
      try{
         if(stmt!=null)
            conn.close();
      }catch(SQLException se){
      }// do nothing
      try{
         if(conn!=null)
            conn.close();
      }catch(SQLException se){
         se.printStackTrace();
      }//end finally try
   }//end try
}
}