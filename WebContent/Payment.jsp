<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="org.pk.hotel.dao.UserService"%>
<%@page import="org.pk.hotel.beans.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.pk.hotel.constants.GlobalConstants"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Restaurant E-menu System</title>
<link href="resources/css/css.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
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

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

.container {
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
	width:50%;
}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 30px;
}

.btn {
	background-color: #4CAF50;
	color: white;
	padding: 12px;
	margin: 10px 0;
	border: none;
	width: 100%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

.btn:hover {
	background-color: #45a049;
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

a {
	color: #2196F3;
}

hr {
	border: 1px solid lightgrey;
}

span.price {
	float: right;
	color: grey;
}
/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}

.has-bg-img:after {
    content:'';
    background: url('./resources/images/fork.jpg') no-repeat center center fixed;
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
				style="font-size: 40px;font-family:Algerian; margin-left:-1220px; margin-top:-30px; color:#fec04f;"> 
				Mainland 	</h1>
				
				<h1 style=";color:#290b0be3;font-size: 40px;margin-top:20px;margin-left:-1150px;"><span class="rainbow">India</span></h1>
			
	
					<h1 style="font-family:Mistral;color:#c79559; font-size:60px;margin-top:-30px;margin-left:-30px;"> Big FOOD ...<br/><br/> </h1>
		<h1 style="font-family:Mistral;color:#c79559; font-size:60px;margin-top:20px;margin-left:300px;">LITTLE money...</h1>
		
	
		<div id="templatemo_content">

			<div id="templatemo_content_left" style="margin-top: 230px; margin-left:-30px;height: 200px;width:300px;">
				<jsp:include page="Menu.jsp" />
			</div>
</div>
		
					<div class="row">
		<div class="col-75">
			<div class="container" style="margin-left:400px;background:black;opacity:0.7;">
				<form action="FeedBack.html">



					<div class="col-50">
						<h3>Payment</h3>
						<label for="fname" style="font-family:Lucida Calligraphy; font-size:30px;color:#c79559;"><u>Cards Accepted</u></label>
						<img src="./resources/images/visa.png" alt="Visa" style="width:120px;height:80px;margin-left:50px;"></img>
						<img src="./resources/images/Mastercard.png" alt="MasterCard" style="width:120px;height:80px;"></img>
						
						<label for="cname" style="font-family:Lucida Calligraphy; font-size:20px;color:#c79559;">Name on Card</label> <input type="text"
							id="cname" name="cardname" placeholder="NAME" required> <label
							for="ccnum" style="font-family:Lucida Calligraphy; font-size:20px;color:#c79559;">Credit card number</label> <input type="text"
							id="ccnum" name="cardnumber" placeholder="XXXX-XXXX-XXXX-XXXX"
							required>

						<div class="row">
							<div class="col-50">
								<label style="font-family:Lucida Calligraphy; font-size:20px;color:#c79559;">Exp Date</label> <select style="height:30px;">
									<option value="01">January</option>
									<option value="02">February</option>
									<option value="03">March</option>
									<option value="04">April</option>
									<option value="05">May</option>
									<option value="06">June</option>
									<option value="07">July</option>
									<option value="08">August</option>
									<option value="09">September</option> 
									<option value="10">October</option>
									<option value="11">November</option>
									<option value="12">December</option>
								</select> <select style="height:30px;">
									<option value="16">2016</option>
									<option value="17">2017</option>
									<option value="18">2018</option>
									<option value="19">2019</option>
									<option value="20">2020</option>
									<option value="21">2021</option>
								</select>

							</div>
							<div class="col-50">
								<label for="cvv" style="font-family:Lucida Calligraphy; font-size:20px;color:#c79559;">CVV</label> <input type="text" id="cvv"
									name="cvv" placeholder="XXX" onblur="validateCvv()" required />
							</div>
						</div>
					</div>
					<input type="submit" id="submit" value="PAY" class="btn" onSubmit="window.location.reload();" />
			</div>
			<div></div>
		</div>


	</div>
					
				<script>
					var x = document.getElementById("ccnum");
					x.onblur = function() {
						var card = document.getElementById("ccnum");
						var h = /^\d{16}$/;

						if (card.value.length == 16) {
							return (true);
						} else {
							alert("Inavlid Card Number");
							return (false);
						}

					}

					function validateCvv() {
						var card = document.getElementById("cvv");
						var h = /^\d{3}$/;
						if (card.value.length == 3) {
							return (true);
						} else {
							alert("Inavlid CVV Number");
							return (false);
						}
					}
				</script>
			
		
			<div class="cleaner_with_height">&nbsp;</div>


	


		<div class="cleaner_with_height">&nbsp;</div>
	</div>
		</div>
	
		
</body>
</html>