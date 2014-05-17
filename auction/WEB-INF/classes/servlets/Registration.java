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

public class Registration extends HttpServlet
{
 public void doGet(HttpServletRequest request,HttpServletResponse response)throws  IOException
 {
	 Statement st=null;
     Connection con=null;
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
	String phone= request.getParameter("phone");
    String birthdate= request.getParameter("dob");
    String country = request.getParameter("country");
	String state= request.getParameter("state");
	String city = request.getParameter("city");
	String zip = request.getParameter("zip");
    String Houseaddress = request.getParameter("address");
  String ipaddress=request.getRemoteAddr();
   RandomPasswordGenerator rpg=new  RandomPasswordGenerator();
   char verifycode[]=rpg.generatePswd();
  try
  {
	 Class.forName("com.mysql.jdbc.Driver");
     con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bideasy",
            "root", "root");
   st = con.createStatement();
       int i = st.executeUpdate("insert into members(FirstName,LastName,UserName,Email,Password,Contact,DOB,Country,State,City,Zipcode,Address,UserIPAddr,EmailVerified,Verificationcode) " + "values  ('"+fname+"','"+ lname +"','"+user+"','"+email+"','"+pwd+"','"+phone+"','"+birthdate+"','"+country+"','"+state+"','"+city+"','"+zip+"','"+Houseaddress+"','"+ipaddress+"','"+0+"','"+verifycode+"')");
   
	  if(i>0)
	  {
		  try
		  {
		  new MailSend().SendMail(email,"Welcome to BidEsay","Hi,"+fname+"Your Verification Code is "+verifycode); 
            }
		  catch (Exception e)
		  {
		  }
		  try{
		     ServletContext context= getServletContext();
             RequestDispatcher rd= context.getRequestDispatcher("/welcome.jsp");
              rd.forward(request, response);
		  }
		  catch(Exception e){}
	    }
	  else
	  {
		   try{
            ServletContext context= getServletContext();
		    request.setAttribute("Reg_error_msg", "Error in Registration.Plz Try Again!");
             RequestDispatcher rd= context.getRequestDispatcher("/register.jsp");
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
		    request.setAttribute("Reg_error_msg", "Error in Registration.Plz Try Again!");
             RequestDispatcher rd= context.getRequestDispatcher("/register.jsp");
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
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws  IOException
 {
		doGet(request,response);
 }
}