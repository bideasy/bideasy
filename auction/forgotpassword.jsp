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
	<title>Password Recovery - BidEasy</title>
	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">
	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
	<link href="<c:url value="css/login.css" />" rel="stylesheet">
	<link href="<c:url value="css/forgotpassword.css" />" rel="stylesheet">
</head>
<body>
	<!-- Body -->
	<div id = "box_container">
		<div class = "logo_wrapper">
			<a href = "index.jsp" class = "logo"></a>
		</div>
		<div id = "box_holder">
			<div class = "box_wrapper">
				<c:if  test="${not empty forget_error_msg}">
				<p style="color: red; font-family: 'Verdana', sans-serif; font-size: small; margin-left: 10px">
				${forget_error_msg}</p>
				</c:if>
				<c:remove var="forget_error_msg"/>
				<div class = "fptext_wrapper">
					<h2><fmt:message key="forgotpass.label.title"/></h2>
				</div>
				<p>To obtain your password, enter the email address you entered at the time of registration.</p>
				<form method = "POST" id = "forget_pass_form" action = "${pageContext.request.contextPath}/forgetPass">
					<span><fmt:message key = "forgotpass.label.email" /> </span>
					<input type="email" name="email_id"  required/>
					<fmt:message key="forgotpass.button.submit" var="buttonValue" />
					<div id = "fb_div">
						<input type="submit" value="${buttonValue}" class = "forgot_button" />
					</div>
				</form>
				<p><small>If you don't have a BidEasy Account, you can <a href = "register.jsp">create one now</a>.</small></p>
			</div>
		</div>
	</div>

	<!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
</body>
</html>