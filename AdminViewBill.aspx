<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminViewBill.aspx.vb" Inherits="UdupiElectricityBoard.AdminViewBill" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-AdminViewBill</title>
     <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <style>
        .tlabel {
            margin: 5px 10px;
            display: inline-block;
            color: black;
            width: 140px;
        }

        .header {
            display: block;
            width: 250px;
            margin: 5px 185px;
            /*background-color:white;*/
        }

        @media print {
            body * {
                visibility: hidden;
            }

            .Print-Area * {
                visibility: visible;
            }
        }

        .pay {
            text-align: center;
            font-weight: 600;
        }

        button, .pay {
            display: block;
            width: 150px;
            border-radius: 5px;
            color: white;
            background-color: #f3525a;
            cursor: pointer;
            margin: 15px auto;
            border: none;
            font-weight: 600;
        }

            button:hover {
                color: red;
            }

        .empty {
            font-size: 2rem;
            height: 100px;
            margin: auto 18px;
        }

        .fa-arrow-left {
            position: absolute;
            left: 50px;
            top: 350px;
            color: white;
            border-radius: 50px;
            padding: 12px;
        }
        .MobileNo{
padding: 10px;
border-radius: 8px;
width: 175px;
        }

.Submit{
padding: 12px 35px;
border-radius: 8px;
width: 140px;
margin: auto;
margin-left: 20px;
background-color: #f3525a;
color:white;
font-weight:600;
border: none;
        }

