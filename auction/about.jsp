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
	<title>About - BidEasy</title>
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
	<div id = "about_contact_container">
		<div id = "about_contact_wrapper">
			<h1 class = "fixed_about_contact_feedback_title">About us</h1>

			<p class = "desc">Hello!</p>

			<p class = "desc">Bideasy is an online auction service that started in 2014.</p>

			<p class = "desc">The primary goal of BidEasy is to integrate an open marketplace via an online auction website accessible by anyone, that enables easy, hassle-free trade of items between buyers and sellers. </p>

			<p class = "desc">We hope you have a pleasant experience with BidEasy!</p>
			<hr/>
			<h1 class = "fixed_about_contact_feedback_title">The developers:</h1>

			<p class = "sub_devdisc"><em>Rome wasn't built in a day</em>, so the saying goes! Our development team consists of:</p><hr class = "separator"/>
				<h3 class = "fixed_dev_subtitle">
					Vaibhav Agarwal
				</h3>	
				<p class = "dev_text">
					Team leader. Passionate Programmer and Data Model Designer. Open source code contributor.A potential Gsoc aspirant.Good Knowledge about Jstl,Jsp,servlets,Springs,Jquery,Ajax and Data Model Designing.Currently Working at Persistent Systems as Intern.
				</p>
				<p class = "sub_dev">
					Contact: <a class = "dev_mail" href = "mailto:kmit.vaibhav@gmail.com">kmit.vaibhav@gmail.com</a>
				</p>
					<hr/>
					<div class = "dev_img_container">
						<div class = "circular-right1">
						</div>
					</div>
				</div>

				<div id = "dev2_content_wrapper">
					<h3 class = "fixed_dev_subtitle">
						Anith Vishwanath 
					</h3>	
					<p class = "dev_text">
						UI Designer. Passionate about web design and development. Good knowledge about HTML5, CSS3, and Photoshop.
					<p class = "sub_dev">
						Contact: <a class = "dev_mail" href = "mailto:anithvishwanath@gmail.com">anithvishwanath@gmail.com</a>
					</p>
					<hr/>
					<div class = "dev_img_container">
						<div class = "circular-right2">
						</div>
					</div>
				</div>

				<div id = "dev3_content_wrapper">
					<h3 class = "fixed_dev_subtitle">
						Vineel Sunny
					</h3>	
					<p class = "dev_text">
						Passionate about programming.
					</p>
					<p class = "sub_dev">
						Contact: <a class = "dev_mail" href = "mailto:vineelsunnykmit@gmail.com">vineelsunnykmit@gmail.com</a>
					</p>
					<hr style="display:none;"/>
					<div class = "dev_img_container">
						<div class = "circular-right3" style="margin-top: 30px">
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Body end. -->

	<!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
</body>
</html>