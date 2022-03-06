import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
public class AdminAddSlotServlet extends HttpServlet 
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
String slotno=request.getParameter("slotno");
String stype = request.getParameter("size");
String workerid = request.getParameter("workerid");
String loc_id = request.getParameter("loc_id");
try{

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
stmt = conn.prepareStatement("select * from users where userid = ?;");
stmt.setString(1,workerid);
ResultSet booked=stmt.executeQuery();
while(booked.next())
{
    if (booked.getInt("type")!=2)
    {
        out.println("Not a worker");
        out.println(booked.getInt("type"));
    return;}
}

stmt = conn.prepareStatement("select * from slots where loc_id = ? and slotno = ?;");
stmt.setString(1,loc_id);
stmt.setString(2,slotno);
ResultSet rs=stmt.executeQuery();
if(rs.next())
{
    out.println("Slot Number Already Used");
}

// out.print("reached 1");
stmt = conn.prepareStatement("insert into slots(stype,workerid,slotno,loc_id) values(?,?,?,?);");
stmt.setString(1,stype);
stmt.setString(2,workerid);
stmt.setString(3,slotno);
stmt.setString(4,loc_id);
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