import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class LogoutServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request,HttpServletResponse response)
    throws IOException,ServletException
    {

    HttpSession session = request.getSession();
    session.removeAttribute("username");
    session.invalidate();
    response.sendRedirect("Login.jsp");
    }
}