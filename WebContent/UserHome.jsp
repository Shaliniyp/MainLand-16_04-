<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0"); //prevents caching at the proxy server
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Restaurant E-menu System</title>
<link href="resources/css/css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" type="text/css" />

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

.myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

.myImg:hover {
	opacity: 0.7;
}

/* The Modal (background) */
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

/* Modal Content (Image) */
.modal-content {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
}

/* Caption of Modal Image (Image Text) - Same Width as the Image */
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

/* Add Animation - Zoom in the Modal */
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

/* The Close Button */
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

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
}

div.ex2 {
 width:100%;
 height:100%;
  overflow: hidden;
}

.has-bg-img:after {
    content:'';
    background: url('./resources/images/06.jpg') no-repeat center center fixed;
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
				style="font-size: 40px;font-family:Algerian; margin-left:-1330px; margin-top:-30px; color:#c39049;"> 
				Mainland 	</h1>
				
				<h1 style=";color:#290b0be3;font-size: 40px;margin-top:20px;margin-left:-1260px;"><span class="rainbow">India</span></h1>
			
		<div id="templatemo_content">
		<div id="templatemo_content_left"
			style="margin-top: 220px; height: 230px; width: 300px; margin-left:-40px;">
				<jsp:include page="Menu.jsp" />



			</div>
			<!-- end of content left -->

			<div id="templatemo_content_right">

<h1 style="font-family:Mistral;color:#c79559; font-size:80px;margin-top:60px;margin-left:-750px;"> Good FRIENDS..!!!<br/><br/> </h1>
<h1 style="font-family:Mistral;color:#c79559; font-size:80px;margin-top:110px;margin-left:-1050px;"> Good FOOD..!!!<br/><br/> </h1>
<h1 style="font-family:Mistral;color:#c79559; font-size:80px;margin-top:120px;margin-left:-1300px;"> Good TIMES..!!!<br/><br/> </h1>

				
				<div class="cleaner_with_height">&nbsp;</div>

				
			</div>

			<div class="cleaner_with_height">&nbsp;</div>
		</div>
		</div>
	
	</div>
	
</body>
</html>