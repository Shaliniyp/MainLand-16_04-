<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.pk.hotel.beans.Login"%>
<%@page import="org.pk.hotel.beans.OrderMaster"%>
<%@page import="org.pk.hotel.beans.Item"%>
<%@page import="org.pk.hotel.beans.Category"%>
<%@page import="org.pk.hotel.dao.UserService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.pk.hotel.constants.GlobalConstants"%>
<%
	ArrayList<Item> cats = null;
	Login login = (Login) session.getAttribute(GlobalConstants.USER);
	if (request.getParameter("catId") != null)
		cats = new UserService().getAllItems(Integer.parseInt(request.getParameter("catId")));
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Restaurant E-menu System</title>
<link href="resources/css/css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	type="text/css" />
<style>
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

.button {
  background-color:#c79559; /* Green */
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
  background-color:white; 
  color: black; 
  border: 2px solid #c79559;
}

.button1:hover {
  background-color:#c79559;
  color: white;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #c79559;
}

.button2:hover {
  background-color:#c79559;
  color: white;
}

div.ex2 {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.has-bg-img:after {
	content: '';
	background: url('./resources/images/Invert.jpg') no-repeat center center
		fixed;
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
	/* opacity: 0.85; */ /* Here is your opacity */
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
			<h1 style="font-family:Mistral;color:WHITE; font-size:100px;margin-top:80px;margin-left:-400px;">Chase the FLAVORS...!!!<br/><br/> </h1>


			<div id="templatemo_content">

				<div id="templatemo_content_left"
					style="margin-top: 90px; margin-left: -75px; height: 200px; width: 300px;">
					<jsp:include page="Menu.jsp" />
				</div>
				
				<div id="templatemo_content_right">
				<p style="width: 150%;margin-left: -200px; color:#ffae17;margin-top: 20px; padding: 20px;font-family:Lucida Calligraphy; font-weight:bold; font-size:20px;"><%
								if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
							%></p>
					<form action="cook?action=makeOrder" method="post"><br/><br/>
						
						<pre style="margin-top: -10px; margin-left: -750px; font-size: 35px;color:white;font-family:Lucida Calligraphy;"><u>Order Name </u><input
						type="text" name="orderName" value="" style="height:30px;width:250px;"/> <input type="hidden"
						name="tableNo" value="<%=Integer.parseInt(login.getUserName())%>" /> <input class="button button1"
						type="submit" value="Order" style="font-weight:bold;font-size:20px;"/> <input type="reset" class="button button1" style="font-weight:bold;font-size:20px;"/> <a href="ViewCategory.jsp" class="button button1" style="color:black;font-weight:bold;font-size:20px;height:5px;"> Back</a> </pre>
						
						
						<table
							style="width: 150%;margin-left: -500px;background:black;opacity:0.65;border:1px solid white; color:#ffae17;margin-top: 20px; padding: 20px;font-family:Lucida Calligraphy; font-weight:bold; font-size:20px;">
							
							<tr>
								<th><u>Sr No</u></th>
								<th><u>Name</u></th>
<!-- 								<th>Quantity</th>
 -->								<th><u>Cost</u></th>
								<th><u>Order Quantity</u></th>
								<th><u>Confirm</u></th>
							</tr>
							<%
								if (cats != null && cats.size() != 0) {
									for (int i = 0; i < cats.size(); i++) {
										Item cat = cats.get(i);
							%>
							<tr>
								<td><br/><%=i + 1%> <br/><br/></td>
								<input type="hidden" name="catId"
									value="<%=request.getParameter("catId")%>" />
								<input type="hidden" name="status"
									value="<%=OrderMaster.OrderStatus.JUST_ORDERED.name()%>" />
								<td><%=cat.getItemName()%></td>
<%-- 								<td><%=cat.getQnt()%></td>
 --%>								<td><%=cat.getCost()%></td>
								<td><input type="number" min="0" name="orderQnt" /></td>
								<td><input type="checkbox" name="ItemId"
									value="<%=cat.getId()%>" /></td>
							</tr>
							<%
								}
								}
							%>
						</table>
						
					</form>
					
					<div class="cleaner_with_height">&nbsp;</div>

					
				</div>
				<!-- end of content right -->

				<div class="cleaner_with_height">&nbsp;</div>
			</div>
		</div>
	</div>


</body>
</html>