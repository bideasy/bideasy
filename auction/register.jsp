<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internationalization.messages" />

<html>
<head>
	<title>Register - BidEasy</title>
	
	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

	<link href="<c:url value="css/register.css" />" rel="stylesheet">
	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
	<link href="<c:url value="css/validation.css" />" rel="stylesheet">

	<script src = "js/jquery-1.10.2.min.js"></script>
	<script src = "js/countries.js"></script>
	<script src = "js/jquery-ui.js"></script>
	<script src = "js/jquery.ui.datepicker.js"></script>
	<script src = "js/date.js"></script>
	<script src = "js/jquery.validate.min.js"></script>
	<script src = "js/script.js"></script>


	<link href = "<c:url value="js/jquery-ui.css" />" rel = "stylesheet">
	<link href = "<c:url value="js/jquery.ui.core.css" />" rel = "stylesheet">
	<link href = "<c:url value="js/jquery.ui.datepicker.css" />" rel = "stylesheet">
</head>
<body>	

<form name = "register" method = "POST" id = "registration_form" action = "${pageContext.request.contextPath}/registration" >
    <div id = "main_container">
    	<div class = "logo_wrapper">
			<a href = "index.jsp" class = "logo"></a>
		</div>
		<form >
			<div id = "box_container">
				<div class = "wrapper">
				<c:if  test="${not empty Reg_error_msg}">
                   <p style = "color: red; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">${Reg_error_msg}</p>
                 </c:if>
				 <c:remove var="Reg_error_msg"/>
					<div class = "text_wrapper">
						<h2><fmt:message key="register.label.title"/></h2>
					</div>
					<div class = "subtext_wrapper">
						<h4><fmt:message key="register.label.subtitle"/></h4>
					</div>
					<!-- Complete Name -->
					<div class = "firstname_div">
						<label for = "firstname_field"><fmt:message key="register.label.fname"/>: </label>
						<div class = "firstnamebox_div">
							<input type = "text" id = "firstname_field" name = "fname" value = "" required/>
						</div>
					</div>
					<div class = "lastname_div">
						<label for = "lastname_field"><fmt:message key="register.label.lname"/>: </label>
						<div class = "lastnamebox_div">
							<input type = "text" id = "lastname_field" name = "lname" value = "" required/>
						</div>
					</div>
					<!-- /Complete Name -->
					<!-- Username -->
					<div class = "username_div">
						<label for = "uname"><fmt:message key = "register.label.uname"/>: </label>
						<div class = "usernamebox_div">
							<input type="text" id = "uname" name="uname" value="" required/>
						</div>
					</div>
					<!-- /Username -->
					<!-- E-mail -->
					<div class = "regemail_div">
						<label for = "email"><fmt:message key="register.label.email"/>: </label>
						<div class = "regemailbox_div">
							<input type = "email" id = "email" name = "email" required/>
						</div>
					</div>
					<!-- /E-mail -->
					<!-- Password -->
					<div class = "password_div">
						<label for = "pass"><fmt:message key="register.label.pass"/>: </label> 
						<div class = "passwordbox_div">
							<input type="password" id = "pass" name="pass" value = "" required/>
						</div>
					</div>
					<!-- /Password -->
					<!-- Confirm Password -->
					<div class = "confpassword_div">
						<label for = "c_pass"><fmt:message key="register.label.confirmpass"/>: </label>
						<div class = "confpasswordbox_div">
							<input type = "password" id = "c_pass" name = "confirmpass" value = "" required/>
						</div>
					</div>
					<!-- /Confirm Password -->
                    <!-- Contact No. -->
                    <div class = "phone_div">
                    	<label for = "phone"><fmt:message key="register.label.phno"/>: </label>
                    	<div class = "phonebox_div">
                    		<input type="text" id = "phone" name="phone" value="" />
                    	</div>
                    </div>
                    <!-- /Contact No. -->
                    <!-- Date of Birth -->
                    <div class = "dobbox_div">
                    	<fmt:message key="register.label.dob"/>:
                    	<div class = "dob_div">
                    		<input type="text" id = "datepicker" name="dob" value="" />
                    	</div>
                    </div>
                    <!-- /Date of Birth -->
                    <!-- Address -->
                    <div class = "address_div">
                    	<label for = "address_field"><fmt:message key="register.label.address"/>: </label>
                    	<div class = "addressbox_div">
                    		<input type="text" id = "address_field" name="address" maxlength = "256" value= "" />
                    	</div>
                    </div>
                    <!-- /Address -->
                    <!-- Country -->
                    <div class = "country_div">
                    	<fmt:message key="register.label.country"/>:
                    	<div class = "countrybox_div">
                    		<select onchange="print_state('state',this.selectedIndex);" id="country" name ="country" class = "country_select"></select>
                    	</div>
                    </div>
                    <!-- /Country -->
                    <!-- State/Province -->
                    <div class = "state_div">
                    	<fmt:message key="register.label.state"/>:
                    	<div class = "statebox_div">
                    		<select name = "state" id = "state" class = "state_select"></select>
                    		<script>print_country("country");</script>
                    	</div>
                    </div>
                    <!-- /State/Province -->
                    <!-- City -->
                    <div class = "city_div">
                   		<label for = "city_field"><fmt:message key="register.label.city"/>: </label> 
                    	<div class = "citybox_div">
                    		<input type="text" id = "city_field" name="city" value="" required/>
                    	</div>
                    </div>
                    <!-- /City -->
                    <!-- Zip -->
                    <div class = "zip_div">
                    	<label for = "zip"><fmt:message key="register.label.zipcode"/>: </label>
                    	<div class = "zipbox_div">
                    		<input type = "text" name = "zip" id = "zip" value = "" maxlength = "6" />
                    	</div>
                    </div>                 
                    <!-- /Zip -->
					<!-- Submit Button -->
					<fmt:message key="forgotpass.button.submit" var="buttonValue" />
					<div id = "button_div">
						<input type = "submit" value = "${buttonValue}" class = "reg_button" />
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