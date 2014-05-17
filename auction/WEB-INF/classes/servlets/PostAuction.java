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
public class PostAuction extends HttpServlet
{
 public void doGet(HttpServletRequest request,HttpServletResponse response)throws  IOException,ServletException
 {
 
Connection con=null;
Statement st=null;
 try
	 {
	 HttpSession session = request.getSession();
 if (session == null || session.getAttribute("Username") == null)
	 {
        // Forward the control to login.jsp if authentication fails or session expires
        request.getRequestDispatcher("/login.jsp").forward(request,
            response);
    }
String pimage=request.getParameter("pimage");
String pname=request.getParameter("pname");
String category=request.getParameter("category");
String pdescription=request.getParameter("description");
String start_date=request.getParameter("start_date");
String end_date=request.getParameter("end_date");
String isUsed=request.getParameter("p_use");
String res_price=request.getParameter("reserved_price");
String start_price=request.getParameter("start_price");
String pid=UUID.randomUUID().toString().replaceAll("-", "");
String aucid=UUID.randomUUID().toString().replaceAll("-", "");
String auth_email_id=(String)request.getSession(false).getAttribute("emailId");
int catid=Integer.parseInt(category);
int st_price=Integer.parseInt(start_price);
int rsv_price=Integer.parseInt(res_price);    
  
	 Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bideasy","root", "root");
   String query;
query="insert into auction(product_id,product_name,product_image,product_description,category_id,product_isUsed,auction_reserved_price,auction_start_date,auction_end_date,auction_creator_id,Is_auction_authenticated,auction_uuid,auction_start_price,auction_closed,no_of_bids) "
+ "values  ('"+pid+"','"+ pname +"','"+pimage+"','"+
pdescription+"','"+catid+"','"+isUsed+"',"+rsv_price+",'"+start_date+"','"+end_date+"','"+
	auth_email_id+"','"+0+"','"+aucid+"','"+st_price+"',"+0+","+0+")";
st = con.createStatement();
       int i = st.executeUpdate(query);
if(i>0)
	  {
	try
		  {
		  new MailSend().SendMail(auth_email_id,"Thanks","Thank you for posting add on our website your auction uuid is "+aucid); 
            }
		  catch (Exception e){}
		    try{
		     ServletContext context= getServletContext();
             RequestDispatcher rd= context.getRequestDispatcher("/posted_success.jsp");
              rd.forward(request, response);
		         }
		  catch(Exception e){}
	  }
		  else
	  {
		   try{
            ServletContext context= getServletContext();
		    request.setAttribute("postingAd_error_msg", "Error in Posting Add.Plz Try Again!");
             RequestDispatcher rd= context.getRequestDispatcher("/sell.jsp");
             rd.forward(request, response);
			 	  }
           catch(Exception e){}

	  }
  }
	  catch (SQLException e)
  {
	  System.out.println("Sql exception");
	  e.printStackTrace();
	   try{
            ServletContext context= getServletContext();
		     request.setAttribute("postingAd_error_msg", "Error in Posting Add.Plz Try Again!");
             RequestDispatcher rd= context.getRequestDispatcher("/sell.jsp");
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