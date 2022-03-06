import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.lang.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
public class BookedServlet extends HttpServlet 
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
String startdate=request.getParameter("startdate");
String starttime=request.getParameter("starttime");
String enddate=request.getParameter("enddate");
String endtime=request.getParameter("endtime");
String total=request.getParameter("total");
String userid=request.getParameter("userid");
String workerid=request.getParameter("workerid");
// String csp=request.getParameter("Csp");

int i=Integer.parseInt(total);

String start = startdate+" "+starttime;
String end = enddate+" "+endtime;
/*if(startdate==null||startdate.equals("")||enddate==null||enddate.equals("")){
out.println("Username and password cannot be empty");
return;
}*/
try{
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection(DB_URL, USER, PASS);

    // request.setAttribute("sid",sid);
    // request.setAttribute("startdate",startdate);
    // request.setAttribute("starttime",starttime);
    // request.setAttribute("enddate",enddate);
    // request.setAttribute("endtime",endtime);
    // request.setAttribute("stotal",i);
    // request.setAttribute("air",arp);
    // request.setAttribute("cwp",cwp);
    // request.setAttribute("csp",csp);

    out.println("reached 1");
    stmt = conn.prepareStatement("SELECT * FROM users where userid = ?;");
    stmt.setString(1,userid);
    ResultSet rs=stmt.executeQuery();
    out.println("reached 2");
    rs.next();
    
    int wallet = rs.getInt("wallet");
    wallet = wallet - i;

    int workings = rs.getInt("workings");
    workings++;

    if(workings==6)
    {
        stmt = conn.prepareStatement("update users set promocode = NULL where userid = ?;");
    stmt.setString(1,userid);
    stmt.execute();
    }

    out.println("reached 3");

    stmt = conn.prepareStatement("update users set wallet = ?, workings = ? where userid = ?;");
    stmt.setString(1,Integer.toString(wallet));
    stmt.setString(2,Integer.toString(workings));
    stmt.setString(3,userid);
    stmt.execute();
    out.println("reached 4");
    stmt = conn.prepareStatement("insert into bookings(user_id,slot_id,starttime,endtime,wid) values(?,?,?,?,?) ");
    stmt.setString(1,userid);
    stmt.setString(2,sid);
    stmt.setString(3,start);
    stmt.setString(4,end);
    stmt.setString(5,workerid);
    stmt.execute();
    out.println("reached 5");
    response.sendRedirect("Dashboard");

    
    
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