import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
public class AdminRemoveSlotServlet extends HttpServlet 
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
String sid=request.getParameter("sid");
try{

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
stmt = conn.prepareStatement("select * from bookings where slot_id = ? ;");
stmt.setString(1,sid);
ResultSet booked=stmt.executeQuery();
if(booked.next())
{
    out.println("There is a booking in this slot");
    return;
}

// out.print("reached 1");
stmt = conn.prepareStatement("delete from slots where sid = ? ;");
stmt.setString(1,sid);
// out.print("reached 2");
stmt.execute();

// out.print("reached 3");
response.sendRedirect("AdminSlots");

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