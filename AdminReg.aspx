<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdminReg.aspx.vb" Inherits="UdupiElectricityBoard.AdminReg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>UEB-AdminRegisteration</title>
 
	<!-- Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta charset="utf-8"/>
    <meta name="keywords" content="Space Register Form a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
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
	<link href="assets/css/AdminReg1.css" rel="stylesheet" type="text/css" media="all" />
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
			color: white;
		}
	</style>
</head>
<body>
	<a href="AdminHome.aspx"><i class="fa fa-arrow-left fa-lg" style="border:5px solid white !important; "></i></a>
     <!-- Main Content -->
	<div class="main">
		<div class="main-w3l">
			<h1 class="logo-w3"></h1>
			<div class="w3layouts-main">
				<h2 style="text-decoration:underline;"><span>Register A New Admin</span></h2>
					<form runat="server" action="#" method="post">
						<input runat="server" id="Name" placeholder="Name" name="Name" type="text" required="" pattern="[a-zA-Z\s]{3,23}" title="Enter more than 3 and less than 23 characters"/>
						<textarea style="resize:none;" id ="Address" runat="server" placeholder="Address" name="Address" type="text" required="" rows="5" cols="50"></textarea>
						<%--<input runat="server" id="Address" placeholder="Address" name="Address" type="text" required="" pattern="[a-zA-Z0-9]{,48}" title="Enter less than 48 characters"/>--%>
						<input runat="server" id="Email" placeholder="Email" name="Email" type="email" required=""/>
						<input runat="server" id="Phone" placeholder="Phone Number" name="Phone" type="text" required="" pattern="[0-9]{10}" title="Enter 10 digits only"/>
						<input runat="server" id="Aadhar" placeholder="Aadhaar No." name="Aadhaar" type="text"  pattern="[0-9]{12}" title="Enter 12 digits only" required=""/>
						<div class="UploadBorder">
							<label class="UploadLabel" >Upload your picture: </label>
							<input runat="server" id="ImageUpload" type="file" class="upload" accept="image/*" required/>
						</div>
						<input runat="server" id="Username" placeholder="Username" name="Username" type="text"  pattern=".{3,20}" title="can enter only 3 to 20 characters" required=""/>
						<input runat="server" id="Password" placeholder="Password" name="Password" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,24}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 and less than 24 characters"/>
						<input runat="server" id="Cpassword" placeholder="Confirm Password" name="Cpassword" type="password" required=""/>
						<input runat="server" type="submit" value="Register Now" name="Register" onserverclick="Register"/>
					</form>
			</div>
			<!-- //main -->
			
			<!-- password-script -->
			<script>
                window.onload = function () {
                    document.getElementById("Password").onchange = validatePassword;
                    document.getElementById("Cpassword").onchange = validatePassword;
                }

                function validatePassword() {
                    var pass2 = document.getElementById("Cpassword").value;
                    var pass1 = document.getElementById("Password").value;
                    if (pass1 != pass2)
                        document.getElementById("Cpassword").setCustomValidity("Passwords Don't Match");
                    else
                        document.getElementById("Cpassword").setCustomValidity('');
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
