<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internationalization.messages" />

<!DOCTYPE html>
<html>
<head>
	<title> Help - BidEasy</title>

	<link rel = "shortcut icon" href="images/favicon.png" type="image/png">

	<link href="<c:url value="css/styles.css" />" rel="stylesheet">
	<link href="<c:url value="css/help.css" />" rel="stylesheet">
</head>
<body>
	<!-- Global Header include -->
	<jsp:include page="header.jsp" />
	<!-- Global Header End. -->

	<!-- Body start. -->
	<div id = "help_container">
		<div id = "help_wrapper">
			<h1 class = "title">Help &amp; FAQ</h1>
			<hr/>
			<p>&nbsp;</p>
			<h2 class = "subtitle">Sell</h2>
			<p>&nbsp;</p>
			<p class = "description"  align = "justify"><strong>Q. How do I Sell my product on BidEasy?</strong></p>
			<p class = "description" align = "justify"><strong>A.</strong> Selling on BidEasy is as simple as <em>1-2-3</em>:</p>
			<dl class = "description" align = "justify">
				<dd>
					1. After logging in, click on the "Post Auction" link on the top right-hand corner of the screen.
				</dd>
				<dd>
					2. Fill in the required details, which include the Item Name, Image, Description of your choice. You can also choose the Reserved Price (that is, the minimum selling price of the Item) and the Starting price, and the start and end dates.
				</dd>
				<dd> 
					3. When done, click on the "Post your Item!" button. A confirmation mail is sent to your e-mail address which notifies that your item is now listed on the website!
				</dd>
			</dl></p>
			<p>&nbsp;</p>
			<p class = "description" align = "justify"><strong>Q. What is a <em>reserve</em> price?</strong></p>
			<p class = "description" align = "justify"><strong>A.</strong> A reserve price is a hidden minimum price — essentially, the lowest price that you, as a seller are willing to accept for the item. If the listing ends without any bids that meet the reserve price, then the seller is usually not <em>required</em> to sell the item.
			<br/>
			<p class = "description"><small><strong>Note:</strong> Buyers cannot see the reserve price.</small></p>
			<p>&nbsp;</p>
			<p class = "description" align = "justify"><strong>Q. Can I change my reserved price?</strong></p>
			<p class = "description" align = "justify"><strong>A.</strong> No. You cannot change the reserved price once it has been entered at the time of Posting the Auction.</p>
			<p>&nbsp;</p>
			<p class = "description" align = "justify"><strong>Q. I don't want to sell my item anymore. Can I delete my product listing?</strong></p>
			<p class = "description" align = "justify"><strong>A.</strong> Unfortunately, no. You may not delete your product listing once it has been posted on the website. However, you may contact the administrators on IRC or through e-mail who can delete the product listing for you.</p>
			<p>&nbsp;</p>
			<hr/>
			<p>&nbsp;</p>
			<h2 class = "subtitle">Bid</h2>
			<p>&nbsp;</p>
			<p class = "description" align = "justify"><strong>Q. How do I Bid on a product?</strong></p>
			<p class = "description" align = "justify"><strong>A.</strong> To bid on a product:
			<dl class = "description" align = "justify">
				<dd>
					1. You may bid on a product only after logging in.
				</dd>
				<dd>
					2. Click on the "View Auctions" link on the top right-hand corner of the screen.
				</dd>
				<dd>
					3. Here, you can look at the list of recently updated auctions.
				</dd>
				<dd>
					4. Click on the "Bid" button after entering the bidding amount to bid successfully on a product.
				</dd>	
			</dl></p>
			<p class = "description" align = "justify">After bidding, a notification mail is sent to everyone who has bid on the product about the updated auction price.</p>
			<!-- <p>&nbsp;</p> 
			<p class = "description" align = "justify"><strong>Q.</strong> </p> -->
			<p>&nbsp;</p>
			<hr/>
			<p>&nbsp;</p>
			<h2 class = "subtitle">Chat</h2>
			<p>&nbsp;</p>
			<p class = "description" align = "justify"><strong>Q. How can I use the Chat feature?</strong></p>
			<p class = "description" align = "justify"><strong>A.</strong> The chat feature is hosted on an IRC channel that is available for real-time communication, and can serve as an ideal way to get help. However it is not meant to be a 24/7 helpline with immediate support. To use the Chat feature, you first need to log-in with any nickname of <em>your</em> choice. Additional Chat instructions are provided at the bottom of the Chat page.</p>
			<p>&nbsp;</p>
			<p class = "description" align = "justify"><strong>Q. I got kicked out of the Chatroom. What do I do?</strong></p>
			<p class = "description" align = "justify"><strong>A.</strong> The channel operators, or admins have the absolute power over the channel, including the right to decide who gets to come in, who must leave, who may talk, etc. Failure to follow the Chatbox rules and a lack of proper basic etiquette may end up in you being 'kicked out' of the channel. The only way to undo this is to contact the administrator. The appropriate e-mail links can be found on the "Contact" page of the website.</p>
			<p>&nbsp;</p>
			<hr/>
			<p>&nbsp;</p>
			<h2 class = "subtitle">Change Language</h2>
			<p>&nbsp;</p>
			<p class = "description" align = "justify"><strong>Q. How do I change the language?</strong></p>
			<p class = "description" align = "justify"><strong>A.</strong> Changing the language on the website is easy!
			<dl class = "description" align = "justify">
				<dd>
					1. On the footer, there is a language select dropdown. (By default the language is English.)
				</dd>
				<dd>
					2. Click on the dropdown, and choose your language.
				</dd>
				<dd>
					3. The language you choose is reflected on all the pages of the website.
				</dd>
			</dl></p>
			<p>&nbsp;</p>
			<p class = "description" align = "justify"><strong>Q. The language I want is not listed! What do I do?</strong></p>
			<p class = "description" align = "justify"><strong>A.</strong> The most common languages spoken are the only ones that are currently available on the website. However, if there is good demand for a specific language, then it will surely be reflected on BidEasy!</p>
			<p>&nbsp;</p>
		</div>
	</div>
	<!-- Body End. -->

	<!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
</body>
</html>