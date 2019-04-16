<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.pk.hotel.beans.Login"%>
<%@page import="org.pk.hotel.beans.BillDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.pk.hotel.dao.UserService"%>
<%@page import="org.pk.hotel.constants.GlobalConstants"%>
<%
	UserService uService = new UserService();
	String tblNo = "0";
	if (request.getParameter("tableNo") != null) {
		tblNo = request.getParameter("tableNo");
	}

	ArrayList<BillDetails> bDetails = uService.getBill(Integer.parseInt(tblNo));
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- <meta content="5" http-equiv="refresh" /> -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Restaurant E-menu System</title>
<link href="resources/css/css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	type="text/css" />
<style>
.button {
	background-color: #ee8282; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #ee8282;
}

.button1:hover {
	background-color: #ee8282;
	color: white;
}

body, html {
	margin: 0;
	font-family: Arial;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

a.one:link {
	color: #b5cb7e;
}

a.one:visited {
	color: #b5cb7e;
}

a.one:active {
	color: #e04229d6;
}

a.one:hover {
	font-size: 150%;
	color: #e04229d6;
}

div.ex2 {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.has-bg-img:after {
	content: '';
	background: url('./resources/images/lastlast.jpeg') no-repeat center
		center fixed;
	position: absolute;
	top: 0px;
	left: 0px;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	min-width: 1600px;
	min-height: 100%;
	z-index: -1;
	/*   opacity: 0.5;  */ /* Here is your opacity */
}

.has-bg-img {
	position: relative;
	width: 100%;
	height: 100%;
	padding: 50px;
	font-weight: bold;
	text-align: center;
}

.rainbow {
	background-image: -webkit-gradient(linear, left top, right top, color-stop(0, #332612),
		color-stop(0.15, #FF5722), color-stop(0.3, #FF5722),
		color-stop(0.45, #e4e4e4), color-stop(0.6, #ffffff),
		color-stop(0.75, #29d030), color-stop(0.9, #4CAF50),
		color-stop(1, #0f1d00));
	color: transparent;
	-webkit-background-clip: text;
	background-clip: text;
}
</style>
</head>
<body>

	<div class="ex2">
		<div class="has-bg-img" style="height: 900%;">

			<h1 align="center"
				style="font-size: 40px; font-family: Algerian; margin-left: -1330px; margin-top: -30px; color: #fec04f;">
				Mainland</h1>

			<h1
				style="color: #290b0be3; font-size: 40px; margin-top: 20px; margin-left: -1260px;">
				<span class="rainbow">India</span>
			</h1>
			<div id="templatemo_content">

				<div id="templatemo_content_left"
					style="margin-top: 180px; height: 230px; width: 300px; margin-left: -40px;">
					<jsp:include page="Menu.jsp" />
				</div>


				<div id="templatemo_content_right">
					<form action="ViewBillToCook.jsp" method="post">
						<h1
							style="font-family: Mistral; color: WHITE; font-size: 100px; margin-top: -30px; margin-left: -750px;">
							<u>View Bills</u>
						</h1>

						<table width="100%"
							style="margin-top: 100px; margin-left: -350px; border: 1px solid white; font-size: 35px; color: white; font-family: Lucida Calligraphy;">
							<tr>
								<td>TableNo</td>
								<td><br /> <br /> <select name="tableNo"
									style="width: 100px; margin-bottom: 20px; margin-left: 10px;">
										<option value="1">Table 1</option>
										<option value="2">Table 2</option>
										<option value="3">Table 3</option>
										<option value="4">Table 4</option>
										<option value="5">Table 5</option>
								</select></td>
							</tr>



						</table>


						<input class="button button1" type="submit"
							style="margin-top: 10px; margin-left: -500px; font-weight: bold; font-family: Lucida Calligraphy;" />
					</form>
					<%
						if (bDetails != null && !bDetails.isEmpty()) {
					%>



					<form action="cook?action=clear" method="post">
						<p
							style="margin-top: -200px;width:100%; margin-left: -200px; font-size: 25px; color: white; font-family: Lucida Calligraphy;">
							<%
								if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
										out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
												+ GlobalConstants.MESSAGE + " </td></tr>");
										GlobalConstants.MESSAGE = "";
									}
							%>


						</p>
						<input class="button button1" type="submit" value="Clear"
							name="cl"
							style="margin-left: -950px; margin-top: 130px; font-weight: bold; font-family: Lucida Calligraphy;" />
					</form>
					<p
						style="width: 150%; margin-left: -200px; color: white; margin-top: -30px; padding: 20px; font-family: Lucida Calligraphy; font-weight: bold; font-size: 20px;">
						<%
							if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
						%>
					</p>
					<table
						style="width: 150%; background:black;opacity:0.75;margin-left: -450px;margin-top:-10px; padding: 20px; border: 1px solid white; font-size:15px;font-family:Lucida Calligraphy;color: white;">

						<tr>
						
							<th><u style="font-size:20px;">Sr No</u></th>
							<th><u style="font-size:20px;">Order Name</u></th>
							<th><u style="font-size:20px;">Item Name</u></th>
							<th><u style="font-size:20px;">Item Cost</u></th>
							<!-- 							<th><u>Item Quantity</u></th>
 -->
							<th><u style="font-size:20px;">Order Quantity</u></th>
							<th><u style="font-size:20px;">Amount</u></th>
						</tr>
						<%
							double total = 0;
						%>
						<%
							for (int i = 0; i < bDetails.size(); i++) {
									BillDetails bd = bDetails.get(i);
						%>
						<tr>

							<td><br /><%=i + 1%><br />
							<br /></td>
							<td><%=bd.getOrderName()%></td>
							<td><%=bd.getItemName()%></td>
							<td><%=bd.getItemCost()%></td>
							<%-- 							<td><%=bd.getItemQnt()%></td>
 --%>
							<td><%=bd.getOrderQnt()%></td>
							<td><%=Double.parseDouble(bd.getItemCost()) * bd.getOrderQnt()%>
								<%
									total = (Double.parseDouble(bd.getItemCost()) * bd.getOrderQnt()) + total;
								%></td>
						</tr>
						<%
							}
						%>
						<tr>

							<td style="text-align: center; border-top: 1px solid white;font-size:20px;">Total</td>
							<td style="border-top: 1px solid white;"></td>
							<td style="border-top: 1px solid white;"></td>
							<td style="border-top: 1px solid white;"></td>
							<td style="border-top: 1px solid white;"></td>
							<td style="border-top: 1px solid white;font-size:20px;"><%=total%></td>

						</tr>
					</table>

					<%
						} else {
					%>
					<p
						style="color: white; margin-left: -350px; margin-top: 30px; font-size: 25px; font-family: Lucida Calligraphy;">There
						are no Bill Details available for table No</p>
					<p style="color: white; font-size: 30px;">



						<%=request.getParameter("tableNo")%>
						<%
							}
						%>



						<div class="cleaner_with_height">&nbsp;</div>
				</div>


				<div class="cleaner_with_height">&nbsp;</div>
			</div>
		</div>
	</div>
</body>
</html>