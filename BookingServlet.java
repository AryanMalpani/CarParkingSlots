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
public class BookingServlet extends HttpServlet 
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
String stotal=request.getParameter("stotal");
String arp=request.getParameter("Arp");
String cwp=request.getParameter("Cwp");
String csp=request.getParameter("Csp");

int i=Integer.parseInt(stotal);

String start = startdate+" "+starttime;
String end = enddate+" "+endtime;
/*if(startdate==null||startdate.equals("")||enddate==null||enddate.equals("")){
out.println("Username and password cannot be empty");
return;
}*/
try{
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection(DB_URL, USER, PASS);

    request.setAttribute("sid",sid);
    request.setAttribute("startdate",startdate);
    request.setAttribute("starttime",starttime);
    request.setAttribute("enddate",enddate);
    request.setAttribute("endtime",endtime);
    request.setAttribute("stotal",i);
    request.setAttribute("air",arp);
    request.setAttribute("cwp",cwp);
    request.setAttribute("csp",csp);


    stmt = conn.prepareStatement("SELECT * FROM slots join users on users.userid = slots.workerid join locations on locations.lid = slots.loc_id where sid = ? ;");
    stmt.setString(1,sid);
    ResultSet rs=stmt.executeQuery();

    request.setAttribute("rs",rs);


    HttpSession session = request.getSession();
    String username = (String)session.getAttribute("username");
    stmt = conn.prepareStatement("SELECT * FROM users where username = ?;");
    stmt.setString(1,username);
    ResultSet userinfo = stmt.executeQuery();
    request.setAttribute("userinfo",userinfo);

    
	
	//Parsing the date
	LocalDate dateBefore = LocalDate.parse(startdate);
	LocalDate dateAfter = LocalDate.parse(enddate);
		
	//calculating number of days in between
	long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, dateAfter);

    long minutes = noOfDaysBetween*1440;

    minutes = minutes - (Long.parseLong(starttime.substring(0, 2)))*60 - Long.parseLong(starttime.substring(3,5)) + Long.parseLong(endtime.substring(3,5)) + (Long.parseLong(endtime.substring(0, 2)))*60;
    		
	//displaying the number of days
	//System.out.println(noOfDaysBetween);    
    
    request.setAttribute("minutes",minutes);

    //out.println(minutes);
    
    RequestDispatcher rd = request.getRequestDispatcher("Checkout.jsp");
    rd.forward(request,response);



    /*if(rs.next()) 
    {
        slotno = rs.getInt("slotno");
        loc_id = rs.getInt("loc_id");
    }

    out.println(sid);
    out.println(startdate);
    out.println(slotno); */

//RequestDispatcher rd = request.getRequestDispatcher("ChooseServices.jsp");
//rd.forward(request,response);
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