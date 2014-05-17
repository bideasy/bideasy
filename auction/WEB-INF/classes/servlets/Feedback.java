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
public class Feedback extends HttpServlet
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
    String email = request.getParameter("email_fld");
     String text=request.getParameter("feedback_comments");
  
	 Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bideasy",
            "root", "root");
   st = con.createStatement();
       int i = st.executeUpdate("insert into feedbacks(EmailId,FeedbackText,ReviewedFeedback) " + "values  ('"+email+"','"+ text +"','"+0+"')");
   
	  if(i>0)
	  {
		  try
		  {
		  new MailSend().SendMail(email,"Gratitude!","Hi,Thank you for providing feedback to us. we would soon reply u"); 
            }
		  catch (Exception e){}
      request.getSession().setAttribute("feed_error_msg", "success");
             response.sendRedirect("feedback.jsp");
	  }
	  else
	  {
		  request.getSession().setAttribute("feed_error_msg", "unable to take ur feedback, plz re-enter!");
             response.sendRedirect("feedback.jsp");
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