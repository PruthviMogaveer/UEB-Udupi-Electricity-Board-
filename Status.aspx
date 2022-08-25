<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="Status.aspx.vb" Inherits="UdupiElectricityBoard.Status" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-Status</title>
            <style>

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

.THeader{
    width:468px;
    margin:20px auto;
    text-decoration:underline;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
    <div style="margin:20px auto; width: max-content; ">
             <input id="MobileNo" class="MobileNo" type="text" runat="server" name="MobileNo" placeholder="Mobile No." />
            <input runat="server" class="Submit" type="submit" id="Submit" value="Show" onserverclick="Show"/>
        </div>
        <h1 class="THeader">Your Personal Details</h1>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="Aadhar_No">
        <AlternatingItemTemplate>
            <span style="background-color: #FFF8DC; display: block;
margin: auto;
width: 500px; padding:30px;">Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
            <br />
            Mobile_No:
            <asp:Label ID="Mobile_NoLabel" runat="server" Text='<%# Eval("Mobile_No") %>' />
            <br />
            Aadhar_No:
            <asp:Label ID="Aadhar_NoLabel" runat="server" Text='<%# Eval("Aadhar_No")%>'/>
            <br />
<br /></span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #008A8C;color: #FFFFFF;">Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Mobile_No:
            <asp:TextBox ID="Mobile_NoTextBox" runat="server" Text='<%# Bind("Mobile_No") %>' />
            <br />
            Aadhar_No:
            <asp:Label ID="Aadhar_NoLabel1" runat="server" Text='<%# Eval("Aadhar_No")%>'/>
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>Enter the mobile number.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />Mobile_No:
            <asp:TextBox ID="Mobile_NoTextBox" runat="server" Text='<%# Bind("Mobile_No") %>' />
            <br />Aadhar_No:
            <asp:TextBox ID="Aadhar_NoTextBox" runat="server" Text='<%# Bind("Aadhar_No")%>'/>
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="background-color: #DCDCDC;color: #000000; display: block;
margin: auto;
width: 500px; padding:30px;">Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
            <br />
            Mobile_No:
            <asp:Label ID="Mobile_NoLabel" runat="server" Text='<%# Eval("Mobile_No") %>' />
            <br />
            Aadhar_No:
            <asp:Label ID="Aadhar_NoLabel" runat="server" Text='<%# Eval("Aadhar_No")%>'/>
            <br />
</span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #008A8C;font-weight: bold;color: #FFFFFF;">Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
            <br />
            Mobile_No:
            <asp:Label ID="Mobile_NoLabel" runat="server" Text='<%# Eval("Mobile_No") %>' />
            <br />
            Aadhar_No:
            <asp:Label ID="Aadhar_NoLabel" runat="server" Text='<%# Eval("Aadhar_No")%>'/>
            <br />
</span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT [Name], [Address], [Email], [Mobile_No], [Aadhar_No] FROM [tblCustomer] WHERE ([Mobile_No] = @Mobile_No)">
        <SelectParameters>
            <asp:SessionParameter Name="Mobile_No" SessionField="MobNo" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h1 class="THeader">Your Connection Details</h1>
    <asp:ListView ID="ListView2" runat="server" DataKeyNames="Customer_No" DataSourceID="SqlDataSource2">
        <AlternatingItemTemplate>
            <span style="background-color: #FFFFFF;color: #284775; display: block;
margin: auto;
width: 500px; padding:30px;">Customer_No:
            <asp:Label ID="Customer_NoLabel" runat="server" Text='<%# Eval("Customer_No") %>' />
            <br />
            RR_No:
            <asp:Label ID="RR_NoLabel" runat="server" Text='<%# Eval("RR_No") %>' />
            <br />
            Location_Code:
            <asp:Label ID="Location_CodeLabel" runat="server" Text='<%# Eval("Location_Code") %>' />
            <br />
            Meter_Code:
            <asp:Label ID="Meter_CodeLabel" runat="server" Text='<%# Eval("Meter_Code") %>' />
            <br />
            Sub_Division:
            <asp:Label ID="Sub_DivisionLabel" runat="server" Text='<%# Eval("Sub_Division") %>' />
            <br />
</span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #999999;">Customer_No:
            <asp:Label ID="Customer_NoLabel1" runat="server" Text='<%# Eval("Customer_No") %>' />
            <br />
            RR_No:
            <asp:TextBox ID="RR_NoTextBox" runat="server" Text='<%# Bind("RR_No") %>' />
            <br />
            Location_Code:
            <asp:TextBox ID="Location_CodeTextBox" runat="server" Text='<%# Bind("Location_Code") %>' />
            <br />
            Meter_Code:
            <asp:TextBox ID="Meter_CodeTextBox" runat="server" Text='<%# Bind("Meter_Code") %>' />
            <br />
            Sub_Division:
            <asp:TextBox ID="Sub_DivisionTextBox" runat="server" Text='<%# Bind("Sub_Division") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Customer_No:
            <asp:TextBox ID="Customer_NoTextBox" runat="server" Text='<%# Bind("Customer_No") %>' />
            <br />RR_No:
            <asp:TextBox ID="RR_NoTextBox" runat="server" Text='<%# Bind("RR_No") %>' />
            <br />Location_Code:
            <asp:TextBox ID="Location_CodeTextBox" runat="server" Text='<%# Bind("Location_Code") %>' />
            <br />Meter_Code:
            <asp:TextBox ID="Meter_CodeTextBox" runat="server" Text='<%# Bind("Meter_Code") %>' />
            <br />Sub_Division:
            <asp:TextBox ID="Sub_DivisionTextBox" runat="server" Text='<%# Bind("Sub_Division") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="background-color: #E0FFFF;color: #333333; display: block;
margin: auto;
width: 500px; padding:30px;">Customer_No:
            <asp:Label ID="Customer_NoLabel" runat="server" Text='<%# Eval("Customer_No") %>' />
            <br />
            RR_No:
            <asp:Label ID="RR_NoLabel" runat="server" Text='<%# Eval("RR_No") %>' />
            <br />
            Location_Code:
            <asp:Label ID="Location_CodeLabel" runat="server" Text='<%# Eval("Location_Code") %>' />
            <br />
            Meter_Code:
            <asp:Label ID="Meter_CodeLabel" runat="server" Text='<%# Eval("Meter_Code") %>' />
            <br />
            Sub_Division:
            <asp:Label ID="Sub_DivisionLabel" runat="server" Text='<%# Eval("Sub_Division") %>' />
            <br />
</span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #E2DED6;font-weight: bold;color: #333333;">Customer_No:
            <asp:Label ID="Customer_NoLabel" runat="server" Text='<%# Eval("Customer_No") %>' />
            <br />
            RR_No:
            <asp:Label ID="RR_NoLabel" runat="server" Text='<%# Eval("RR_No") %>' />
            <br />
            Location_Code:
            <asp:Label ID="Location_CodeLabel" runat="server" Text='<%# Eval("Location_Code") %>' />
            <br />
            Meter_Code:
            <asp:Label ID="Meter_CodeLabel" runat="server" Text='<%# Eval("Meter_Code") %>' />
            <br />
            Sub_Division:
            <asp:Label ID="Sub_DivisionLabel" runat="server" Text='<%# Eval("Sub_Division") %>' />
            <br />
<br /></span>
        </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT [Customer_No], [RR_No], [Location_Code], [Meter_Code], [Sub_Division] FROM [tblCustomer] WHERE ([Mobile_No] = @Mobile_No)">
            <SelectParameters>
                <asp:SessionParameter Name="Mobile_No" SessionField="MobNo" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
        </asp:Content>
