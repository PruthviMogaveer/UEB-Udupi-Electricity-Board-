<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AdminAssignDetails.aspx.vb" Inherits="UdupiElectricityBoard.AdminAssignDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UEB-Assign Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Electrical Service Form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<%--<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>--%>
<!-- //for-mobile-apps -->

<!-- //custom-theme -->
<link href="assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<!-- js -->
<%--<script type="assets/text/javascript" src="js/jquery-2.1.4.min.js"></script>--%>
<!-- //js -->

<!-- google fonts -->
<link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet"/>
	<style>
		.fa{
			position:absolute;
			left: 50px;
			top: 30px;
			color:white;
			border-radius:50px;
			padding:12px;
		}
	</style>
</head>
<body>
	<a href="AdminHome.aspx"><i class="fa fa-arrow-left fa-lg" style="border:5px solid white !important; "></i></a>
   <div class="center-container">
	<div class="banner-dott">
		<div class="main">
				<div class="w3layouts_main_grid">
				<h1 class="w3layouts_head">Assign Details</h1>
					<form runat="server" action="#" method="post" class="w3_form_post">

						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="MobileNo">Mobile No.</label>
								<input runat="server" id="MobileNo" type="text" name="MobileNo" readonly/>
							</span>
						</div>

						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="CustNo">Customer No. <span class="star">*</span></label>
								<input runat="server" id="CustNo" type="text" name="CustNo" readonly/>
							</span>
						</div>
						
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="RRno">RRNo. <span class="star">*</span> </label>
								<input runat ="server" id="RRno" type="text" name="RRno" readonly/>
							</span>
						</div>
						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="LocCode">Location Code <span class="star">*</span></label>
								<input runat="server" type="text" id="LocCode" name="LocCode" readonly/>
							</span>
						</div>
							<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="Mtrcode">Meter Code<span class="star">*</span></label>
								<input type="text" runat="server" id="MtrCode" name="Mtrcode" readonly/>
							</span>
						</div>
						

						<div class="w3_agileits_main_grid w3l_main_grid">
							<span class="agileits_grid">
								<label for="SubDivi">Sub Division <span class="star">*</span></label>
									<input type="text" runat ="server" id="SubDivi"	name="SubDivi" readonly/>
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
			<!-- //password-script -->
		
			<div class="w3layouts_copy_right">
				<div class="container">
					<p>© 2018 Electrical Service Form. All rights reserved | Design by <a href="http://w3layouts.com">SVP</a></p>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
	<script >
		window.onload = function () {
			GenRR();
			GenMtrCode();
			GenSubDivi();
        }
        var m = Math.random();
		document.getElementById("CustNo").value = Math.floor(1000000000000 + (9999999999999 - 1000000000000) * m);

		var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		var charLength = characters.length;
		function GenRR() {
			let result = '';
			for (let i = 0; i < 4; i++) {
				result += characters.charAt(Math.floor(Math.random() * charLength));
			}
            result += Math.floor(100 + (999 - 100) * m);
                document.getElementById("RRno").value = result;
		}

		function GenMtrCode() {
            let result = '';
            for (let i = 0; i < 2; i++) {
                result += characters.charAt(Math.floor(Math.random() * charLength));
			}
			result += Math.floor(Math.random() * 10)
            document.getElementById("MtrCode").value = result;
		}

		function GenSubDivi() {
            let result = '';
            for (let i = 0; i < 2; i++) {
                result += characters.charAt(Math.floor(Math.random() * charLength));
			}
            result += Math.floor(Math.random() * 10)
            document.getElementById("SubDivi").value = result;
        }

    </script>
</html>
