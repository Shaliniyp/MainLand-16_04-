<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.awt.print.Book"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="org.pk.hotel.beans.Login"%>
<%@page import="org.pk.hotel.beans.OrderMaster.OrderStatus"%>
<%@page import="org.pk.hotel.dao.CookServices"%>
<%@page import="org.pk.hotel.beans.OrderMaster"%>
<%@page import="org.pk.hotel.beans.Item"%>
<%@page import="org.pk.hotel.beans.Category"%>
<%@page import="org.pk.hotel.dao.UserService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.pk.hotel.constants.GlobalConstants"%>
<%! 
boolean isLastOrderDeliverd = Boolean.FALSE;
boolean isLongTime = Boolean.FALSE;

%>

<%
Login l = (Login) session.getAttribute(GlobalConstants.USER);
ArrayList<OrderMaster> orders = new UserService().getAllOrders(Integer.parseInt(l.getUserName()));
//System.out.println("isLastOrderDeliverd - "+isLastOrderDeliverd+" isLongTime - "+isLongTime);
if(isLastOrderDeliverd)
{
	//System.out.println("in isLastOrderDeliverd ");
	
	if(session.getAttribute("isLastOrdered") == null && session.getAttribute("time" ) == null)
	{
		//session.setAttribute("isLastOrdered", isLastOrderDeliverd);	
		session.setAttribute("time", new Date());
		System.out.println("session set");
	}
	
}

if(session.getAttribute("isLastOrdered") != null && session.getAttribute("time") != null)
{	
	//System.out.println("is "+session.getAttribute("isLastOrdered")+" time = "+session.getAttribute("time"));
	
	Date date = (Date) session.getAttribute("time");
	Date update = new Date();
	//System.out.println("date is = " + date.getTime() +"      "+update.getTime());
	
	long diff = date.getTime() - update.getTime();
	 
	long diffSeconds = diff / 1000 % 60;
	long diffMinutes = diff / (60 * 1000) % 60;
	long diffHours = diff / (60 * 60 * 1000) % 24;
	long diffDays = diff / (24 * 60 * 60 * 1000);

	//System.out.print(diffDays + " days, ");
	//System.out.println(diffHours + " hours, ");
	//System.out.println(diffMinutes + " minutes, ");
	//System.out.println(diffSeconds + " seconds.");
	if(diffHours >= -1)
	{
		//System.out.println("your time is over");
		isLongTime = Boolean.TRUE;
	}

}
else
{ 
	System.out.println("some values are null");
	session.setAttribute("time", null);
	session.setAttribute("isLastOrdered", null);
}
	
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta content="5" http-equiv="refresh" />
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
    background: url('./resources/images/orderwhat.jpg') no-repeat center center fixed;
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
			
			<h1 style="font-family:Mistral;color:#c79559; font-size:60px;margin-top:90px;margin-left:-100px;"> Beyond the boundaries of TASTE...<br/><br/> </h1>
<h1 style="font-family:Mistral;color:#c79559; font-size:60px;margin-top:20px;margin-left:190px;">Experience the GREAT FOOD</h1>
		

		<div id="templatemo_content">

			<div id="templatemo_content_left" style="margin-top: 80px; margin-left:-50px;height: 200px;width:300px;">
				<jsp:include page="Menu.jsp" />
			</div>
			<div id="templatemo_content_right"><br/><br/>
				<table style="width: 150%;margin-left: -500px; color:#ffae17;margin-top: 50px; padding: 20px;font-family:Lucida Calligraphy; font-weight:bold; font-size:20px;">
					<%
								if (!GlobalConstants.MESSAGE.equals("")
										&& GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
								if(isLongTime)
									{%>
									<span style="text-decoration:blink;font-size: large; color: red"> Your time is Over please free this table for other Customers </span>
							<%}%>
					<% if(orders.size() != 0 && orders != null) {%>
					<tr style="background:black;opacity:0.65;border:1px solid white;">
						<th><u>Sr No</u></th>
						<th><u>Table No</u></th>
						<th><u>Name</u></th>
						<th><u>Status</u></th>
					</tr>
					<% for(int i=0;i<orders.size();i++)
						{
							OrderMaster om = orders.get(i);
						%>
					<tr style="background:black;opacity:0.65;border:1px solid white;">
						<td><br/><%=i+1 %> <input type="hidden" name="orderId"
							value="<%= om.getId()%>" /><br/><br/></td>
						<td><%=om.getTableNo() %></td>
						<td><a
							href="ViewOrderedItemsList.jsp?orderId=<%=om.getId() %>"><%=om.getOrderName() %>
						</a></td>
						<td><%=om.getOrderStat().name() %></td>
						<% if(om.getOrderStat().name().equals(OrderMaster.OrderStatus.DELIVERED.name())) 
							{isLastOrderDeliverd = Boolean.TRUE;} else {isLastOrderDeliverd = Boolean.FALSE;}
							%>
					</tr>
					<%}
						} else {%>
					<tr>
<!-- 						<td style="font-size: 30px;font-family:Algerian;color:white;margin-left:-300px;margin-top:150px;">There are no Orders Available</td>
 -->					
 <h1 style="color:white; font-size:40px;font-family:Algerian;margin-top:100px;margin-left:-650px;">There are no Orders Available</h1>
 </tr>
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