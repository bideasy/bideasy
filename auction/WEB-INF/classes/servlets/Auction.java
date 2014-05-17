public class Auction 
{
	private String Product_Id;
	private String product_name;
	private String product_image;
	private String product_description;
	private String product_isUsed;
	private String auction_end_date;
	private String auction_creator_id;
	private int auction_start_price;
	
	

public Auction(){}
public Auction(String Product_Id,String product_name,String product_image,String product_description,
		String product_isUsed,String auction_end_date,String auction_creator_id,int auction_start_price )

{
	this.setProduct_Id(Product_Id);
	this.setproduct_name(product_name);
	this.setproduct_image(product_image);
	this.setproduct_description(product_description);
	this.setproduct_isUsed(product_isUsed);
	this.setauction_end_date(auction_end_date);
	this.setauction_creator_id(auction_creator_id);
	this.setauction_start_price(auction_start_price);


}

public void setProduct_Id(String Product_Id) 
         {
		  this.Product_Id =Product_Id ;
		 }
	 public String getProduct_Id() 
	 {
	  return Product_Id;
	 }
	 
	 public void setproduct_name(String product_name) 
     {
	  this.product_name =product_name ;
	 }
 public String getproduct_name() 
 {
  return product_name;
 }
 
 public void setproduct_image(String product_image) 
 {
  this.product_image =product_image ;
 }
public String getproduct_image() 
{
return product_image;
} 

public void setproduct_isUsed(String product_isUsed) 
{
 this.product_isUsed =product_isUsed ;
}
public String getproduct_isUsed() 
{
return product_isUsed;
}

public void setauction_end_date(String auction_end_date) 
{
 this.auction_end_date =auction_end_date ;
}
public String getauction_end_date() 
{
return auction_end_date;
}

public void setauction_creator_id(String auction_creator_id) 
{
 this.auction_creator_id =auction_creator_id ;
}
public String getauction_creator_id() 
{
return auction_creator_id;
}

public void setproduct_description(String product_description) 
{
 this.product_description =product_description ;
}
public String getproduct_description() 
{
return product_description;
}

public void setauction_start_price(int auction_start_price) 
{
 this.auction_start_price =auction_start_price ;
}
public int getauction_start_price() 
{
return auction_start_price;
}

}