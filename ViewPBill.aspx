<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/CustomerMaster.Master" CodeBehind="ViewPBill.aspx.vb" Inherits="UdupiElectricityBoard.ViewPBill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-Bill</title>
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
            margin: 30px auto;
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

        /*      .fa-arrow-left{
			position:absolute;
			left: 50px;
			top: 350px;
			color:white;
			border-radius:50px;
			padding:12px;
		}*/

        .fa-arrow-right {
            position: absolute;
            left: 1415px;
            top: 350px;
            color: white;
            border-radius: 50px;
            padding: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" style="background-color: white !important; width: 500px; height: 570px; margin: 20px auto 80px auto;">
        <div class="Print-Area">
            <div class="header">
                <span style="font-size: 30px; color: hsl(357, 87%, 63.7%);" class="fa fa-clone"></span>
                <h1 style="display: inline-block; color: black;">&nbsp;UEB</h1>
            </div>
            <span style="background-color: #FFFFFF; color: #333333; display: block; margin: auto; width: 300px;">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <td runat="server" style="">Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
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
                            Penalty:
                        <asp:Label ID="PenaltyLabel" runat="server" Text='<%# Eval("Penalty") %>' />
                            <br />
                        </td>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <td runat="server" style="">Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
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
                            Penalty:
                        <asp:TextBox ID="PenaltyTextBox" runat="server" Text='<%# Bind("Penalty") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            <br />
                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <%--<EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>--%>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">Name:
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
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
                            Penalty:
                        <asp:TextBox ID="PenaltyTextBox" runat="server" Text='<%# Bind("Penalty") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            <br />
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>

                        <p class="tlabel">Name:</p>
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
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
                        <p class="tlabel">Penalty:</p>
                        <asp:Label ID="PenaltyLabel" runat="server" Text='<%# Eval("Penalty") %>' />
                        <br />

                    </ItemTemplate>
                    <%--border="0"--%>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" style="">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF;"></td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="">Name:
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
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
                            Penalty:
                        <asp:Label ID="PenaltyLabel" runat="server" Text='<%# Eval("Penalty") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
            </span>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT TOP 1 * FROM [tblPastBill] WHERE ([Customer_No] = @Customer_No)">
                <SelectParameters>
                    <asp:SessionParameter Name="Customer_No" SessionField="CustNo" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <%--<i class="fa fa-arrow-left fa-lg" style="border:5px solid white !important; "></i>--%>
        <a href="ViewBill.aspx"><i class="fa fa-arrow-right fa-lg" style="border: 5px solid white !important;"></i></a>

        <button onclick="window.print()" id="btn">Print</button>
        <%--<a runat="server" onserverclick="Already" class="pay">Pay</a>--%>
    </form>

    <script>
</script>
</asp:Content>
