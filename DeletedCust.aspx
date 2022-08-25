<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AdminMaster.Master" CodeBehind="DeletedCust.aspx.vb" Inherits="UdupiElectricityBoard.DeletedCust" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-DeletedCustomer</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1535px" Height="150px">
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
<%--            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />--%>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT * FROM [tblCustomer] WHERE Deleted='Yes'"></asp:SqlDataSource>
</form>
</asp:Content>
