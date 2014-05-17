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
	<title>Upload Image - BidEasy</title>
	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
	<link href="<c:url value="css/sell.css" />" rel="stylesheet">
	<link href="<c:url value="css/insertimage.css" />" rel="stylesheet">

	<script src = "js/jquery-1.10.2.min.js"></script>
</head>
<body>
	<!-- Body -->
	<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->
	<p style = "color: green; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">
Succesfully posted auction!
	<div class = "blanket">
		<div id = "postad_container">
			<div id = "postad_wrapper">
				<h2>Upload Product image</h2>
				<form ENCTYPE = "multipart/form-data" action = "${pageContext.request.contextPath}/insertimage" method = "POST">
					<div class = "fileupload">
						Choose file:
					</div>
					<input name = "file" type = "file" required>
					
					<fmt:message key="sell.button.submit" var="buttonValue" />
					<div class = "updbutton">
						<input type = "submit" value = "Upload!" class = "submit_button" style = "width: 90px;">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- /Body -->
<!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
</body>

</html>
 