import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
public class AdminAddWorkerServlet extends HttpServlet 
{
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
String username=request.getParameter("username");
String lastname = request.getParameter("lastname");
String firstname = request.getParameter("firstname");
String email = request.getParameter("email");
String phoneno = request.getParameter("phoneno");
String userid = request.getParameter("userid");
String password = request.getParameter("password");
try{

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);

// out.print("reached 1");
stmt = conn.prepareStatement("insert into users(lastname , firstname , username, email  , phoneno ,userid, password,type ) values(?,?,?,?,?,?,?,2);");
stmt.setString(1,lastname);
stmt.setString(2,firstname);
stmt.setString(3,username);
stmt.setString(4,email);
stmt.setString(5,phoneno);
stmt.setString(6,userid);
stmt.setString(7,password);
// out.print("reached 2");
stmt.execute();

// out.print("reached 3");
response.sendRedirect("AdminWorkers");

}
catch(SQLException e){
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