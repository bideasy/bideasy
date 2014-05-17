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
	<!-- Global Footer -->
	<div id = "global_footer">
	<!-- Bottom Bar -->
		<div id = "bottom_bar_wrapper">
			<div class = "bottom_bar">
				<ul class = "bottom_bar_spacer">
					<div class = "footer_container">
						<li class = "bottom_bar_links">
							<span class = "bottom_bar_spacer"><a href = "about.jsp"><fmt:message key="home.link.about" /></a>
							</span>
						</li>
						<div class = "divider"></div>
						<li class = "bottom_bar_links">
							<span class = "bottom_bar_spacer"><a href = "contact.jsp"><fmt:message key="home.link.contact" /></a>
							</span>
						</li>
						<div class = "divider"></div>
						<li class = "bottom_bar_links">
							<span class = "bottom_bar_spacer"><a href = "terms.jsp"><fmt:message key="home.link.terms" /></a>
							</span>
						</li>
						<div class = "divider"></div>
						<li class = "bottom_bar_links">
							<span class = "bottom_bar_spacer">
							<c:if test="${empty Username}">
					          <a href = "login.jsp" >
							  <fmt:message key="home.link.feedback"/>
								</a>
								</c:if>
								<c:if test="${not empty Username}">
							    <a href = "feedback.jsp">
								<fmt:message key="home.link.feedback"/>
								</a>
								</c:if>
							</span>
						</li>
						<div id = "intl_div">
							<form>
								<select id = "language" name = "language" onchange = "submit()" class = "country_select">
									<option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
									<option value="hi" ${language == 'hi' ? 'selected' : ''}>Hindi</option>
									<option value="mr" ${language == 'mr' ? 'selected' : ''}>Marathi</option>
									<option value="bn" ${language == 'bn' ? 'selected' : ''}>Bengali</option>
									<option value="te" ${language == 'te' ? 'selected' : ''}>Telugu</option>
									<option value="kn" ${language == 'kn' ? 'selected' : ''}>Kannada</option>
									<option value="pa" ${language == 'pa' ? 'selected' : ''}>Punjabi</option>
									<option value="gu" ${language == 'gu' ? 'selected' : ''}>Gujrati</option>
									<option value="ur" ${language == 'ur' ? 'selected' : ''}>Urdu</option>
								    <option value="es" ${language == 'es' ? 'selected' : ''}>Español</option>
									<option value="fr" ${language == 'fr' ? 'selected' : ''}>French</option>
								</select>
							</form>
						</div>
					</ul>
				</div>
				<!-- Bottom bar ends here. -->
				<!-- Social Media Hub -->
				<div  id = "social_media">
					<a href = "http://facebook.com/BidEasy" class = "facebook" target = "_blank"></a>
					<a href = "http://twitter.com/bid_easy" class = "twitter" target = "_blank"></a>
					<a href = "http://plus.google.com/103546917439217343115" class = "gplus" target = "_blank"></a>
				</div>
				<!-- Social Media Hub End. -->
			</div>
		</div>
		<!-- /Global Footer -->
</body>
</html>