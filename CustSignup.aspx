<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CustSignup.aspx.vb" Inherits="UdupiElectricityBoard.CustSignup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>UEB-CustomerSignUp</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Electrical Service Form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->

<!-- //custom-theme -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" media="all" />

<!-- js -->
<script type="assets/text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->

<!-- google fonts -->
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet"/>
<!-- google fonts -->

		<style>
		.fa{
			position:absolute;
			left: 50px;
			top: 30px;
			color:white;
			border-radius:50px;
			padding:12px;
		}
		textarea{
			resize: none;
		}
	</style>

</head>

<body>
  	<a href="Home.aspx"><i class="fa fa-arrow-left fa-lg" style="border:5px solid white !important; "></i></a>

<!-- banner -->
	<div class="center-container">
	<div class="banner-dott">
		<div class="main">
				<div class="w3layouts_main_grid">
				<h1 class="w3layouts_head">Signup</h1>
					<form runat="server" action="#" method="post" class="w3_form_post">
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Name">Name <span class="star">*</span></label>
								<input runat="server" id="Name" type="text" name="Name" placeholder="Name" required=""/>
							</span>
						</div>
						
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Email">Your Email <span class="star">*</span> </label>
								<input runat ="server" id="Email" type="email" name="Email" placeholder="Your Email" required=""/>
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Phone">Phone Number <span class="star">*</span></label>
								<input runat="server" type="text" id="Phone" name="Phone" placeholder="Phone Number" required="" pattern="[0-9]{10}" title ="Enter 10 Digits only"/>
							</span>
						</div>
							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Aadhar">Aadhar No.<span class="star">*</span></label>
								<input runat="server" type="text" id="Aadhar" name="Aadhar" placeholder="Aadhar Number" required="" pattern="[0-9]{12}" title ="Enter 12 Digits only"/>
							</span>
						</div>
						

						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Address">Address <span class="star">*</span></label>
									<textarea runat ="server" id="Address"	name="Address" placeholder="Address" required ="" rows ="5" cols ="10" />
									<%--<div class="clear"></div>--%>
							</span>
						</div>
						
							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="RR">RR No.<span class="star">*</span></label>
								<input runat="server" id="RR" type="text" name="RR" placeholder="RR Number" required="" pattern="[A-Z0-9]{7}" title ="Enter 7 character only"/>
							</span>
						</div>
							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Cno">Customer Number<span class="star">*</span></label>
								<input runat="server" type="text" id="Cno" name="Cno" placeholder="Customer Number" required="" pattern="[0-9]{13}" title ="Enter 13 Digits only"/>
							</span>
						</div>

							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="SubDiv">Sub Division<span class="star">*</span></label>
								<input runat="server" id="SubDiv" type="text" name="SubDiv" placeholder="Sub Division" required="" pattern="[A-Z0-9]{3}" title ="Enter 3 Characters"/>
							</span>
						</div>
							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Lcode">Location Code<span class="star">*</span></label>
								<input runat="server" id="Lcode" type="text" name="Lcode" placeholder="Location Code" required="" pattern="[A-Z0-9]{7}" title ="Enter 7 Digits only"/>
							</span>
						</div>

							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Mcode">Meter Code<span class="star">*</span></label>
								<input runat="server" id="Mcode" type="text" name="Mcode" placeholder="Meter Code" required="" pattern="[A-Z0-9]{3}" title ="Enter 3 characters"/>
							</span>
						</div>

							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Uname">Username<span class="star">*</span></label>
								<input runat="server" id="Uname" type="text" name="Uname" placeholder="Username" pattern=".{3,20}" title="can enter only 3 to 20 characters" required=""/>
							</span>
						</div>
							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Password">Password<span class="star">*</span></label>
								<input runat="server" id="Password" type="Password" name="Password" placeholder="Password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"/>
							</span>
								</div>
								<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Cpassword">Confirm Password<span class="star">*</span></label>
								<input runat="server" id="Cpassword" type="Password" name="Cpassword" placeholder="Confirm Password" required=""/>
							</span>
						</div>
							<%--<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Question">Question<span class="star">*</span></label>
								<input runat="server" id="Question" type="text" name="Question" placeholder="Question" required=""/>
							</span>
						</div>
							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Answer">Answer<span class="star">*</span></label>
								<input runat="server" id="Answer" type="text" name="Answer" placeholder="Answer" required=""/>
							</span>
						</div>--%>
					
					<div class="w3_main_grid">
						<div class="w3_main_grid_right">
							<%--<input runat="server" id="Submit" type="submit" value="Submit"/>--%>
							<input id ="Submit" runat="server" type="submit" value="Submit" name="Submit" required="" onserverclick="SignUp" />
						</div>
					</div>
				</form>
			</div>
			
	<%--	<!-- Calendar -->
			<link rel="stylesheet" href="css/jquery-ui.css" />
				<script src="js/jquery-ui.js"></script>
					<script>
						$(function() {
							$( "#datepicker" ).datepicker();
						});
                    </script>
		<!-- //Calendar -->--%>
			<!-- password-script -->
			<script>
                window.onload = function () {
                    document.getElementById("Password").onchange = validatePassword;
					document.getElementById("Cpassword").onchange = validatePassword;
					

				}

				//function notify() {
    //                const notification = new Notification("Heading", {
    //                    body: "Hi this is a notification from Varun"
    //                });
    //            }

				//if (Notification.permission === 'granted') {
				//	alert("We have permisiion!");
				//	notify();
				//} else {
				//	Notification.requestPermission().then(permission => {
				//		console.log(permission);
				//	});
    //            }

                function validatePassword() {
                    var pass2 = document.getElementById("Password").value;
                    var pass1 = document.getElementById("Cpassword").value;
                    if (pass1 != pass2)
                        document.getElementById("Cpassword").setCustomValidity("Passwords Don't Match");
                    else
                        document.getElementById("Cpassword").setCustomValidity('');
                    //empty string means no validation error

                }
            </script>
			<!-- //password-script -->
		
			<div class="w3layouts_copy_right">
				<div class="container">
					<p>© 2018 Electrical Service Form. All rights reserved | Design by <a href="http://w3layouts.com">SVP</a></p>
				</div>
			</div>
		</div>
	</div>
	</div>
<!-- //footer -->

</body>
</html>
