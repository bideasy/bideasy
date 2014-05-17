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
	<title>Post your Items - BidEasy</title>
	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
	<link href="<c:url value="css/sell.css" />" rel="stylesheet">
	
	
	<!-- Importing fonts from Google -->
	<!-- <link href = "http://fonts.googleapis.com/css?family=PT+Sans:400,700" rel="stylesheet" />
	<link href = "http://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" /> -->
					
	<script src = "js/jquery-1.10.2.min.js"></script>
	<script src = "js/jquery-ui.js"></script>
	<script src = "js/jquery.ui.datepicker.js"></script>
	<script src = "js/startdate.js"></script>
	<script src = "js/enddate.js"></script>
	<script src = "js/jquery-1.7.1.min.js"></script>
	<!--<link href="<c:url value="css/validation.css" />" rel="stylesheet">
	<script src = "js/jquery.validate.min.js"></script>
		<script src = "js/sell_script.js"></script>-->

	<link href = "<c:url value="js/jquery-ui.css" />" rel = "stylesheet">
	<link href = "<c:url value="js/jquery.ui.core.css" />" rel = "stylesheet">
	<link href = "<c:url value="js/jquery.ui.datepicker.css" />" rel = "stylesheet">
</head>
<body>
<c:choose>
<c:when test="${not empty Username}">
	<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->

	<!-- Body -->
	<div class = "blanket">
		<div id = "sell_container">
			<div id = "sell_wrapper">
			<c:if  test="${not postingAd_error_msg}">
                   <p style = "color: red; font-family: 'Verdana', sans-serif, font-size: small; margin-left: 10px;">${postingAd_error_msg}</p>
                 </c:if>
				 <c:remove var="Reg_error_msg"/>
				<h2><fmt:message key="sell.label.title"/></h2>
				<p><fmt:message key = "sell.label.subtitle"/></p>
				<form name = "form2" id="sell_form" action = "${pageContext.request.contextPath}/postauction" method = "POST" >
				
					<div class = "catfield_div">
						<fmt:message key = "sell.label.pimage"/>
					</div>
					
					<input type = "file" class = "photo_div" name = "pimage" required/>
					

                   
					<div class = "catfield_div">
						<label for = "pname"><fmt:message key = "sell.label.pname"/> </label>
					</div>
					
					<input type = "text" id = "pname" name = "pname" required maxlength = "20"/>
					

                   
					<div id = "cat_price">
						<div class = "cat_div">
							<fmt:message key = "sell.label.category"/> 
						</div>
						
						<select class = "cat_select" name = "category" required>
							<option value = "0">Select Category</option>
							<option value = "1">Electronics </option>
							<option value = "2">automobiles </option>
							<option value = "3">apparel </option>
							<option value = "4">jewellery </option>
							<option value = "5">others </option>
						</select>
					 
				</div>
                   
					<div class = "left_pfc">
						<label for = "reserved_price"><fmt:message key = "sell.label.reservedprice"/>  </label>
							<div class = "price_field">
							
								<input type ="number" id="reserved_price" name="reserved_price" 
								placeholder = "Rs." required/>
							</div>
						</div>
					
                      
						<div class = "right_pfc">
							<label for = "start_price" style = "margin-left: 10px;"><fmt:message key = "sell.label.startprice"/>  </label>
							<div class = "price_field">
							
								<input type = "number" id="start_price" name="start_price" placeholder = "Rs." 
								required onchange="check_reserve_price_auction_Start_amt()"/>
							</div>
						</div>
						
	                   
					<div class = "catfield_div">
						<label for = "desc"><fmt:message key = "sell.label.pdesc"/> </label>
					</div>
					
					<textarea rows = "4" cols = "25" id = "desc" name = "description" required maxlength = "256"></textarea>
					
                 
					<div class = "datefield_div">
						<div class = "left_datefield">
							<label for = "s_datepicker"><fmt:message key = "sell.label.sdate"/> </label>
							
							<input type = "text" id = "s_datepicker" name = "start_date" style = "font-family: Verdana;" required />
						    </div>
						</div>
						
					<div class = "datefield_div">
						<div class = "right_datefield">
							<label for = "e_datepicker"><fmt:message key = "sell.label.edate" />  </label>
							
							<input type = "text" id = "e_datepicker" name = "end_date" style = "font-family: Verdana;" required onchange="check_start_date_end_date()"/>
							</div>
						</div>

					  

<script>
	function check_reserve_price_auction_Start_amt()
	{
	var res_price= parseInt(document.getElementById('reserved_price').value) ;
	var start_price= parseInt(document.getElementById('start_price').value);
	
	
	if(start_price>res_price)
		{
		alert('Reserve Price cannot be  less than Auction Start Price');
        document.getElementById('start_price').value =res_price;
		sell_form.start_price.focus();
		}
		else{}
}

function check_start_date_end_date()
{
	var start_date=document.getElementById('s_datepicker').value ;
	var end_date=document.getElementById('e_datepicker').value ;

	if(start_date>=end_date)
	{
		alert('End Date cannot be Before Start Date');
          sell_form.e_datepicker.focus();
	}
}


	</script>

					<div class = "catfieldchoice_div">
						<fmt:message key = "sell.label.pused"/> 
						<span class = "catfield_choice">
							<span>
								<input type = "radio" value = "yes" name = "p_use" > 
							</span>
							<fmt:message key = "sell.label.choiceyes"/> &nbsp;&nbsp;&nbsp;
							<span>
								<input type = "radio" value = "no" name = "p_use" checked>
							</span>
							<fmt:message key = "sell.label.choiceno"/> 
						</span>
					</div>

					<fmt:message key="sell.button.submit" var="buttonValue" />
					<div class = "catfield_div">
						<input type = "submit" value = "${buttonValue}" class = "submit_button">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Body End. -->

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