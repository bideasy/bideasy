import java.io.*;
import java.util.*;
import java.sql.*;
public class FilterAuction 
{
	static Connection con=null;
	
	public static ArrayList<Auction> getAuctions()
	{
		ArrayList<Auction> AuctionList = new ArrayList<Auction>();
		try
		  {
			 Class.forName("com.mysql.jdbc.Driver");
		     con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bideasy","root", "root");
		     Statement statement = con.createStatement();
		      ResultSet rs = statement.executeQuery("select * from auction");
		      Auction auction=new Auction();
		      while(rs.next())
                {
		    	  auction.setProduct_Id(rs.getString("Product_Id"));
		    	  auction.setproduct_name(rs.getString("product_name"));
		    	  auction.setproduct_description(rs.getString("product_description"));
		    	  auction.setproduct_image(rs.getString("product_image"));
		    	  auction.setproduct_isUsed(rs.getString("product_isUsed"));
		    	  auction.setauction_creator_id(rs.getString("auction_creator_id"));
		    	  auction.setauction_end_date(rs.getString("auction_end_date"));
		    	  auction.setauction_start_price((Integer.parseInt(rs.getString("auction_start_price"))));		    	  
                }
		      AuctionList.add(auction);

		  
		 
		 

	}
		catch(SQLException e){e.printStackTrace();}
		catch(ClassNotFoundException e){e.printStackTrace();}
		
		return AuctionList;
	}
}
