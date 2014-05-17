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

	<link href="<c:url value= "css/styles.css" />" rel="stylesheet">
	
	<!-- Importing fonts from Google -->
	<!-- <link href = "http://fonts.googleapis.com/css?family=PT+Sans:400,700" rel="stylesheet" />
	<link href = "http://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" /> -->

	<script src = "js/jquery-1.10.2.min.js"></script>
	<script src = "js/jquery.easing.1.3.js"></script>
	<script src = "js/jquery.animate-enhanced.min.js"></script>
	<script src = "js/jquery.superslides.js"></script>
	<script src = "js/slide-function.js"></script>
</head>
<body>
<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->

	<!-- Body -->
	<!-- Slideshow section start. -->
	<div class = "wide-container">
		<!-- Slides Container -->
		<div id = "slides">
			<ul class = "slides-container">
				<li>
					<img src="images/bannermain.png" width = "1024" height = "768" />
				</li>
				<li>
					<img src="images/Lighthouse.jpg" width = "1024" height = "768" />
				</li>
				<li>
					<img src="images/Desert.jpg" width = "1024" height = "768" />
				</li>
			</ul>
			<nav class = "slides-navigation">
				<a href = "#" class = "next"><img src = "images/rightblack-48.png" alt = "Next" /></a>
				<a href = "#" class = "prev"><img src = "images/leftblack-48.png" alt = "Previous" /></a>
			</nav>
		</div>
	</div>
	<!-- Slideshow section end. -->
	<!-- Body end. -->

	<!-- Global Footer -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->

</body>
</html>