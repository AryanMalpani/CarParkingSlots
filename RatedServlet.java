import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
public class RatedServlet extends HttpServlet 
{
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
String workerid=request.getParameter("workerid");
int bookingid = Integer.parseInt(request.getParameter("bookingid"));
int rating = Integer.parseInt(request.getParameter("rating"));
try{
out.println("reached 1");
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);

// out.print("reached 1");
stmt = conn.prepareStatement("update bookings set brating = ? where bookingid = ?;");
stmt.setString(1,Integer.toString(rating));
stmt.setString(2,Integer.toString(bookingid));
// out.print("reached 2");
stmt.execute();
out.println("reached 2");

stmt = conn.prepareStatement("select * from users where userid = ?");
stmt.setString(1,workerid);
ResultSet workerinfo = stmt.executeQuery();
out.println("reached 3");

int workings = 0; 
if(workerinfo.next())
{
out.println("reached 3.5");

workings = (int)workerinfo.getInt("workings");
out.println("reached 4");
}

float rating1 = (workings*(workerinfo.getFloat("rating")) + rating)/(++workings);
out.println("reached 5");

stmt = conn.prepareStatement("update users set workings = ?, rating = ? where userid = ?");
stmt.setString(1,Integer.toString(workings));
stmt.setString(2,Float.toString(rating1));
stmt.setString(3,workerid);
stmt.execute();
out.println("reached 6");


// out.print("reached 3");
response.sendRedirect("Bookings");

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