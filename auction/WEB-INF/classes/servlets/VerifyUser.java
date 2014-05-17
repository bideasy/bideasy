import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

public class VerifyUser extends HttpServlet
{
	    Statement st=null;
		Connection con=null;
 public void doGet(HttpServletRequest request,HttpServletResponse response)throws  IOException
 {
  try
  {
 String VerifiedUser = request.getParameter("verifyregister");
  HttpSession session = request.getSession(true);
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bideasy",
            "root", "root");
 st = con.createStatement();
   
   
		int i=st.executeUpdate("update members set EmailVerified=1 where Verificationcode='"+VerifiedUser+"'");
if(i>0)
{
			 try{
              response.sendRedirect("index.jsp");
			  return;
		  }
		  catch(Exception e){}
}
		else
		{
			try{
              request.getSession().setAttribute("ver_error_msg", "Verified Code Do not Match.Plz Try Again!");
             response.sendRedirect("welcome.jsp");
			 return;                  
			 	  }
           catch(Exception e1){}
		}
	}
	 catch (SQLException e)
  {
	  System.out.println("Sql exception");
	  e.printStackTrace();
  }
   catch (ClassNotFoundException e)
  {
	  System.out.println("ClassNotFound exception");
	  e.printStackTrace();
  }
    finally
	{
if (st != null) {
        try {
            st.close();
        } catch (SQLException e) { /* ignored */}
                     }
    if (con != null) {
        try {
            con.close();
        } catch (SQLException e) { /* ignored */}
                          }
	}
   }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws  IOException
 {
		doGet(request,response);
 }
}