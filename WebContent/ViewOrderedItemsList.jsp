<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.pk.hotel.beans.OrderDetails"%>
<%@page import="org.pk.hotel.constants.GlobalConstants"%>
<%@page import="org.pk.hotel.beans.OrderMaster.OrderStatus"%>
<%@page import="org.pk.hotel.beans.OrderMaster.OrderStatus"%>
<%@page import="org.pk.hotel.beans.OrderMaster"%>
<%@page import="org.pk.hotel.dao.CookServices"%>
<%@page import="java.util.ArrayList"%>
<%
ArrayList<OrderDetails> orders = null;
	if(request.getParameter("orderId") != null )
	 orders = new CookServices().getAllItems(Integer.parseInt(request.getParameter("orderId")));
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



body,html {
	margin: 0;
	font-family: Arial;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	width:100%;
 	height:100%;
  	overflow: hidden;
} 

a.one:link {
	color:#b5cb7e;
}

a.one:visited {
	color: #b5cb7e;
}

a.one:active{
	color: #e04229d6;

}
a.one:hover {
	font-size: 150%;
	color: #e04229d6;
}
div.ex2 {
 width:100%;
 height:100%;
  overflow: hidden;
}

.has-bg-img:after {
    content:'';
    background: url('./resources/images/555.jpg') no-repeat center center fixed;
    position: absolute;
    top:0px;
    left: 0px;
   -webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
    min-width:1600px;
    min-height:100%;
    z-index:-1;
    /* opacity: 0.9; */ /* Here is your opacity */
}
.has-bg-img {
    position: relative;
    width:100%;
    height:100%;
    padding:50px;
    font-weight:bold;
    text-align:center;
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


.rainbow {
background-image: -webkit-gradient( linear, left top, right top, color-stop(0, #332612), color-stop(0.15, #FF5722), color-stop(0.3, #FF5722), color-stop(0.45, #e4e4e4), color-stop(0.6, #ffffff),color-stop(0.75, #29d030), color-stop(0.9, #4CAF50), color-stop(1, #0f1d00) );  color:transparent;
  -webkit-background-clip: text;
  background-clip: text;
}
</style>
</head>
<body>

<div class="ex2">
	<div class="has-bg-img" style="height:900%;">
	
	<h1 align="center"
				style="font-size: 40px;font-family:Algerian; margin-left:-1330px; margin-top:-30px; color:#fec04f;"> 
				Mainland 	</h1>
				
				<h1 style=";color:#290b0be3;font-size: 40px;margin-top:20px;margin-left:-1260px;"><span class="rainbow">India</span></h1>
			
			<h1 style="font-family:Mistral;color:#c79559; font-size:60px;margin-top:-30px;margin-left:-490px;"> Serving YOU...<br/><br/> </h1>
<h1 style="font-family:Mistral;color:#c79559; font-size:60px;margin-top:20px;margin-left:260px;">The PLEASURE of VARIETY on your plate..!!!</h1>
		
	<a href="ViewCategory.jsp" style="font-family:Lucida Calligraphy;font-weight:bold;font-size:30px;height:5px;margin-top:-410px;margin-left:1200px;"> Back</a>
			
		<div id="templatemo_content">

			<div id="templatemo_content_left" style="margin-top: 150px; margin-left:-50px;height: 200px;width:300px;">
				<jsp:include page="Menu.jsp" />
			</div>


			<div style="width: 100%;margin-top:-180px;">
		
				<table
						style="width: 70%;margin-left: 300px;background:black;opacity:0.65;border:1px solid white; color:#ffae17;margin-top: 160px; padding: 20px;font-family:Lucida Calligraphy; font-weight:bold; font-size:20px;">
					<%
								if (!GlobalConstants.MESSAGE.equals("")
										&& GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
							%>
					<% if(orders.size() != 0 && orders != null) {%>
					<tr>
						<th><u>Sr No</u></th>
						<th><u>Table No</u></th>
						<th><u>Order Id</u></th>
						<th><u>Item Name</u></th>
						<th><u>Quantity</u></th>
						<th><u>Actual Status</u></th>
					</tr>
					<% for(int i=0;i<orders.size();i++)
						{
							OrderDetails om = orders.get(i);
						%>
					<form action="cook?action=updateItemtatus" method="post"><br/><br/>
						<tr>
							<td><br/><%=i+1 %><br/><br/></td>
							<td><%=om.getTableNo() %></td>
							<td><%=om.getId() %> <input type="hidden" name="orderId"
								value="<%= om.getId()%>" /> <input type="hidden" name="itemId"
								value="<%=om.getItemId() %>" /></td>
							<td><%=om.getItemName() %></td>
							<td><%=om.getItemQnt() %></td>
							<td><%=om.getOrderStat().name() %></td>
						</tr>
					</form>
					<%}
						} else {%>
				
<h1 style="color:white; font-size:40px;font-family:Algerian;margin-top:100px;margin-left:-450px;">There are no Orders Available</h1>					
					<%} %>
				</table>

				<div class="cleaner_with_height">&nbsp;</div>

			
			</div>
							

			<div class="cleaner_with_height">&nbsp;</div>
		</div>
		</div>
		</div>
		
</body>
</html>