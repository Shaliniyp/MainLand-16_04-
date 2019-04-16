<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.pk.hotel.dao.UserService"%>
<%@page import="org.pk.hotel.beans.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.pk.hotel.constants.GlobalConstants"%>
<%
	ArrayList<Item> itms = new UserService().viewAllItems();
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
    background: url('./resources/images/pump.jpg') no-repeat center center fixed;
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
     /* opacity: 0.7;   */ /* Here is your opacity */
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
				style="font-size: 40px; font-family: Algerian; margin-left: -1330px; margin-top: -30px; color: #fec04f;">
				Mainland</h1>

			<h1
				style="color: #290b0be3; font-size: 40px; margin-top: 20px; margin-left: -1260px;">
				<span class="rainbow">India</span>
			</h1>
		<div id="templatemo_content">

			<div id="templatemo_content_left" style="margin-top: 180px; height: 230px; width: 300px; margin-left:-40px;color:white;">
				<jsp:include page="Menu.jsp" />
			</div>
			<!-- end of content left -->
			<!-- end of content left -->

			<div id="templatemo_content_right">
					<h1 style="font-family:Mistral;color:WHITE; font-size:100px;margin-top:-30px;margin-left:-700px;"><u>Me-N-U</u></h1>
					<form action="cook?action=viewAllItems" method="post">
						<table width="100%"  style="margin-left:-350px;font-family:Lucida Calligraphy;margin-top:50px;color:#ee8282;background:black;opacity:0.65;border:1px solid white;">
							<%
								if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
							%>
							<tr>
								<th style="font-size: 17px;"><u><b>Sr No<br/><br/></b></u></th>
								<th style="font-size: 17px;"><u><b>Category<br/><br/></b></u></th>
								<th style="font-size: 17px;"><u><b>Item<br/><br/></b></u></th>
								<th style="font-size: 17px;"><u><b>Quantity<br/><br/></b></u></th>
								<th style="font-size: 17px;"><u><b>Cost<br/><br/></b></u></th>
							</tr>
							<%
									if(true){
									for (int i = 0; i < itms.size(); i++) {
										Item itm = itms.get(i);
							%>
							 <tr>
								<td style="font-size: 15px;"><%=i + 1%></td>
								<td style="font-size: 15px;"><%=itm.getCatname()%></td>
								<td style="font-size: 15px;"><%=itm.getItemName()%></td>
							    <td style="font-size: 15px;"><%=itm.getQnt()%></td>
							    <td style="font-size: 15px;"><%=itm.getCost()%></td>

								</td>
							</tr>
							<%
								}
								}
							%>
						</table>

					</form>
				</div>
				<div class="cleaner_with_height">&nbsp;</div>

				<a href="subpage.html"></a>
			</div>
			<!-- end of content right -->

			<div class="cleaner_with_height">&nbsp;</div>
		</div>
	


		</div>
</body>
</html>