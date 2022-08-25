<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Try.aspx.vb" Inherits="UdupiElectricityBoard._Try" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input runat="server" id="CustNo" type="text" name="CustNo" placeholder="Customer No." required="" pattern="[0-9]{13}" title ="Enter 13 Digits only"/>
        </div>
    </form>
    <script>
    let m = Math.random();
        console.log(m);
        document.getElementById("CustNo").value = Math.floor( 1000000000000 + (9999999999999 - 1000000000000) * m);
    </script>
</body>
</html>
