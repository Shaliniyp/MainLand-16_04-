<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0"); //prevents caching at the proxy server
%>
<%@page import="org.pk.hotel.constants.GlobalConstants"%>
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

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	padding: 0 4px;
}

.column {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
	max-width: 25%;
	padding: 0 4px;
}

.column img {
	margin-top: 8px;
	vertical-align: middle;
}

@media screen and (max-width: 800px) {
	.column {
		-ms-flex: 50%;
		flex: 50%;
		max-width: 50%;
	}
}

@media screen and (max-width: 600px) {
	.column {
		-ms-flex: 100%;
		flex: 100%;
		max-width: 100%;
	}
}

.myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
	background: none;
}

.myImg:hover {
	opacity: 0.7;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}

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

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #c79559;
}

.button2:hover {
	background-color: #c79559;
	color: white;
}

.modal-content {
	margin: auto;
	display: block;
	width: 75%;
	height: 60%;
	max-width: 700px;
}

#caption {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

.modal-content, #caption {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

a.one:link {
	color: #ff0000;
}

a.one:visited {
	color: #0000ff;
}

a.one:hover {
	font-size: 150%;
}

@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
}

div.ex2 {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.has-bg-img:after {
	content: '';
	background: url('./resources/images/111.jpeg') no-repeat center center
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
	/* opacity: 0.9; */ /* Here is your opacity */
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

			<h1
				style="font-family: Lucida Calligraphy; color: #c79559; font-size: 80px; margin-top: 190px; margin-left: 150px;">
				<u>Login</u>
			</h1>
			<div id="templatemo_content">
				<div id="templatemo_content_left"
					style="margin-top: -10px; height: 230px; width: 300px; margin-left: 150px;">
					<div class="templatemo_content_left_section">
						<h1
							style="text-align: center; color: #111110; border-bottom: 1px dashed white; font-family: Lucida Calligraphy;">
							<i class="fas fa-praying-hands"
								style="font-size: 30px; padding: 5px; color: white"><a
								class="one" href="index.html"
								style="color: white; font-weight: bold; font-family: Lucida Calligraphy;">Welcome</i></a>
						</h1>
						<i class="fa fa-home"
							style="font-size: 30px; padding: 5px; color: white;"><a
							class="one" href="HomePage.html"
							style="color: white; font-weight: bold;"> Home </a></i><br /> <i
							class="fa fa-users"
							style="font-size: 30px; padding: 5px; color: white;"> <a
							class="one" href="LoginPage.jsp"
							style="color: white; font-weight: bold;">Login </a></i><br /> <i
							class="fa fa-info-circle"
							style="font-size: 30px; padding: 5px; color: white;"><a
							class="one" href="AboutUs.html"
							style="color: white; font-weight: bold;">About Us</a></i><br /> <i
							class="fa fa-envelope"
							style="font-size: 30px; padding: 5px; color: white;"><a
							class="one" href="ContactUs.html"
							style="color: white; font-weight: bold;">Contact Us </a> </i><br />
					</div>

				</div>
				<form action="control?action=login" method="post">

					<p
						style="width: 150%; margin-left: -1000px; color: #c79559; margin-top: 20px; padding: 20px; font-family: Lucida Calligraphy; font-weight: bold; font-size: 20px;">
						<%
						if (!GlobalConstants.MESSAGE.equals("") && GlobalConstants.MESSAGE != null) {
							out.write("<tr><td colspan='9' align='center' style='color:white;visibility:visible;margin-left:620px;'> "
									+ GlobalConstants.MESSAGE + " </td></tr>");
							GlobalConstants.MESSAGE = "";
						}
					%>
					</p>
					<div>
						<table
							style="width: 40%; padding: 30px; margin-left: 200px; color: black; font-weight: bold;">

							<tr>
								<td
									style="margin-left: 200px; color: #c79559; font-size: 30px; font-family: Lucida Calligraphy; margin-top: 10px;">Table</td>
								<td><input type="text" name="userName" id="userName"
									style="height: 25px; width: 300px; margin-left: 80px;" /></td>
							</tr>
						</table>
					</div>
					<div>
						<table
							style="width: 40%; margin: 30px; padding: 30px; margin-left: 450px; color: black; font-weight: bold;">
							<tr>
								<td
									style="margin-left: 450px; color: #c79559; font-size: 30px; font-family: Lucida Calligraphy; margin-top: 10px;">Password</td>
								<td><input type="password" name="pass" id="pass"
									style="height: 25px; width: 300px;" /></td>
							</tr>
						</table>
					</div>
					<div>
						<table
							style="width: 40%; margin: 30px; padding: 30px; margin-left: 280px; margin-top: 10px; color: black; font-weight: bold;">
							<tr>
								<td align="center"><input class="button button1"
									type="submit" value="Login"
									style="margin-top: -50px; margin-left: 270px; font-weight: bold;" />
									<input class="button button2" type="reset"
									style="margin-top: -60px; margin-left: 550px; font-weight: bold;" /></td>
							</tr>
						</table>
					</div>
				</form>
				<!-- end of content left -->
				<!-- end of content right -->
				<div class="cleaner_with_height">&nbsp;</div>
			</div>

		</div>
	</div>

</body>
</html>