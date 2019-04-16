<%@page import="java.util.Date"%>
<%@page import="org.pk.hotel.constants.GlobalConstants"%>
<%@page import="org.pk.hotel.beans.Login"%>
<%
	Login login = (Login) session.getAttribute(GlobalConstants.USER);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Restaurant E-menu System</title>
<link href="resources/css/css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	type="text/css" />
<style>
a.one:link {
	color: #ff0000;
}

a.one:visited {
	color: #0000ff;
}

a.one:hover {
	font-size: 150%;
}
</style>
</head>
<body>
	<div class="templatemo_content_left_section">
		<h1
			style="text-align: center;  color: white; border-bottom: 1px dashed white; font-family: Lucida Calligraphy; font-size: 30px;">WELCOME</h1>
		
		<p style="color: white; font-size:15px;font-weight: bold;">
			<%=new Date()%>
			<br /><br/>

		</p>
		<i class="fas fa-praying-hands" style="font-size: 30px; padding: 5px; color: white;">
		<a class="one" href="UserHome.jsp" style="color: white; font-weight: bold;"> Hello,<%=login.getUserName()%></a><br /></i>
		<%
			if (login.getUserName().equals("cook")) {
		%>
		<i class="fas fa-plus-square"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="AddCategory.jsp"
			style="color: white; font-weight: bold;"> Category </a><br /></i> <i
			class="fas fa-plus-square"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="AddItem.jsp"
			style="color: white; font-weight: bold;"> Add Item </a><br /></i>
			
				<i class="far fa-eye"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="ViewAllItems.jsp"
			style="color: white; font-weight: bold;"> View Items</a><br /></i> 
			
			 <i
			class="fa fa-trash"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="DeleteAnItem.jsp"
			style="color: white; font-weight: bold;"> Delete Item </a><br /></i> <i
			class="far fa-eye"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="ViewOrder.jsp"
			style="color: white; font-weight: bold;"> View Order </a><br /></i> <i
			class="fas fa-file-invoice"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="ViewBillToCook.jsp"
			style="color: white; font-weight: bold;"> View Bill </a> <br /></i> <i
			class="fas fa-sign-out-alt"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="LoginPage.jsp"
			style="color: white; font-weight: bold;"> Log Out </a><br /></i>
		<%
			} else {
		%>

		<i class="fas fa-utensils"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="ViewCategory.jsp"
			style="color: white; font-weight: bold;">Place Order</a><br /></i> <i
			class="far fa-clock"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="OrderStatus.jsp"
			style="color: white; font-weight: bold;">Status </a> <br /></i> <i
			class="fas fa-file-invoice"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="ViewBill.jsp"
			style="color: white; font-weight: bold;"> View Bill </a><br /></i> <i
			class="fas fa-sign-out-alt"
			style="font-size: 30px; padding: 5px; color: white;"> <a
			class="one" href="LoginPage.jsp"
			style="color: white; font-weight: bold;"> Log Out </a><br /></i>
		<%
			}
		%>

	</div>
</body>
</html>