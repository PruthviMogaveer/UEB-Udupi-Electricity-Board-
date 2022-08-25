<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.vb" Inherits="UdupiElectricityBoard.CustomerLogin" EnableEventValidation="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>UEB-CustomerLogin</title>
	<!-- Meta-Tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<meta charset="utf-8"/>
	<meta name="keywords" content="Particles Login Form Form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
    </script>
	<!-- //Meta-Tags -->
	<!-- Stylesheets -->
	<link href="assets/css/CustLogin1.css" rel='stylesheet' type='text/css' />
	<!-- online fonts-->
	    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Amiri:400,400i,700,700i" rel="stylesheet"/>
	<style>
		.fa{
			position:absolute;
			left: 50px;
			top: 30px;
			color:white;
			border-radius:50px;
			padding:12px;
		}

		.link{
			text-decoration:none;
			margin-right:10px;
		}
	</style>
</head>

<body>
	<a href="Home.aspx"><i class="fa fa-arrow-left fa-lg" style="border:5px solid white !important; "></i></a>
   <!--  particles  -->
	
	<div id="particles-js"></div>
	<!-- //particles -->
	
	<div class="w3ls-pos">
		<h1>UEB Customer Login </h1>
		<div class="w3ls-login box">
			<!-- form starts here -->
			<%--action="CustomerHome.aspx"--%>
			<form  method="post" runat="server">
				<div class="agile-field-txt">
					<input runat="server" id="Username" type="text" name="username" placeholder="Username" required="" />
				</div>
				<div class="agile-field-txt">
					<input runat="server" type="password" name="password" placeholder="******" required="" id="Password" />
					<div class="agile_label">
						<%--<input id="check3" name="check3" type="checkbox" value="show password"/>
						<label class="check" for="check3">Forgot Password</label>--%>
						<a class="link" href="ForgotPass.aspx">Forgot Password</a>
						<a class="link" href ="CustSignup.aspx" >Signup??</a> 
					</div>
					
				</div>
				<div class="w3ls-bot">
					<input runat="server" type="submit" value="LOGIN" onServerClick="Submit"/>
				</div>
			</form>
		</div>
		<!-- //form ends here -->
		<!--copyright-->
		<div class="copy-wthree">
			<p>© 2021 UEB. All Rights Reserved | Design by
				<a href="#">SVP</a>
			</p>
		</div>
		<!--//copyright-->
	</div>
	<!-- scripts required  for particle effect -->
	<script src='assets/js/particles.min.js'></script>
	<script src="assets/js/index.js"></script>
	<!-- //scripts required for particle effect -->

</body>
</html>
