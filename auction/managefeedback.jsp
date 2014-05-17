<%@ page import="java.sql.*,java.io.*,java.util.*" %> 
 <%@page isELIgnored="false" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internationalization.messages" />

<!DOCTYPE html>
<html>
<head>
<title> View feedback - BidEasy</title>
<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

<link href="<c:url value="css/styles.css" />" rel="stylesheet">
<link href="<c:url value="css/viewfeedback.css" />" rel="stylesheet">

</head>
<body>

<c:choose>
<c:when test="${Username=='admin'}">
<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->

<!-- Outer div -->
<div id = "container">
<p>&nbsp;</p>
	<h1 align = "center" style = "margin-top: 10px; font-family: 'Verdana'; font-size: 18px; margin-left: 20px; line-height: 1.2em;">Manage Feedbacks and queries</h1>
	<p>&nbsp;</p>
<c:if  test="${not empty feed_res_error_msg}">
                   <p style = "color: red; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">${feed_res_error_msg}</p>
                 </c:if>
				 <c:remove var="feed_res_error_msg"/>
<!-- Inner div -->
<div id = "inner">
	<%
	
	String connectionURL = "jdbc:mysql://localhost:3306/bideasy";
	Connection con=null;
	try{      
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con=DriverManager.getConnection(connectionURL,"root","root");      
		Statement stmt=con.createStatement();
		String strQuery ="select * from feedbacks where reviewedfeedback=0 limit 4";
		ResultSet rs = stmt.executeQuery(strQuery);
	
		
		if(rs.next())
		{
			do{
			String feedback_id=rs.getString("feedbackid");
			String feedback_text=rs.getString("feedbacktext");
			String feedback_provider=rs.getString("emailid");
%>

<!-- horizontal divs -->
<div class = "hor_div">
<form name="feedback_res" action = "${pageContext.request.contextPath}/feedbackresponse" method = "POST">	
<input type="hidden" name="user_email"  id="user_email"  value=<%=feedback_provider%>></input>
<p class = "hov"><input type="hidden" name="feedback_id" value=<%=feedback_id%>></input></p>
</br>
<p class = "hov"><strong>Feedback Text:</strong><%=feedback_text%></p>
</br>
<p class = "hov"><strong>User E-mail: </strong><%=feedback_provider%></p>
</br>
</br>
<p class = "hov"><strong>Enter Your Response :</strong><textarea name = "feedback_response_text" id="feedback_response_text" rows = 3 cols = 30></textarea></p>

<input type = "submit" name = "update_feedback" value = "Send response!" class = "fdbutton"  />
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