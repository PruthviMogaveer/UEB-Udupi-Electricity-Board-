<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AdminMaster.Master" CodeBehind="CustDelete.aspx.vb" Inherits="UdupiElectricityBoard.CustDelete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-DeletedCustomer</title>
    <style>

.CustomerNo{
padding: 10px;
border-radius: 8px;
width: 175px;
        }

.Submit{
padding: 10px;
border-radius: 8px;
width: 140px;
margin: auto;
margin-left: 20px;
background-color: #f3525a;
border: none;
color: white;
font-weight: 600;
        }

.Submit:hover{
    background-color:#f12e38;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form action="#" id="form1" runat="server">
        <div style="margin:20px auto; width: max-content; ">
             <input id="CustomerNo" class="CustomerNo" type="text" runat="server" placeholder="Customer No" required="required"/>
            <input runat="server" class="Submit" type="submit" id="Submit" value="Delete" onserverclick="Del"/>
        </div>
           

    <%--<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1518px" Height="85px">
        <AlternatingRowStyle BackColor="White" ForeColor="#507CD1"/>
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Mobile_No" HeaderText="Mobile_No" SortExpression="Mobile_No" />
            <asp:BoundField DataField="Aadhar_No" HeaderText="Aadhar_No" SortExpression="Aadhar_No" />
            <asp:BoundField DataField="RR_No" HeaderText="RR_No" SortExpression="RR_No" />
            <asp:BoundField DataField="Customer_No" HeaderText="Customer_No" SortExpression="Customer_No" />
            <asp:BoundField DataField="Sub_Division" HeaderText="Sub_Division" SortExpression="Sub_Division" />
            <asp:BoundField DataField="Location_Code" HeaderText="Location_Code" SortExpression="Location_Code" />
            <asp:BoundField DataField="Meter_Code" HeaderText="Meter_Code" SortExpression="Meter_Code" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>--%>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT [Name], [Address], [Email], [Mobile_No], [Aadhar_No], [RR_No], [Customer_No], [Sub_Division], [Location_Code], [Meter_Code] FROM [tblCustomer] WHERE [Deleted]='No'"></asp:SqlDataSource>




        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1518px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Mobile_No" HeaderText="Mobile_No" SortExpression="Mobile_No" />
                <asp:BoundField DataField="Aadhar_No" HeaderText="Aadhar_No" SortExpression="Aadhar_No" />
                <asp:BoundField DataField="RR_No" HeaderText="RR_No" SortExpression="RR_No" />
                <asp:BoundField DataField="Customer_No" HeaderText="Customer_No" SortExpression="Customer_No" />
                <asp:BoundField DataField="Sub_Division" HeaderText="Sub_Division" SortExpression="Sub_Division" />
                <asp:BoundField DataField="Location_Code" HeaderText="Location_Code" SortExpression="Location_Code" />
                <asp:BoundField DataField="Meter_Code" HeaderText="Meter_Code" SortExpression="Meter_Code" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>


    </form>
</asp:Content>
