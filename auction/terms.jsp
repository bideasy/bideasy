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
	<title>Terms - BidEasy</title>
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
	<div id = "terms_container">
		<div id = "terms_wrapper">
			<h2 class = "terms_title">BidEasy Terms of Use</h2>
			<p>&nbsp;</p>
			<p class = "terms_desc" align = "justify">
				Your use of the Website and services and tools are governed by the following terms and conditions (<strong>"Terms of Use"</strong>) as applicable to the Website including the applicable policies which are incorporated herein by way of reference. If You transact on the Website, You shall be subject to the policies that are applicable to the Website for such transaction.
			</p>

			<p class = "terms_desc" align = "justify">
				When You use any of the services provided by Us through the Website, including but not limited to, (e.g. Product Reviews, Seller Reviews), You will be subject to the rules, guidelines, policies, terms, and conditions applicable to such service, and they shall be deemed to be incorporated into this Terms of Use and shall be considered as part and parcel of this Terms of Use. We reserve the right, at Our sole discretion, to change, modify, add or remove portions of these Terms of Use, at any time without any prior written notice to You. It is Your responsibility to review these Terms of Use periodically for updates / changes. Your continued use of the Website following the posting of changes will mean that You accept and agree to the revisions. As long as You comply with these Terms of Use, We grant You a personal, non-exclusive, non-transferable, limited privilege to enter and use the Website.
			</p>

			<p class = "terms_desc" align = "justify">
				 <strong>ACCESSING, BROWSING OR OTHERWISE USING THE SITE INDICATES YOUR AGREEMENT TO ALL THE TERMS AND CONDITIONS UNDER THESE TERMS OF USE, SO PLEASE READ THE TERMS OF USE CAREFULLY BEFORE PROCEEDING.</strong>
			</p>
			<p>&nbsp;</p>

			<p class = "terms_desc" align = "justify">
				<strong>Membership Eligibility</strong>
				<p class = "terms_desc" align = "justify">
					Use of the Website is available only to persons who can form legally binding contracts under Indian Contract Act, 1872. Persons who are "incompetent to contract" within the meaning of the Indian Contract Act, 1872 including minors, un-discharged insolvents etc. are not eligible to use the Website. If you are a minor i.e. under the age of 18 years, you shall not register as a User of the BidEasy website and shall not transact on or use the website. As a minor if you wish to use or transact on website, such use or transaction may be made by your legal guardian or parents on the Website.
				</p>
			</p>

			<p class = "terms_desc" align = "justify">
				<strong>Your Account and Registration Obligations</strong>
				<p class = "terms_desc" align = "justify">
					If You use the Website, You shall be responsible for maintaining the confidentiality of your Display Name and Password and You shall be responsible for all activities that occur under your Display Name and Password. You agree that if You provide any information that is untrue, inaccurate, not current or incomplete or We have reasonable grounds to suspect that such information is untrue, inaccurate, not current or incomplete, or not in accordance with the this Terms of Use, We shall have the right to indefinitely suspend or terminate or block access of your membership on the Website and refuse to provide You with access to the Website.
				</p>
			</p>

			<p class = "terms_desc" align = "justify">
				<strong>Communications</strong>
				<p class = "terms_desc" align = "justify">
					When You use the Website or send emails or other data, information or communication to us, You agree and understand that You are communicating with Us through electronic records and You consent to receive communications via electronic records from Us periodically and as and when required. We may communicate with you by email or by such other mode of communication, electronic or otherwise.
				</p>
			</p>

			<p class = "terms_desc" align = "justify">
				<strong>Platform for Transaction and Communication</strong>
				<p class = "terms_desc" align = "justify">
					The Website is a platform that Users utilize to meet and interact with one another for their transactions. BidEasy is not and cannot be a party to or control in any manner any transaction between the Website's Users.
				</p>
			</p>

			<p class = "terms_desc" align = "justify">
				<strong>Terms:</strong>
				<p class = "terms_desc" align = "justify">
					1. All commercial/contractual terms are offered by and agreed to between Buyers and Sellers alone. The commercial/contractual terms include without limitation price, shipping costs, payment methods, payment terms, date, period and mode of delivery, warranties related to products and services and after sales services related to products and services. BidEasy does not have any control or does not determine or advise or in any way involve itself in the offering or acceptance of such commercial/contractual terms between the Buyers and Sellers.
					<br/><br/>
					2. BidEasy does not make any representation or Warranty as to specifics (such as quality, value, salability, etc) of the products or services proposed to be sold or offered to be sold or purchased on the Website. BidEasy does not implicitly or explicitly support or endorse the sale or purchase of any products or services on the Website. BidEasy accepts no liability for any errors or omissions, whether on behalf of itself.
					<br/><br/>
					3. BidEasy is not responsible for any non-performance or breach of any contract entered into between Buyers and Sellers. BidEasy cannot and does not guarantee that the concerned Buyers and/or Sellers will perform any transaction concluded on the Website. BidEasy shall not and is not required to mediate or resolve any dispute or disagreement between Buyers and Sellers.
					<br/><br/>
					4. BidEasy does not make any representation or warranty as to the item-specifics (such as legal title, creditworthiness, identity, etc) of any of its Users. You are advised to independently verify the bona fides of any particular User that You choose to deal with on the Website and use Your best judgment in that behalf.
					<br/><br/>
					5. BidEasy does not at any point of time during any transaction between Buyer and Seller on the Website come into or take possession of any of the products or services offered by Seller nor does it at any point gain title to or have any rights or claims over the products or services offered by Seller to Buyer. 
					<br/><br/>
					6. At no time shall BidEasy hold any right, title or interest over the products nor shall BidEasy have any obligations or liabilities in respect of such contract entered into between Buyers and Sellers. BidEasy is not responsible for unsatisfactory or delayed performance of services or damages or delays as a result of products which are out of stock, unavailable or back ordered.
					<br/><br/>
					7. The Website is only a platform that can be utilized by Users to reach a larger base to buy and sell products or services. BidEasy is only providing a platform for communication and it is agreed that the contract for sale of any of the products or services shall be a strictly bipartite contract between the Seller and the Buyer.
					<br/>
					At no time shall BidEasy hold any any right, title or interest over the products nor shall BidEasy have any obligations or liabilities in respect of such contract.
					BidEasy is not responsible for unsatisfactory or delayed performance of services or damages or delays as a result of products which are out of stock, unavailable or back ordered.
					<br/><br/>
					8. You shall independently agree upon the manner and terms and conditions of delivery, payment, insurance etc. with the seller(s) that You transact with.
					<br/><br/>
					9. BidEasy cannot take responsibility or control the information provided by other Users which is made available on the Website. Please use caution and practice safe trading when using the Website. Please note that there could be risks in dealing with underage persons or people acting under false pretence.
				</p>
			</p>

			<p class = "terms_desc" align = "justify">
				<strong>Charges</strong>
				<p class = "terms_desc" align = "justify">
					Membership on the Website is free for buyers. BidEasy does not charge any fee for browsing and buying on the Website. BidEasy reserves the right to change its Fee Policy from time to time. In particular, BidEasy may at its sole discretion introduce new services and modify some or all of the existing services offered on the Website. In such an event BidEasy reserves the right to introduce fees for the new services offered or amend/introduce fees for existing services, as the case may be. Changes to the Fee Policy shall be posted on the Website and such changes shall automatically become effective immediately after they are posted on the Website. Unless otherwise stated, all fees shall be quoted in Indian Rupees.
				</p>
			</p>

			<p class = "terms_desc" align = "justify">
				<strong>Use of the Website</strong>
				<p class = "terms_desc" align = "justify">
					You agree, undertake and confirm that Your use of Website shall be strictly governed by the following binding principles:
					<br/><br/>
					1. You shall not host, display, upload, modify, publish, transmit, update or share any information which:
					<dl class = "terms_desc">
						<dd>
							(a) belongs to another person and to which You does not have any right to;<br/>
							(b) is misleading in any way.<br/>
							(c) is patently offensive to the online community, such as sexually explicit content, or content that promotes racism, bigotry, hatred or physical harm of any kind against any group or individual.<br/>
							(d) harasses or advocates harassment of another person.<br/>
							(e) promotes illegal activities or conduct that is abusive, threatening, obscene, defamatory or libellous.<br/>
							(g) infringes upon or violates any third party's rights [including, but not limited to, intellectual property rights, rights of privacy (including without limitation unauthorized disclosure of a person's name, email address, physical address or phone number) or rights of publicity.<br/>
							(h) promotes an illegal or unauthorized copy of another person's copyrighted work (see "Copyright complaint" below for instructions on how to lodge a complaint about uploaded copyrighted material), such as providing pirated computer programs or links to them, providing information to circumvent manufacture-installed copy-protect devices, or providing pirated music or links to pirated music files.<br/>
							(i) impersonate another person.
						</dd>
					</dl>
				</p>
				<p class = "terms_desc" align = "justify">
					2. You shall not attempt to gain unauthorized access to any portion or feature of the Website, or any other systems or networks connected to the Website or to any server, computer, network, or to any of the services offered on or through the Website, by hacking, password "mining" or any other illegitimate means.
				</p>
				<p class = "terms_desc" align = "justify">
					3. You agree not to use any device, software or routine to interfere or attempt to interfere with the proper working of the Website or any transaction being conducted on the Website, or with any other person's use of the Website.
				</p>
				<p class = "terms_desc" align = "justify">
					4. From time to time, You shall be responsible for providing information relating to the products or services proposed to be sold by You. In this connection, You undertake that all such information shall be accurate in all respects. You shall not exaggerate or over emphasize the attributes of such products or services so as to mislead other Users in any manner.
				</p>
				<p class = "terms_desc" align = "justify">
					5. You shall not make any negative, denigrating or defamatory statement(s) or comment(s) about Us or the brand name or domain name used by us or otherwise engage in any conduct or action that might tarnish the image or reputation, of BidEasy or sellers on platform or otherwise tarnish or dilute any BidEasy's trade or service marks, trade name and/or goodwill associated with such trade or service marks, trade name as may be owned or used by us.
				</p>
			</p>
		</div>
	</div>
	<!-- /Body -->
	
	<!-- Global Footer include -->
	<jsp:include page="footer.jsp" />
	<!-- Global Footer End. -->
</body>
</html>