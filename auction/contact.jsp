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
	<title>Contact - BidEasy</title>
	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
	
	<!-- Importing fonts from Google -->
	<!-- <link href = "http://fonts.googleapis.com/css?family=PT+Sans:400,700" rel="stylesheet" />
	<link href = "http://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" /> -->
</head>
<body>

<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->

	<!-- Body -->
	
	<div id = "contact_container">
		<div id = "contact_wrapper">
			<h1 class = "fixed_about_contact_feedback_title">Contact Us</h1>

			<p class = "desc">We can directly be contacted via our dedicated <a href = "chat.jsp" class = "about_contact_link" target = "_blank">IRC</a> page.</p>

			<p class = "desc">Please visit our <a href = "help.jsp" class = "about_contact_link">help section</a> for support-related issues. Don't forget to check the FAQs section in the help section where you can get help with your questions.</p>

			<p class = "contact_main_email">We can be reached through e-mail at: <a href = "mailto:bid_easy@gmail.com" class = "about_contact_link">bideasy1@gmail.com</a></p>
			<small class = "ctc_note"><strong>Note:</strong> Please don't send support-related questions here, they won't be answered.</small>

			<p class = "desc">Additionally, we can also be contacted via facebook, twitter or google plus.</p>
		</div>
	</div>
	<!-- Body end. -->

	<!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
</body>
</html>