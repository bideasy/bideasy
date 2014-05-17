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
	<title>Welcome to BidEasy!</title>
	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
	<link href="<c:url value="css/welcome.css" />" rel="stylesheet">
	<link href="<c:url value="css/login.css" />" rel="stylesheet">
	<link href="<c:url value="css/forgotpassword.css" />" rel="stylesheet">
	
	<!-- Importing fonts from Google -->
	<!-- <link href = "http://fonts.googleapis.com/css?family=PT+Sans:400,700" rel="stylesheet" />
	<link href = "http://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" /> -->

	<script src = "js/jquery-1.10.2.min.js"></script>
</head>
<body>

	<!-- Body -->
	<div id = "box_container">
		<div class = "wlogo_wrapper">
			<a href = "index.jsp" class = "wlogo"></a>
		</div>
		<!-- <div id = "box_holder">
				<div class = "box_wrapper"> -->
	<div id = "verification_container">
		<div id = "verification_wrapper"> 
			<c:if  test="${not empty ver_error_msg}">
			<p style = "color: red; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">${ver_error_msg}</p>
			</c:if>
			<c:remove var="ver_error_msg"/>
			<c:if  test="${not empty login_error_msg}">
			<p style = "color: red; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">${login_error_msg}</p>
			</c:if>
			<c:remove var="login_error_msg"/>
			<p class = "verify_text"><fmt:message key = "welcomepage.label.subtitle" /></p>
			<form method = "POST" id = "verifyRegister_form" action = "${pageContext.request.contextPath}/verifyuser">
				<span class = "verify_code">Verification code:</span>
				<div>
					<input type="text" name="verifyregister" class = "verify_textfield" required />
				</div>
				<fmt:message key="welcomepage.button.submit" var="buttonValue" />
				<div>
				<input type="submit" value="${buttonValue}" class = "welcome_button" />
			</div>
			</form>
		</div>
	</div>
	</div>
	<!-- /Body -->
	

</body>
</html>
