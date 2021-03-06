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
import javax.servlet.ServletException;

public class FeedbackResponse extends HttpServlet
{
 public void doGet(HttpServletRequest request,HttpServletResponse response)throws  IOException,ServletException
 {
	 Statement st=null;
     Connection con=null;
	    try
  {
	  HttpSession session = request.getSession();
 if (session == null || session.getAttribute("Username") == null)
	 {
        // Forward the control to login.jsp if authentication fails or session expires
        request.getRequestDispatcher("/login.jsp").forward(request,
            response);
    }
     String feed_Id= request.getParameter("feedback_id");
	 int feedback_id=Integer.parseInt(feed_Id);
     String text=request.getParameter("feedback_response_text");
	 String email=request.getParameter("user_email");

   
	 Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bideasy",
            "root", "root");
   st = con.createStatement();
   int i = st.executeUpdate("update feedbacks set feedbackresponse='"+text+"' where feedbackId="+feedback_id);
   int j = st.executeUpdate("update feedbacks set reviewedfeedback='"+1+"' where feedbackId="+feedback_id);
  
   if(i>0 && j>0)
	  {
 try
		  {
		  new MailSend().SendMail(email,"Reply to your Feedback","Hi,admin  says user :"+text); 
            }
		  catch (Exception e)
		  {
		  }

	    response.sendRedirect("managefeedback.jsp");
	  }
else
	  {	  
	request.getSession().setAttribute("feed_res_error_msg", "unable to send ur feedback response, plz try again!");
             response.sendRedirect("managefeedback.jsp");
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
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws  IOException,ServletException
 {
		doGet(request,response);
 }
}