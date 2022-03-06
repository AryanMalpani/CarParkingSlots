// package parking;
 
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.security.SecureRandom;
import java.security.SecureRandom;
 
 
// import test.SendMail;
 
public class RegisterServlet extends HttpServlet {
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
String pass=request.getParameter("pass");
String cpass=request.getParameter("cpass");
String email=request.getParameter("email");
String pno=request.getParameter("pno");
// int pno=Integer.parseInt("pno");  
 
String carno=request.getParameter("CarNumber");
 
if(!pass.equals(cpass)){
   out.println("Passwords Don't Match");
   return;
   }
 
   try{
      Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(DB_URL, USER, PASS);
stmt = conn.prepareStatement("select * from users;");
ResultSet users=stmt.executeQuery();
 
   
while(users.next())
{
   if(uname.equals(users.getString("username")))
   {
      out.println("Username already used");
      return;
   }
   if(email.equals(users.getString("email")))
   {
      out.println("email already used");
      return;
   }
 
   // int pno = Integer.toString(users.getString("phoneno"));
   // if(pno.equals(users.getString("phoneno")))
   // {
   //    out.println("Phone Number already used");
   //    return;
   // }
}
 
 
char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
        StringBuilder sb = new StringBuilder();
        SecureRandom random = new SecureRandom();
        for (int i = 0; i < 8; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String promocode = sb.toString();
 
 
      //STEP 2: Register JDBC driver
 
stmt = conn.prepareStatement("insert into users(username, password, email, phoneno, carno, promocode) values(?,?,?,?,?,?)");
stmt.setString(1,uname);
stmt.setString(2,pass);
stmt.setString(3,email);
stmt.setString(4,pno);
stmt.setString(5,carno);
stmt.setString(6,promocode);
 
stmt.executeUpdate();
out.println("<h1> Registered Successfully </h1>");
 
HttpSession session = request.getSession();
session.setAttribute("username", uname);
session.setAttribute("type", 1);
// SendMail send1 = new SendMail();
// SendMail.send("beautifulquotes09@gmail.com","The2best2","aryanmalpani02@gmail.com","hello javatpoint","How r u?");
response.sendRedirect("Dashboard");
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