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
	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
</head>
<body>		
	<!-- Global Header -->
	<div id = "global_header">
		<!-- Topbar starts here. -->
		<div id = "top_bar_wrapper">
			<div class = "top_bar">
				<ul class = "top_bar_spacer">
					<div class = "top_bar_container">
						<li class = "top_bar_links">
							<span class = "top_bar_spacer">
								<c:if test="${empty Username}">
								<a href = "login.jsp" style="color: #1765f4">
									<fmt:message key="home.link.login" />
								</a>
								<fmt:message key="home.label.or" />
								<a href="register.jsp" style="color: #1765f4">
									<fmt:message key="home.link.register" />
								</a>
							</c:if>				
							<div class = "dividerb"></div>
							<c:if test="${not empty Username}">
							<fmt:message key="home.label.welcome"/>,
							<c:out value="${fullname}" />
                             <c:if test="${Username=='admin'}">
							 <a href="admin.jsp" style="color: #1765f4">
							 Admin
							 </a>
							 </c:if>
                     		<a href="logout.jsp" style="color: #1765f4">
								Logout
							</a>
                           </c:if>
						</span>
					</li>
				<li class = "top_bar_links">
					<span class = "top_bar_spacer">
					<c:if test="${empty Username}">
					<a href = "login.jsp" >
                <fmt:message key="home.link.browse" />
					</a>
					</c:if>
                  <c:if test="${not empty Username}">
					<a href = "viewad.jsp">
					<fmt:message key="home.link.browse" />
					</a>
					</c:if>
					</span>
				</li>
				<div class = "divider"></div>
				<li class = "top_bar_links">
					<span class = "top_bar_spacer">
                     <c:if test="${empty Username}">
					<a href = "login.jsp" >
					<fmt:message key="home.link.sell" /></a>
					</c:if>
                  <c:if test="${not empty Username}">
					<a href = "sell.jsp">
					<fmt:message key="home.link.sell" />
					</a>
					</c:if>
					</span>
				</li>
				<div class = "divider"></div>
				<li class = "top_bar_links">
				<span class = "top_bar_spacer"><a href = 'help.jsp'><fmt:message key="home.link.help" /></a>
				</span>
			</li>
		</div>
	</ul>
</div>
</div>
<!--Topbar ends here. -->

		<!-- Header section starts here. -->
		<div id = "nav_bar_wrapper">
			<div class = "nav_bar">
				<div id = "logo_wrapper">
					<a href = "index.jsp" class = "main_logo"></a>
				</div>
				<div id = "search_bar_wrapper">
					<form id = "be-search" method = "POST" action = '${pageContext.request.contextPath}/search.jsp' >
						<span id = "search_icon_wrapper">
							<span class = "search_icon"></span>
						</span>
						<input type = "search" name = "sbox" placeholder = "Search..." class = "search_bar" results = "5" autocomplete = "on" autofocus = "autofocus" />
						<div id = "search_button_wrapper">
							<input type = "submit" value = "Go" class = "search_button" />
						</div>
					</form>
				</div>
				<div id = "cart_wrapper">
					<a href = "chat.jsp" class = "cart_button" target = "_blank"><fmt:message key="home.link.chat" /></a>
				</div>
			</div>
		</div>
		<!-- Header section ends here. -->
	</div>
	<!-- /Global Header -->
</body>
</html>