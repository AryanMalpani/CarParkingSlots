import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
public class DashboardServlet extends HttpServlet {
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
String lid=request.getParameter("lid");
String startdate=request.getParameter("startdate");
String starttime=request.getParameter("starttime");
String enddate=request.getParameter("enddate");
String endtime=request.getParameter("endtime");
String start = startdate+" "+starttime;
String end = enddate+" "+endtime;
try{

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
stmt = conn.prepareStatement("SELECT * FROM slots R WHERE loc_id = ? AND NOT EXISTS (SELECT * FROM bookings WHERE slot_id = R.sid    AND( (starttime<? AND  endtime>? )   OR (starttime<? AND  endtime>?)  OR (starttime>? AND  endtime<?))) ORDER BY slotno;");
stmt.setString(1,lid);
stmt.setString(2,start);
stmt.setString(3,start);
stmt.setString(4,end);
stmt.setString(5,end);
stmt.setString(6,start);
stmt.setString(7,end);
ResultSet rs=stmt.executeQuery();

stmt = conn.prepareStatement("SELECT * FROM slots R WHERE loc_id = ? AND EXISTS (SELECT * FROM bookings WHERE slot_id = R.sid    AND( (starttime<? AND  endtime>? )   OR (starttime<? AND  endtime>?)  OR (starttime>? AND  endtime<?))) ORDER BY slotno;");
stmt.setString(1,lid);
stmt.setString(2,start);
stmt.setString(3,start);
stmt.setString(4,end);
stmt.setString(5,end);
stmt.setString(6,start);
stmt.setString(7,end);
ResultSet rs2=stmt.executeQuery();

request.setAttribute("rs",rs);
request.setAttribute("rs2",rs2);
request.setAttribute("startdate",startdate);
request.setAttribute("starttime",starttime);
request.setAttribute("enddate",enddate);
request.setAttribute("endtime",endtime);
RequestDispatcher rd = request.getRequestDispatcher("AvailableSlots.jsp");
rd.forward(request,response);
/*while (rs.next()) 
{
   String s = rs.getString("slotno");
   out.println (s);
}*/
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