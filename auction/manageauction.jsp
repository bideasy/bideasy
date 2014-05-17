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
<title> Authenicate Auctions - BidEasy</title>
<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

<link href="<c:url value="css/styles.css" />" rel="stylesheet">
<link href="<c:url value="css/viewauction.css" />" rel="stylesheet">
<link href="<c:url value="css/colorbox.css" />" rel="stylesheet">

<script src = "js/jquery-1.10.2.min.js"></script>
<script src = "js/jquery-ui.js"></script> 
<script src = "js/jquery.colorbox-min.js"></script>
<script>
	$(document).ready(function(){
		$(".img").colorbox({rel: 'img', width: "80%", height: "80%"});
	});
  </script>
</head>

<body>
<c:choose>
<c:when test="${Username=='admin'}">
<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->


<div id = "container">
<p>&nbsp;</p>
<p>&nbsp;</p>
	<h1 align = "center" style = "margin-top: 10px; font-family: 'Verdana'; font-size: 18px; margin-left: 10px;">Manage Auctions</h1>
	<p>&nbsp;</p>
<c:if  test="${not empty review_msg}">
                   <p style = "color: green; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">${review_msg}</p>
				   <c:remove var="review_msg"/>
                 </c:if>
				 

<c:if  test="${not empty del_msg}">
                   <p style = "color: green; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">${del_msg}</p>
				    <c:remove var="del_msg"/>
                 </c:if>
				


                  
               
				 
				 <c:if  test="${not empty manageauctions_error_msg}">
				  <p style = "color: red; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">${manageauctions_error_msg}</p>
				  <c:remove var="manageauctions_error_msg"/>
				 </c:if>


	<%
	String connectionURL = "jdbc:mysql://localhost:3306/bideasy";
	Connection con=null;
	try{      
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con=DriverManager.getConnection(connectionURL,"root","root");      
		Statement stmt=con.createStatement();
		String strQuery = "select * from auction where Is_Auction_Authenticated=0 and auction_closed=0";
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
<div class = "hor_div" style = "height: 360px;" align = "center">
<form name="reviewauction_form" action = "${pageContext.request.contextPath}/reviewauction" method = "POST">
<input type="hidden" name="auction_uuid" value=<%=auction_UUID%>></input>
<input type="hidden" name="author_email" id="author_email" value=<%=author%>></input>

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

<fmt:message key="manageauction.button.reviewauction" var="buttonValue" />
<input type = "submit" name = "reviewed_auction" id= "reviewed_auction" value = "${buttonValue}" class = "fdbutton"  />
<fmt:message key="manageauction.button.deleteauction" var="buttonValue2" />
<input type = "submit" name = "delete_auction" id= "delete_auction" value = "${buttonValue2}" class = "fdbutton1"  />
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
</div>
<!-- /Inner div -->
</div>
<!-- /Outer div --><!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
	</c:when>
	
	<c:otherwise>
	<jsp:forward page="/login.jsp" />
	</c:otherwise>
	</c:choose>
</body>
</html>
