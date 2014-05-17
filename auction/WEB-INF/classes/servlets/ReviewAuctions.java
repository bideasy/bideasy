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

public class ReviewAuctions extends HttpServlet
{
  Connection con=null;
   PreparedStatement ps=null;
 public void doGet(HttpServletRequest request,HttpServletResponse response)throws  IOException
 {
  String author_email=request.getParameter("author_email");
  String auction_uuid=request.getParameter("auction_uuid");
   try
  {
	 Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bideasy","root", "root");
	 String query=null;
	 int i=0;
     if (request.getParameter("reviewed_auction") != null) 
     {

query="update auction set Is_Auction_Authenticated=1 where auction_uuid=?";
          ps= con.prepareStatement(query);
		  ps.setString(1,auction_uuid);
          i = ps.executeUpdate();

if(i>0)
		 {
	try{
new MailSend().SendMail(author_email,"Congrats!","Your Product has been Reviewed now you will receive Bids very soon!");
		 }
		 catch(Exception e){}
	
	  try{
			  ServletContext context= getServletContext();
		  request.setAttribute("review_msg", "Successful review!");
		  RequestDispatcher rd= context.getRequestDispatcher("/manageauction.jsp");
             rd.forward(request, response);
		 }
		 catch(Exception e1){}
	 }
	 }
	 if(request.getParameter("delete_auction") != null)
	  {
query="delete from auction where auction_uuid=?";
          ps= con.prepareStatement(query);
		  ps.setString(1,auction_uuid);
          i = ps.executeUpdate();
if(i>0)
		 {
	try{
new MailSend().SendMail(author_email,"Regret!","we are very sorry that your product has been rejected for Auction.If you have any queries please feel free to contact our administrators");
		 }
		 catch(Exception e){}
		  try{
			  ServletContext context= getServletContext();
		  request.setAttribute("del_msg", "Successfully deleted!");
		  RequestDispatcher rd= context.getRequestDispatcher("/manageauction.jsp");
             rd.forward(request, response);
		 }
		 catch(Exception e1){}
	 }

	  }
  }
   catch (SQLException e)
  {
	  e.printStackTrace();
	   try{
		   ServletContext context= getServletContext();
		    request.setAttribute("manageauctions_error_msg", "UnSuccessful operation! Try again.");
             RequestDispatcher rd= context.getRequestDispatcher("/manageauction.jsp");
             rd.forward(request, response);
		  }
		  catch(Exception e1){}
  }
  catch (ClassNotFoundException e)
  {
	  System.out.println("ClassNotFound exception");
	  e.printStackTrace();
  }
finally
	{
	  if (ps != null) {
        try {
            ps.close();
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