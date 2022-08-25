<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminDelete.aspx.vb" Inherits="UdupiElectricityBoard.AdminDelete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-AdminDelete</title>
        <style>

.Username{
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
    background-color:rgb(173, 12, 20);
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form action="#" id="form1" runat="server">
        <div style="margin:20px auto; width: max-content; ">
             <input id="Username" class="Username" type="text" runat="server" placeholder="Username" required="required"/>
            <input runat="server" class="Submit" type="submit" id="Submit" value="Delete" onserverclick="Del"/>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"  Width="1518px" Height="100px" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Mobile_No" HeaderText="Mobile_No" SortExpression="Mobile_No" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                <asp:BoundField DataField="Aadhar" HeaderText="Aadhar" SortExpression="Aadhar" />
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT [Name], [Mobile_No], [Email], [Address], [Username], [Aadhar] FROM [tblAdmin] WHERE [Deleted]='No'"></asp:SqlDataSource>
    </form>

</asp:Content>
