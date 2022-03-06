import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
public class ToDashboardServlet extends HttpServlet {
static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/parking";
   //  Database credentials
   static final String USER = "root";
   static final String PASS = "Mysqlpwd@123";  
   Connection conn = null;
   PreparedStatement stmt = null;
public void doGet(HttpServletRequest request,HttpServletResponse response)
throws IOException,ServletException{
response.setContentType("text/html");
PrintWriter out = response.getWriter();
String uname=request.getParameter("uname");
String pword=request.getParameter("pword");
try{
      //STEP 2: Register JDBC driver
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
stmt = conn.prepareStatement("select * from locations");
ResultSet locations = stmt.executeQuery();

request.setAttribute("locations",locations);

HttpSession session = request.getSession();
String username = (String)session.getAttribute("username");
stmt = conn.prepareStatement("SELECT * FROM users where username = ?;");
stmt.setString(1,username);
ResultSet userinfo = stmt.executeQuery();
request.setAttribute("userinfo",userinfo);

RequestDispatcher rd = request.getRequestDispatcher("Dashboard.jsp");
rd.forward(request,response);

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