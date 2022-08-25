<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AdminMaster.Master" CodeBehind="BillRates.aspx.vb" Inherits="UdupiElectricityBoard.BillRates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <title>UEB-BillRates</title>
    <style>
        #form1{
            margin:40px auto;
            width:650px;
        }

        .Rate{
            padding: 10px;
            border-radius: 8px;
            width: 175px;
            margin: 0 20px;

        }

        .fa-pencil-square-o {
            color: white;
            cursor: pointer;
            vertical-align:unset;
            font-size:30px !important;
        }
        .title{
            width:500px;
            margin:auto;
        }
        .update{
            margin:50px 130px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="title">Set the Current Bill Rate</h1>
    <form id="form1" runat="server">
        <div class="rateg">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="8" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="650px">
            <AlternatingRowStyle BackColor="White"/>
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT [Username], [Date], [Rate] FROM [tblRate]"></asp:SqlDataSource>
        </div>
        <div class="update">
        <input type="submit" class="btn btn-primary btn-style" runat="server" value="Update" onserverclick="Update" />
        <input runat="server" id="Rate" class="Rate" disabled="disabled" required="required" type="text" pattern="[0-9]{1,3}" title ="Enter 3 Digits only" />
        <a onclick="change()"><i class="fa fa-pencil-square-o fa-lg"></i></a>
        </div>
    </form>
    <script>
        function change() {
            //document.getElementById("ContentPlaceHolder1_Rate").disabled = false;
            var x = document.getElementById("ContentPlaceHolder1_Rate");
            if (x.disabled == true) {
                x.disabled = false;
            } else {
                x.disabled = true;
            }
        }
    </script>
</asp:Content>
