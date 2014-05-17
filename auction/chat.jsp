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
	<title>Chat - BidEasy</title>

	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
	<link href="<c:url value="css/chat.css" />" rel="stylesheet">
	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">
</head>
<body>
<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->

	<!-- Body -->
	<div id = "chat_container">
		<div id = "chat_wrapper">
			<h1 class = "chat_title">#BidEasy on IRC</h2>
				<br />

				<iframe src="http://webchat.freenode.net?channels=%23BidEasy&uio=Mj10cnVlJjExPTI0Ng93" width="647" height="400"></iframe>
				<br /><br />

				<h2 class = "header">How to use the IRC channel</h2>
				<hr />
				<p class = "chat_p">Our IRC channel is available for real-time communication, and it can serve as an ideal way to get help.</p>
				<p class = "chat_p">Please note that IRC is not meant to be a 24/7 helpline with immediate support.</p>
				<br />

				<h2 class = "header">IRC Commands</h2>
				<hr />
				<p class = "chat_p">Some common IRC commands are enlisted below:</p>
				<table>
					<tr>
						<th>Command to Type</th>
						<th>What it does</th>
					</tr>
					<tr>
						<td><tt>/nick YourName</tt></td>
						<td>Sets your current nickname to <em>YourName</em>&nbsp;</td>
					</tr>
					<tr>
						<td><tt>/msg Nickname message</tt></td>
						<td>Sends <em>message</em> to <em>nickname</em> in a private chat window</td>
					</tr>
					<tr>
						<td><tt>/whois Nickname</tt></td>
						<td>Shows additional information about <em>Nickname</em></td>
					</tr>
					<tr>
						<td><tt>/quit</tt></td>
						<td>Logs out of IRC</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- /Body -->

	<!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
</body>
</html>