.Submit:hover{
    background-color:#f12e38;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <form id="form1" runat="server" style="background-color: white !important; width: 500px; height: 570px; margin: 100px auto 80px auto;">
             <div style="margin:20px auto; width: max-content; position: absolute;
top: 155px;
left: 590px;">
             <input id="CustNo" class="MobileNo" type="text" runat="server" name="CustNo" placeholder="Customer No." />
            <input runat="server" class="Submit" type="submit" id="Submit" value="Show" onserverclick="ShowBill"/>
        </div>
        <div class="Print-Area">
            <div class="header">
                <span style="font-size: 30px; color: hsl(357, 87%, 63.7%);" class="fa fa-clone"></span>
                <h1 style="display: inline-block; color: black;">&nbsp;UEB</h1>
            </div>

            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">

                <AlternatingItemTemplate>
                    <span style="background-color: #FFFFFF; color: #284775;">Name:
                <asp:Label ID="Name_Label" runat="server" Text='<%# Eval("Name") %>' />
                        <br />
                        Customer_No:
                <asp:Label ID="Customer_NoLabel" runat="server" Text='<%# Eval("Customer_No") %>' />
                        <br />
                        RR_No:
                <asp:Label ID="RR_NoLabel" runat="server" Text='<%# Eval("RR_No") %>' />
                        <br />
                        Location_Code:
                <asp:Label ID="Location_CodeLabel" runat="server" Text='<%# Eval("Location_Code") %>' />
                        <br />
                        Meter_No:
                <asp:Label ID="Meter_NoLabel" runat="server" Text='<%# Eval("Meter_No") %>' />
                        <br />
                        Sub_Division:
                <asp:Label ID="Sub_DivisionLabel" runat="server" Text='<%# Eval("Sub_Division") %>' />
                        <br />
                        Prev_Reading:
                <asp:Label ID="Prev_ReadingLabel" runat="server" Text='<%# Eval("Prev_Reading") %>' />
                        <br />
                        Cur_Reading:
                <asp:Label ID="Cur_ReadingLabel" runat="server" Text='<%# Eval("Cur_Reading") %>' />
                        <br />
                        Penalty:
                <asp:Label ID="PenaltyLabel1" runat="server" Text='<%# Eval("Penalty") %>' />
                        <br />
                        Issued_Date:
                <asp:Label ID="Issued_DateLabel" runat="server" Text='<%# Eval("Issued_Date") %>' />
                        <br />
                        Bill_No:
                <asp:Label ID="Bill_NoLabel" runat="server" Text='<%# Eval("Bill_No") %>' />
                        <br />
                        Amount:
                <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                        <br />
                        Due_Date:
                <asp:Label ID="Due_DateLabel" runat="server" Text='<%# Eval("Due_Date") %>' />
                        <br />
                        <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #999999;">Name:
                <asp:TextBox ID="Name_TextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        Customer_No:
                <asp:TextBox ID="Customer_NoTextBox" runat="server" Text='<%# Bind("Customer_No") %>' />
                        <br />
                        RR_No:
                <asp:TextBox ID="RR_NoTextBox" runat="server" Text='<%# Bind("RR_No") %>' />
                        <br />
                        Location_Code:
                <asp:TextBox ID="Location_CodeTextBox" runat="server" Text='<%# Bind("Location_Code") %>' />
                        <br />
                        Meter_No:
                <asp:TextBox ID="Meter_NoTextBox" runat="server" Text='<%# Bind("Meter_No") %>' />
                        <br />
                        Sub_Division:
                <asp:TextBox ID="Sub_DivisionTextBox" runat="server" Text='<%# Bind("Sub_Division") %>' />
                        <br />
                        Prev_Reading:
                <asp:TextBox ID="Prev_ReadingTextBox" runat="server" Text='<%# Bind("Prev_Reading") %>' />
                        <br />
                        Cur_Reading:
                <asp:TextBox ID="Cur_ReadingTextBox" runat="server" Text='<%# Bind("Cur_Reading") %>' />
                        <br />
                        Penalty:
                <asp:TextBox ID="PenaltyTextBox1" runat="server" Text='<%# Bind("Penalty") %>' />
                        <br />
                        Issued_Date:
                <asp:TextBox ID="Issued_DateTextBox" runat="server" Text='<%# Bind("Issued_Date") %>' />
                        <br />
                        Bill_No:
                <asp:TextBox ID="Bill_NoTextBox" runat="server" Text='<%# Bind("Bill_No") %>' />
                        <br />
                        Amount:
                <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                        <br />
                        Due_Date:
                <asp:TextBox ID="Due_DateTextBox" runat="server" Text='<%# Bind("Due_Date") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br />
                        <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span class="empty">Your bill is not yet generated.</span>

                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">Name:
                <asp:TextBox ID="Name_TextBox" runat="server" Text='<%# Bind("Name") %>' />
                        <br />
                        Customer_No:
                <asp:TextBox ID="Customer_NoTextBox" runat="server" Text='<%# Bind("Customer_No") %>' />
                        <br />
                        RR_No:
                <asp:TextBox ID="RR_NoTextBox" runat="server" Text='<%# Bind("RR_No") %>' />
                        <br />
                        Location_Code:
                <asp:TextBox ID="Location_CodeTextBox" runat="server" Text='<%# Bind("Location_Code") %>' />
                        <br />
                        Meter_No:
                <asp:TextBox ID="Meter_NoTextBox" runat="server" Text='<%# Bind("Meter_No") %>' />
                        <br />
                        Sub_Division:
                <asp:TextBox ID="Sub_DivisionTextBox" runat="server" Text='<%# Bind("Sub_Division") %>' />
                        <br />
                        Prev_Reading:
                <asp:TextBox ID="Prev_ReadingTextBox" runat="server" Text='<%# Bind("Prev_Reading") %>' />
                        <br />
                        Cur_Reading:
                <asp:TextBox ID="Cur_ReadingTextBox" runat="server" Text='<%# Bind("Cur_Reading") %>' />
                        <br />
                        Penalty:
                <asp:TextBox ID="PenaltyTextBox1" runat="server" Text='<%# Bind("Penalty") %>' />
                        <br />
                        Issued_Date:
                <asp:TextBox ID="Issued_DateTextBox" runat="server" Text='<%# Bind("Issued_Date") %>' />
                        <br />
                        Bill_No:
                <asp:TextBox ID="Bill_NoTextBox" runat="server" Text='<%# Bind("Bill_No") %>' />
                        <br />
                        Amount:
                <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                        <br />
                        Due_Date:
                <asp:TextBox ID="Due_DateTextBox" runat="server" Text='<%# Bind("Due_Date") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br />
                        <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #FFFFFF; color: #333333; display: block; margin: auto; width: 300px;">
                        <p class="tlabel">Name:</p>
                        <asp:Label ID="Name_Label" runat="server" Text='<%# Eval("Name") %>' />
                        <br />
                        <p class="tlabel">Customer_No:</p>
                        <asp:Label ID="Customer_NoLabel" runat="server" Text='<%# Eval("Customer_No") %>' />
                        <br />
                        <p class="tlabel">RR_No:</p>
                        <asp:Label ID="RR_NoLabel" runat="server" Text='<%# Eval("RR_No") %>' />
                        <br />
                        <p class="tlabel">Location_Code:</p>
                        <asp:Label ID="Location_CodeLabel" runat="server" Text='<%# Eval("Location_Code") %>' />
                        <br />
                        <p class="tlabel">Meter_No:</p>
                        <asp:Label ID="Meter_NoLabel" runat="server" Text='<%# Eval("Meter_No") %>' />
                        <br />
                        <p class="tlabel">Sub_Division:</p>
                        <asp:Label ID="Sub_DivisionLabel" runat="server" Text='<%# Eval("Sub_Division") %>' />
                        <br />
                        <p class="tlabel">Prev_Reading:</p>
                        <asp:Label ID="Prev_ReadingLabel" runat="server" Text='<%# Eval("Prev_Reading") %>' />
                        <br />
                        <p class="tlabel">Cur_Reading:</p>
                        <asp:Label ID="Cur_ReadingLabel" runat="server" Text='<%# Eval("Cur_Reading") %>' />
                        <br />
                        <p class="tlabel">Penalty:</p>
                        <asp:Label ID="PenaltyLabel1" runat="server" Text='<%# Eval("Penalty") %>' />
                        <br />
                        <p class="tlabel">Issued_Date:</p>
                        <asp:Label ID="Issued_DateLabel" runat="server" Text='<%# Eval("Issued_Date") %>' />
                        <br />
                        <p class="tlabel">Bill_No:</p>
                        <asp:Label ID="Bill_NoLabel" runat="server" Text='<%# Eval("Bill_No") %>' />
                        <br />
                        <p class="tlabel">Amount:</p>
                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                        <br />
                        <p class="tlabel">Due_Date:</p>
                        <asp:Label ID="Due_DateLabel" runat="server" Text='<%# Eval("Due_Date") %>' />
                        <br />
                        <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF;">
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #E2DED6; font-weight: bold; color: #333333;">Customer_No:
                <asp:Label ID="Name_Label" runat="server" Text='<%# Eval("Name") %>' />
                        <br />
                        <asp:Label ID="Customer_NoLabel" runat="server" Text='<%# Eval("Customer_No") %>' />
                        <br />
                        RR_No:
                <asp:Label ID="RR_NoLabel" runat="server" Text='<%# Eval("RR_No") %>' />
                        <br />
                        Location_Code:
                <asp:Label ID="Location_CodeLabel" runat="server" Text='<%# Eval("Location_Code") %>' />
                        <br />
                        Meter_No:
                <asp:Label ID="Meter_NoLabel" runat="server" Text='<%# Eval("Meter_No") %>' />
                        <br />
                        Sub_Division:
                <asp:Label ID="Sub_DivisionLabel" runat="server" Text='<%# Eval("Sub_Division") %>' />
                        <br />
                        Prev_Reading:
                <asp:Label ID="Prev_ReadingLabel" runat="server" Text='<%# Eval("Prev_Reading") %>' />
                        <br />
                        Cur_Reading:
                <asp:Label ID="Cur_ReadingLabel" runat="server" Text='<%# Eval("Cur_Reading") %>' />
                        <br />
                        Penalty:
                <asp:Label ID="PenaltyLabel1" runat="server" Text='<%# Eval("Penalty") %>' />
                        <br />
                        Issued_Date:
                <asp:Label ID="Issued_DateLabel" runat="server" Text='<%# Eval("Issued_Date") %>' />
                        <br />
                        Bill_No:
                <asp:Label ID="Bill_NoLabel" runat="server" Text='<%# Eval("Bill_No") %>' />
                        <br />
                        Amount:
                <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                        <br />
                        Due_Date:
                <asp:Label ID="Due_DateLabel" runat="server" Text='<%# Eval("Due_Date") %>' />
                        <br />
                        <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT * FROM [tblBill] WHERE ([Customer_No] = @Customer_No)">
                <SelectParameters>
                    <asp:SessionParameter Name="Customer_No" SessionField="showBill" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <%--<a href="ViewPBill.aspx"><i class="fa fa-arrow-left fa-lg" style="border: 5px solid white !important;"></i></a>--%>
        <%--<i class="fa fa-arrow-right fa-lg" style="border:5px solid white !important; "></i>--%>

        <%--<button onclick="window.print()" id="btn">Print</button>--%>
        <%--<a runat="server" onserverclick="Already" class="pay">Pay</a>--%>
    </form>
</asp:Content>
