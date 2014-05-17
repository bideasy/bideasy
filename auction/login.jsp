<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internationalization.messages" />

<html>
<head>
	<title>Sign In - BidEasy</title>
	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">
	<link href="<c:url value="css/login.css" />" rel="stylesheet">
	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
</head>

<body>
	<div id = "box_container">
		<div class = "logo_wrapper">
			<a href = "index.jsp" class = "logo"></a>
		</div>
		<form name = "SignIn" method = "POST" id = "login_form" action ="${pageContext.request.contextPath}/dologin">
			<div id = "box_holder">
				<div class = "box_wrapper">
					<div class = "text_wrapper">
					    <c:if  test="${not empty login_error_msg}">
                   <p style = "color: red; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">${login_error_msg}</p>
                 </c:if>
				 <c:remove var="login_error_msg"/>
						<h2><fmt:message key="login.label.signin"/></h2>
					</div>
					<div class = "user_div">
						<label for = "uname_field"><fmt:message key="login.label.username" />:</label>
						<div class = "userbox_div">
							<input type = "text" id = "uname_field" name="login_username" autocomplete required/>
						</div>
					</div>
					<div class = "password_div">
						<label for = "password_field"><fmt:message key="login.label.password" />:</label>
						<div class = "passwordbox_div">
							<input type = "password" id = "password_field" name="login_password" required/>
						</div>
					</div>
					
					<fmt:message key="login.button.submit" var="buttonValue" />
					<div id = "button_div">
						<input type = "submit" value = "${buttonValue}" class = "login_button" />
					</div>
					<div class = "forgot_password">
						<a href = "forgotpassword.jsp"><fmt:message key="login.link.problems" /></a>
					</div>
					<div class = "registration_link">
						<a href = "register.jsp"><fmt:message key="login.link.register" /></a>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
</body>
</html>