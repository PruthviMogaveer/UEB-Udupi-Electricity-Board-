<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AdminMaster.Master" CodeBehind="AssignConn.aspx.vb" Inherits="UdupiElectricityBoard.AssignConn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Electrical Service Form A Flat Responsive Widget Template :: w3layouts</title>
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
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet"/>
<!-- google fonts -->
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- banner -->
	<div class="center-container">
	<div class="banner-dott">
		<div class="main">
				<div class="w3layouts_main_grid">
				<h1 class="w3layouts_head">Assign Details</h1>
					<form runat="server" action="#" method="post" class="w3_form_post">

						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="MobileNo">Mobile No.</label>
								<input runat="server" id="MobileNo" type="text" name="MobileNo"/>
							</span>
						</div>

						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="CustNo">Customer No. <span class="star">*</span></label>
								<input runat="server" id="CustNo" type="text" name="CustNo" placeholder="Customer No." required="" pattern="[0-9]{13}" title ="Enter 13 Digits only"/>
							</span>
						</div>
						
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="RRno">RRNo. <span class="star">*</span> </label>
								<input runat ="server" id="RRno" type="text" name="RRno" placeholder="RR No." required="" pattern="[A-Z0-9]{7}" title ="Enter 7 characters only"/>
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="LocCode">Location Code <span class="star">*</span></label>
								<input runat="server" type="text" id="LocCode" name="LocCode" placeholder="Location Code" required="" pattern="[0-9]{7}" title ="Enter 7 Digits only"/>
							</span>
						</div>
							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Mtrcode">Meter Code<span class="star">*</span></label>
								<input type="text" runat="server" id="MtrCode" name="Mtrcode" placeholder="MtrCode" required="" pattern="[A-Z0-9]{3}" title ="Enter 3 characters only"/>
							</span>
						</div>
						

						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="SubDivi">Sub Division <span class="star">*</span></label>
									<input type="text" runat ="server" id="SubDivi"	name="SubDivi" placeholder="Sub Division" required ="" pattern="[A-Z0-9]{3}" title ="Enter 3 characters only"/>
							</span>
						</div>
<%--                        <a href="Scripts/">Scripts/</a>--%>
					<div class="w3_main_grid">
						<div class="w3_main_grid_right">
							<%--<input runat="server" id="Submit" type="submit" value="Submit"/>--%>
							<input id ="Submit" runat="server" type="submit" value="Submit" name="Submit" required="" onserverclick="Assign"/>
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
              /*  }*/

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
</asp:Content>
