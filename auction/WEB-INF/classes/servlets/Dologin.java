import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

public class Dologin extends HttpServlet
{
 public void doGet(HttpServletRequest request,HttpServletResponse response)throws  IOException
 {
 Connection conn = null;
    ResultSet rsdoLogin = null;
    PreparedStatement psdoLogin1=null;
     ResultSet rsdoLogin1 = null;
    PreparedStatement psdoLogin=null;
  try
  {
	  Class.forName("com.mysql.jdbc.Driver");
	  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bideasy","root", "root");
    String sUserID=request.getParameter("login_username");
    String sPassword=request.getParameter("login_password");
      HttpSession session = request.getSession(true);
   
    String sqlOption="SELECT * FROM members where"
                    +" UserName=? and Password=(?) and EmailVerified=1 ;";
	
	String sqlOption1="SELECT * FROM members where"
                    +" UserName=? and Password=(?) ;";


    psdoLogin=conn.prepareStatement(sqlOption);
    psdoLogin.setString(1,sUserID);
    psdoLogin.setString(2,sPassword);
    
    rsdoLogin=psdoLogin.executeQuery();

	 psdoLogin1=conn.prepareStatement(sqlOption1);
    psdoLogin1.setString(1,sUserID);
    psdoLogin1.setString(2,sPassword);
    
    rsdoLogin1=psdoLogin1.executeQuery();

     if(rsdoLogin!=null && rsdoLogin.next())
    {
       String FullName=rsdoLogin.getString("FirstName")+" "+rsdoLogin.getString("LastName");
       session.setAttribute("Username",rsdoLogin.getString("UserName"));
	   session.setAttribute("fullname",FullName); 
	   session.setAttribute("userId",rsdoLogin.getString("userid"));
	   session.setAttribute("emailId",rsdoLogin.getString("Email"));

	try{
	               response.sendRedirect("index.jsp");
				   return;
	      }
	      catch(Exception e){}
    }
    else
    {
   if(rsdoLogin1!=null && rsdoLogin1.next())
	  {
        try{
			   ServletContext context= getServletContext();
              request.getSession().setAttribute("login_error_msg", "You are not verified user.Plz verify!");
             response.sendRedirect("welcome.jsp");
			 return;
			   }
			    catch(Exception e){}
	  }
	  else{
	    try{
			   ServletContext context= getServletContext();
              request.getSession().setAttribute("login_error_msg", "UserName and Password Do Not Match.Plz Try Again!");
             response.sendRedirect("login.jsp");
			 return;
			   }
			    catch(Exception e){}
	        }
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
		if (rsdoLogin!= null) {
        try {
           rsdoLogin.close();
        } catch (SQLException e) { /* ignored */}
                     }
if (rsdoLogin1!= null) {
        try {
           rsdoLogin1.close();
        } catch (SQLException e) { /* ignored */}
                     }

if (psdoLogin!= null) {
        try {
           psdoLogin.close();
        } catch (SQLException e) { /* ignored */}
                     }
	if (psdoLogin1!= null) {
        try {
           psdoLogin1.close();
        } catch (SQLException e) { /* ignored */}
                     }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) { /* ignored */}
                          }
	}
   }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws  IOException
 {
		doGet(request,response);
 }
}