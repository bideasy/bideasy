import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
 import javax.mail.*;
 import javax.mail.internet.*;
 import javax.activation.*;
import javax.servlet.http.*;
import javax.net.ssl.*;

public class ForgetPass extends HttpServlet
{
 public void doGet(HttpServletRequest request,HttpServletResponse response)throws  IOException
 {
 String emailid = request.getParameter("email_id");
     final String frompassword="everythingisplanned";
     final String from="bideasy1@gmail.com";
	 Connection con=null;
   ResultSet rs=null;
   Statement st=null;
	 try
	 {
    Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bideasy",
            "root", "root");
			 st = con.createStatement();
      HttpSession session = request.getSession(true);
    rs=st.executeQuery("select * from members where Email='"+emailid+"'");

	if(rs.next())
	{
		String forgoten_password=rs.getString("Password");

 String subject = "Forget Password NO Worries! ";
 String messageText ="Your Password is :"+forgoten_password;
       try
         {
		  new MailSend().SendMail(emailid,subject,messageText); 
            }
		  catch (Exception e)
		  {
		  }
		  try{
             response.sendRedirect("login.jsp");
			 return;
		  }
		  catch(Exception e){}
        }
	else
	{
	try{
           request.getSession().setAttribute("forget_error_msg", "InValidEmail Re-Enter");
            response.sendRedirect("forgotpassword.jsp");
			 return;
			 	  }
           catch(Exception e){}
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
   }
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws  IOException
 {
		doGet(request,response);
 }
}