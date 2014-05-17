
<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
 <%@page isELIgnored="false" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internationalization.messages" />

<html>
<head>
<title> View Auctions - BidEasy</title>

<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

<link href="<c:url value="css/styles.css" />" rel="stylesheet">
<link href="<c:url value="css/colorbox.css" />" rel="stylesheet">
<link href="<c:url value="css/viewauction.css" />" rel="stylesheet">

<script src = "js/jquery-1.10.2.min.js"></script>
<script src = "js/jquery-ui.js"></script>
<!-- <script src = "js/jquery.ui.datepicker.js"></script> -->
<script src = "js/jquery.countdown.js"></script>
<script src = "js/jquery.colorbox-min.js"></script>
<script>
$(document).ready(function(){
		$(".img").colorbox({rel: 'img', width: "75%", height: "75%"});
	});
</script>
</head>
<body>
<c:choose>
<c:when test="${not empty Username}">


<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->


<div id = "container">
<p>&nbsp;</p>
	<h1 align = "center" style = "margin-top: 10px; font-family: 'Verdana'; font-size: 18px; margin-left: 10px;"><fmt:message key="viewauction.label.title"/></h1>
	<p>&nbsp;</p>
<c:if  test="${not empty Bid_msg}">
                   <p style = "color: Green; font-family: 'Verdana', sans-serif, font-size: small; font-weight: bold; margin-left: 10px;">${Bid_msg}</p>
                 </c:if>
<c:remove var="Bid_msg"/>

<c:if  test="${not empty Bid_error_msg}">
                   <p style = "color: Red; font-family: 'Verdana', sans-serif, font-size: small; font-weight: bold; margin-left: 10px;">${Bid_error_msg}</p>
                 </c:if>
				 <c:remove var="Bid_error_msg"/>

				 <c:if  test="${not empty Bid_error_msg1}">
                   <p style = "color: Red; font-family: 'Verdana', sans-serif, font-size: small; font-weight: bold; margin-left: 10px;">${Bid_error_msg1}</p>
                 </c:if>
				 <c:remove var="Bid_error_msg1"/>


	<%
	String connectionURL = "jdbc:mysql://localhost:3306/bideasy";
	Connection con=null;
	try{      
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con=DriverManager.getConnection(connectionURL,"root","root");      
		Statement stmt=con.createStatement();
		String strQuery = "select * from auction where Is_Auction_Authenticated=1 and auction_closed=0 and auction_end_date>=curdate() ";
		ResultSet rs = stmt.executeQuery(strQuery);
		
			
		if(rs.next())
		{
			do{
			String pname=rs.getString("product_name");
			String description=rs.getString("product_description");
			String source="images/"+rs.getString("product_image");
			String product_used=rs.getString("product_isUsed");
			String end_date=rs.getString("auction_end_date");
			String author=rs.getString("auction_creator_id");
			int start_price=Integer.parseInt(rs.getString("auction_start_price"));
			String auction_UUID=rs.getString("Auction_UUID");

			
%>

<!-- horizontal divs -->
<div class = "hor_div" align = "center">
<form name="bidauction_form" action = "${pageContext.request.contextPath}/bid" method = "POST">
<input type="hidden" name="auction_uuid" value=<%=auction_UUID%>></input>
<script>
				var en;
			en='<%=end_date%>';
			var parts = en.split('-');
			
			parts=parts[0]+"/"+parts[1]+"/"+parts[2];
			

			$(function() {
			$( '#clock' ).countdown(parts, function(event) {
			$(this).html(event.strftime('%D Days %H:%M:%S'));
		})

		 $( '#clock' ).on( 'finish.countdown', function(event) {
			$(this).parent()
			.addClass('disabled')
			 //document.getElementById('update_bid').value='Closed Auction'; 
			//document.getElementById('update_bid').disabled=true;
		}) 
	});
      		
				</script>

<input type="hidden" name="bidder_userId" value="${userId}"/>
<input type="hidden" name="product_info" value=<%=pname%>></input>
<input type="hidden" name="end_date" id="end_date" value=<%=end_date%>></input>
<input type="hidden" name="author_email" id="author_email" value=<%=author%>></input>
<input type="hidden" name="current_bidder_email" id="current_bidder_email" value="${emailId}">
	
      <p><a href = "<%=source%>" class = "img" width = '100px' height = '100px'><img src="<%=source%>" class = "img" width='100px' height='100px'><br/><br/><br/><br/><br/><br/><strong><fmt:message key="viewauction.label.imgzoom"/></strong></a></p>
  </br>
    <p class = "hov"><strong><fmt:message key="viewauction.label.productname"/>:</strong> <%=pname%></p>
  </br>
    <p class = "hov"><strong><fmt:message key="viewauction.label.productdesc"/>: </strong><%=description%></p>
	</br>
    <p class = "hov"><strong><fmt:message key="viewauction.label.productused"/>:</strong> <%=product_used%></p>   
  </br>
    <p class = "hov"><strong><fmt:message key="viewauction.label.auctioncreator"/>: </strong><%=author%></p>  
      
 </br>
    <p class = "hov"><strong><fmt:message key="viewauction.label.startprice"/>: </strong> <%=start_price%></p>

</br>
<p>&nbsp;</p>
<span style = "font-family: Verdana; font-size: 14px; margin-left: 10px;"><strong> Time left: </strong></span>
<span id = "clock" style = "color: red; font-weight: bold; font-family: Verdana;"></span>
<p>&nbsp;</p>
	   <p class = "hov"><strong><fmt:message key="viewauction.label.enterbidamount"/></strong> <input type= "number" id="bid_amt" name="bid_amt"  placeholder="<%=1+start_price%>"required onchange="check_bid_amt()" ></input></p>
	   <script>
	function check_bid_amt()
	{
	var bid_val= parseInt(document.getElementById('bid_amt').value)
		var temp=<%=start_price%>;
	var bid_start_price=parseInt(temp);
	
	if(bid_val<=bid_start_price)
		{
		alert('Bid Amount is less than Auction Start Price');
        document.getElementById('bid_amt').value =bid_start_price+1;
		}

	}
	</script>
<fmt:message key="viewauction.button.bidbutton" var="buttonValue" />
<input type = "submit" name = "update_bid" id= "update_bid" value = "${buttonValue}" class = "fdbutton"  />

  </form>
</div>
<!-- /Horizontal divs -->
<%
	}while(rs.next());
}
	else
		{%>
<div class = "hor_div">
	<p class = "hov">No  Records...</p>
	</div>
		<%}
            
rs.close();
con.close();
stmt.close();
	}
	catch(Exception e)
	{
		e.getMessage();
	}

%>
</div>
<!-- /Inner div -->
</div>
<!-- /Outer div -->
<!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
	</c:when>
	
	<c:otherwise>
	<jsp:forward page="/login.jsp" />
	</c:otherwise>
	</c:choose>
</body>
</html>
