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
<title> Admin Page - BidEasy</title>
<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

<link href="<c:url value="css/styles.css" />" rel="stylesheet">
<link href="<c:url value="css/adminpage.css" />" rel="stylesheet">
</head>
<body>
<c:choose>
<c:when test="${Username=='admin'}">
	<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->

	<!-- Body -->
	<div id = "ap_container">
		<div id = "ap_wrapper">
			<h1 class = "ap_title">Admin Panel</h1>
			<p>&nbsp;</p>
			<p class = "ap_text" align = "justify">Welcome!</p>
			<p>&nbsp;</p>
			<a href = "manageauction.jsp" class = "ap_link">Review and Manage Auctions</a>
			<p>&nbsp;</p>
			<a href = "managefeedback.jsp" class = "ap_link">Manage Feedback</a>
		</div>
	</div>
	<!-- Body End. -->

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