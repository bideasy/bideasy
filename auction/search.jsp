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
<title> Search- BidEasy</title>
<link rel = "shortcut icon" href="images/favicon.png" type="image/png">
<link href="<c:url value="css/styles.css" />" rel="stylesheet">
<link href="<c:url value="css/viewauction.css" />" rel="stylesheet">
<script src = "js/jquery-1.10.2.min.js"></script>
<script src = "js/jquery-ui.js"></script>
<link href="<c:url value="css/colorbox.css" />" rel="stylesheet">
<script src = "js/jquery.colorbox-min.js"></script>
<script>
$(document).ready(function(){
		$(".img").colorbox({rel: 'img', width: "75%", height: "75%"});
	});
</script>
</head>

<body>
<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->


<div id = "container">
<p>&nbsp;</p>
	<h1 align = "center" style = "margin-top: 10px; font-family: 'Verdana'; font-size: 18px; margin-left: 10px;"><fmt:message key = "search.label.title"/></h1>
	<p>&nbsp;</p>

<%
        String Category_name=request.getParameter("sbox");
	String connectionURL = "jdbc:mysql://localhost:3306/bideasy";
	Connection con=null;
	try{      
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		int categoryid=0;
		con=DriverManager.getConnection(connectionURL,"root","root");      
		Statement stmt=con.createStatement();
		String strQuery = "select * from category where category_name='"+Category_name+"'";
		ResultSet rs1 = stmt.executeQuery(strQuery);
		 if(rs1!=null && rs1.next() )
	  {
		categoryid=Integer.parseInt(rs1.getString("category_id"));
	  }
		strQuery = "select * from auction where Is_Auction_Authenticated=1 and category_id="+categoryid+" limit 3";
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
<div class = "hor_div" style = "height: 320px;" align = "center">
<form name="search_results_form" >
      <p><a href = "<%=source%>" class = "img" width = '100px' height = '100px'><img src="<%=source%>" class = "img" width='100px' height='100px'><br/><br/><br/><br/><br/><br/><fmt:message key="manageauction.label.imgzoom"/></a></p>
  </br>
    <p class = "hov"><strong><fmt:message key="manageauction.label.productname"/>:</strong> <%=pname%></p>
  </br>
    <p class = "hov"><strong><fmt:message key="manageauction.label.productdesc"/>:</strong> <%=description%></p>
	</br>
    <p class = "hov"><strong><fmt:message key="manageauction.label.productused"/>:</strong> <%=product_used%></p>   
  </br>
    <p class = "hov"><strong><fmt:message key="manageauction.label.auctioncreator"/>:</strong><%=author%></p>  
      
 </br>
    <p class = "hov"><strong><fmt:message key="manageauction.label.startprice"/>:</strong> <%=start_price%></p>
</br>

  <p class = "hov"><strong><fmt:message key="manageauction.label.enddate"/>:</strong> <%=end_date%></p>
</br>
</form>
</div>
<!-- /Horizontal divs -->
<%
	}while(rs.next());
}
	else
		{%>
<div class = "hor_div">
	<p class = "hov">No More Records</p>
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

<!-- /Inner div -->
</div>
<!-- /Outer div --><!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
</body>
</html>
