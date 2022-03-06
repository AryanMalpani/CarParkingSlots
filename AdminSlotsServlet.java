import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
public class AdminSlotsServlet extends HttpServlet 
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
try{

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
stmt = conn.prepareStatement("select * from locations;");
ResultSet locations=stmt.executeQuery();

stmt = conn.prepareStatement("select * from slots join users on users.userid = slots.workerid where loc_id = 1 order by slotno;");
ResultSet loc1=stmt.executeQuery();

stmt = conn.prepareStatement("select * from slots join users on users.userid = slots.workerid where loc_id = 2 order by slotno;");
ResultSet loc2=stmt.executeQuery();

stmt = conn.prepareStatement("select * from slots join users on users.userid = slots.workerid where loc_id = 3 order by slotno;");
ResultSet loc3=stmt.executeQuery();

stmt = conn.prepareStatement("select * from slots join users on users.userid = slots.workerid where loc_id = 4 order by slotno;");
ResultSet loc4=stmt.executeQuery();

request.setAttribute("locations",locations);
request.setAttribute("loc1",loc1);
request.setAttribute("loc2",loc2);
request.setAttribute("loc3",loc3);
request.setAttribute("loc4",loc4);


RequestDispatcher rd = request.getRequestDispatcher("AdminSlots.jsp");
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