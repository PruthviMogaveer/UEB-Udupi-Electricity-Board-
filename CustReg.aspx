<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CustReg.aspx.vb" Inherits="UdupiElectricityBoard.CustReg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UEB-CustomerRegistration</title>
 
	<!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="utf-8"/>
    <meta name="keywords" content="Space Register Form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"/>
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //Meta-Tags -->

	<!-- css files -->
	<link href="assets/css/CustReg1.css" rel="stylesheet" type="text/css" media="all" />
	<!-- css files -->

	<!-- Online-fonts -->
	<link href="//fonts.googleapis.com/css?family=Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext,vietnamese" rel="stylesheet"/>
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

	<!-- //Online-fonts -->
	<style>
		.fa{
			position:absolute;
			left: 50px;
			top: 30px;
			color:white;
			border-radius:50px;
			padding:12px;
		}
		.UploadBorder{
			border: 1px solid white;
			margin-bottom: 20px;
			padding: 10px;
			border-radius: 3px;
			background: rgba(0, 0, 0, 0.2);
		}
		.UploadLabel{
			color: white;
			margin-right: 10px;
		}
		.upload{
			width: 200px;
		}
	</style>
</head>
<body>
   <!-- Main Content -->
	<a href="Home.aspx"><i class="fa fa-arrow-left fa-lg" style="border:5px solid white !important; "></i></a>
	<div class="main">
		<div class="main-w3l">
			<h1 class="logo-w3">Apply For Your New Connection</h1>
			<div class="w3layouts-main">
				<h2><span>Register now</span></h2>
					<form runat="server" action="#" method="post">
						<input id ="Name" runat ="server" placeholder="Full Name" name="Name" type="text" required="" pattern="[A-Za-z\s]{1,24}" title ="Enter 24 characters only"/>
						<textarea style="resize:none;" id ="Address" runat="server" placeholder="Address" name="Address" type="text" required="" rows="5" cols="50" pattern="[A-Za-z]{49}" title ="Enter 49 characters only"></textarea>
						<input id="Pin" runat="server" placeholder="Pincode" name="Pin" type="text" pattern="[0-9]{6}" title="Enter only 6 digits" />
						<input id ="Email" runat="server" placeholder="Email" name="Email" type="email" required=""/>
						<input id ="Phone" runat="server" placeholder="Phone Number" name="Phone" type="text" required="" pattern="[0-9]{10}" title ="Enter 10 Digits only"/>                             
						<input id ="Aadhar" runat="server" placeholder="Aadhaar No." name="Aadhaar" type="text" required="" pattern="[0-9]{12}" title= "Enter 12 Digits only"/> 
						<div class="UploadBorder">
							<label class="UploadLabel" >Upload your picture: </label>
							<input runat="server" id="ImageUpload" type="file" class="upload" accept="image/*" required/>
						</div>
						
<%--						<input id ="Password" runat="server" placeholder="Password" name="Password" type="password" required=""/>
						<input id ="Confirm" runat="server" placeholder="Confirm Password" name="Confirm" type="password" required=""/>--%>
						<input id ="Login" runat="server" type="submit" value="Register Now" name="Login" onserverclick ="Register" />
					</form>
			</div>
			<!-- //main -->
			
			<!-- password-script -->
			<script>
                window.onload = function () {
                    document.getElementById("Password").onchange = validatePassword;
                    document.getElementById("Confirm").onchange = validatePassword;
                }

                function validatePassword() {
                    var pass2 = document.getElementById("Password").value;
                    var pass1 = document.getElementById("Confirm").value;
                    if (pass1 != pass2)
                        document.getElementById("Confirm").setCustomValidity("Passwords Don't Match");
                    else
                        document.getElementById("Confirm").setCustomValidity('');
                    //empty string means no validation error
                }
            </script>
			<!-- //password-script -->

			<!--footer-->
			<div class="footer-w3l">
				<p>&copy; 2021 All rights reserved. Design by <a href="#">SVP</a></p>
			</div>
			<!--//footer-->
			
		</div>
	</div>
	<!-- //Main Content -->
</body>
</html>
