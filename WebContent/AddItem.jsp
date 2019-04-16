<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.pk.hotel.constants.GlobalConstants"%>
<%@page import="org.pk.hotel.dao.CookServices"%>
<%@page import="org.pk.hotel.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Category> cats = new CookServices().getAllCategorys();
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
	background-color: #c79559; /* Green */
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
	border: 2px solid #c79559;
}

.button1:hover {
	background-color: #c79559;
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
	background: url('./resources/images/c4.jpg') no-repeat center center
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
	/* opacity: 0.7;   */ /* Here is your opacity */
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
				<!-- end of content left -->

				<div id="templatemo_content_right">

					<h1
						style="font-family: Mistral; color: WHITE; font-size: 100px; margin-top: -30px; margin-left: -100px;">Add
						Item</h1>
					<form action="cook?action=addItem" method="post">
						<p
							style="width: 150%; margin-left: -400px; color: white; margin-top: 100px; padding: 20px; font-family: Lucida Calligraphy; font-weight: bold; font-size: 20px;">


							<%
								if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
									out.write("<tr><td colspan='3' align='center' style=''color:white;visibility:visible'> "
											+ GlobalConstants.MESSAGE + " </td></tr>");
									GlobalConstants.MESSAGE = "";
								}
							%>
						</p>
						<table width="100%"
							style="margin-left: -150px; margin-top: 50px;">

							<tr>
								<td width="100%"
									style="color: white; font-family: Lucida Calligraphy; font-size: 30px;"><br />
								<br />
								<u>Item</u></td>
								<td><br />
								<br />
								<input type="text" name="itemName" size="22" /></td>
							</tr>


							<tr>
								<td width="100%"
									style="color: white; font-family: Lucida Calligraphy; font-size: 30px;"><br />
								<br />
								<u>Category </u></td>
								<td><br />
								<br />
								<select style="size: 30" name="categoryId">

										<option>-- Select --</option>
										<%
											if (cats != null && cats.size() != 0) {
												for (int i = 0; i < cats.size(); i++) {
													Category cat = cats.get(i);
										%>
										<option value="<%=cat.getId()%>">
											<%=cat.getCategoryName()%></option>
										<%
											}
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td width="100%"
									style="color: white; font-family: Lucida Calligraphy; font-size: 30px;"><br />
								<br />
								<u>Quantity</u></td>
								<td><br />
								<br />
								<input type="number" name="qnt" size="30" min="0" /></td>
							</tr>
							<tr>
								<td width="100%"
									style="color: white; font-family: Lucida Calligraphy; font-size: 30px;"><br />
								<br />
								<u>Cost</u></td>
								<td><br />
								<br />
								<input type="text" name="cost" size="22" /></td>
							</tr>
							<tr>
								<td colspan="2" width="40%"><br />
								<br />
								<input class="button button1" type="submit" value="Add"
									style="margin-left: 150px;" /> <input class="button button1"
									type="reset" /></td>

							</tr>
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