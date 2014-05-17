<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internationalization.messages" />

<!DOCTYPE html>
<html>
<head>
	<title>Feedback - BidEasy</title>
	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
	<link href = "<c:url value="css/validation.css" />" rel = "stylesheet">


	<script src = "js/jquery-1.7.1.min.js"></script>
	<script src = "js/jquery.validate.min.js"></script>
    <script src = "js/feedback_script.js"></script>
	<script type="text/javascript" src="js/count-chars.js"></script>
	


	<!-- Importing fonts from Google -->
	<!-- <link href = "http://fonts.googleapis.com/css?family=PT+Sans:400,700" rel="stylesheet" />
	<link href = "http://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" /> -->
</head>
<body>

<c:choose>
<c:when test="${not empty Username}">


	<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->

	<!-- Body -->
	<div id = "feedback_container">
		<div id = "feedback_wrapper">
      
		<c:if  test="${not empty feed_error_msg && feed_error_msg=='success'}">
		 <p style = "color: green; font-family: 'Verdana', sans-serif, font-size: small; font-weight: bold; margin-left: 10px;">Success!</p>
		 </c:if>
		 <c:if test="${not empty feed_error_msg && feed_error_msg!='success'}">
        <p style = "color: red; font-family: 'Verdana', sans-serif, font-size: small; font-weight: bold; margin-left: 10px;">${feed_error_msg}</p>
                 </c:if>
				 <c:remove var="feed_error_msg"/>
			<h1 class = "fixed_about_contact_feedback_title"><fmt:message key="feedback.label.title" /></h1>
   
	<p class = "desc"><fmt:message key="feedback.label.subtitle" /></p>

	<form name = "feedback_form" id="feed_form" method = "POST" action = "${pageContext.request.contextPath}/feedback" >
	<div class="control-group">
		<p class = "desc">
			<strong><fmt:message key = "feedback.label.question2" />:</strong>
		</p>
		<dl>
			<dd>
				<span>
					<textarea name = "feedback_comments" id="textbox" class="max" rows = "8" cols = "60" onFocus="countChars('textbox','char_count',1024)" onKeyDown="countChars('textbox','char_count',1024)" onKeyUp="countChars('textbox','char_count',1024)" style = "margin: 2px; height: 132px; width: 509px; font-family:Verdana; font-size: 9.5pt; resize: none;"></textarea>
							<p class = "desc2">Number Of Characters Left: <span id="char_count">1024</span></p><br/>

						
				</span>
			</dd>
		</dl>
		</div>
		<input type="hidden" name="email_fld" value="${emailId}">
		<small>
			<fmt:message key="feedback.button.submit" var="buttonValue" />
			<span>
				<input type = "submit" value = "${buttonValue}" class = "feedback_button">
			</span>
		</small>
		<p></p>
	</form>
</div>
</div>

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