<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AdminMaster.Master" CodeBehind="GenerateBill1.aspx.vb" Inherits="UdupiElectricityBoard.GenerateBill1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-GenerateBill</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <asp:DetailsView ID="DetailsView1" runat="server" Height="150px" Width="700px" AutoGenerateRows="False" DataSourceID="SqlDataSource1" AutoGenerateEditButton="True" CellPadding="10" CellSpacing="5" HorizontalAlign="Center" OnItemUpdated="Updated">
            <Fields>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
                <asp:BoundField DataField="Customer_No" HeaderText="Customer_No" SortExpression="Customer_No" ReadOnly="True"/>
                <asp:BoundField DataField="RR_No" HeaderText="RR_No" SortExpression="RR_No" ReadOnly="True" />
                <asp:BoundField DataField="Location_Code" HeaderText="Location_Code" SortExpression="Location_Code" ReadOnly="True"/>
                <asp:BoundField DataField="Meter_No" HeaderText="Meter_No" SortExpression="Meter_No" ReadOnly="True"/>
                <asp:BoundField DataField="Sub_Division" HeaderText="Sub_Division" SortExpression="Sub_Division" ReadOnly="True"/>
                <asp:BoundField DataField="Prev_Reading" HeaderText="Prev_Reading" SortExpression="Prev_Reading" ReadOnly="true"/>
                <asp:BoundField DataField="Cur_Reading" HeaderText="Cur_Reading" SortExpression="Cur_Reading" />
                 <asp:BoundField DataField="Penalty" HeaderText="Penalty" SortExpression="Penalty" ReadOnly="True"/>
                <asp:BoundField DataField="Issued_Date" HeaderText="Issued_Date" SortExpression="Issued_Date" ReadOnly="True"/>
                <asp:BoundField DataField="Bill_No" HeaderText="Bill_No" SortExpression="Bill_No" ReadOnly="True"/>
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" ReadOnly="True" />
                <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" SortExpression="Due_Date" ReadOnly="True"/>
            </Fields>
        </asp:DetailsView><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT [Name], [Customer_No], [RR_No], [Location_Code], [Meter_No], [Sub_Division], [Prev_Reading], [Cur_Reading], [Penalty], [Issued_Date],[Bill_No] , [Amount], [Due_Date] FROM [tblBill] WHERE ([Customer_No] = @Customer_No)"
            UpdateCommand ="UPDATE [tblBill] SET [Cur_Reading]=@Cur_Reading, [Bill_No] = ABS(CHECKSUM(NEWID()))%1000 + 1 WHERE [Customer_No]=@Customer_No">
            <SelectParameters>
                <asp:SessionParameter Name="Customer_No" SessionField="GenBill" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <%--<asp:Parameter Name="Prev_Reading" />--%>
                <asp:Parameter Name="Cur_Reading" />
                <asp:SessionParameter Name="Customer_No" SessionField="GenBill" Type="Decimal" />
                <%--<asp:SessionParameter Name="Customer_No" SessionField="GenBill" Type="Decimal" />--%>
            </UpdateParameters>
        </asp:SqlDataSource>

        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEBConnectionString %>" SelectCommand="SELECT [Name], [Customer_No], [RR_No], [Location_Code], [Meter_No], [Sub_Division], [Prev_Reading], [Cur_Reading], [Penalty], [Issued_Date],[Bill_No] , [Amount], [Due_Date] FROM [tblBill] WHERE ([Customer_No] = @Customer_No)"
            UpdateCommand ="UPDATE tblBill SET Name = @Name, RR_No = @RR_No, Location_Code = @Location_Code, Meter_No = @Meter_No, Sub_Division = @Sub_Division, Prev_Reading = @Prev_Reading, Cur_Reading=@Cur_Reading, Penalty = @Penalty, Issued_Date = CONVERT(varchar(10),@Issued_Date,103), Bill_No = ABS(CHECKSUM(NEWID()))%1000 + 1 , Amount = @Amount, Due_Date = CONVERT(varchar(10),@Due_Date,103) WHERE Customer_No = @Customer_No">
            <SelectParameters>
                <asp:SessionParameter Name="Customer_No" SessionField="GenBill" Type="Decimal" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="Customer_No" />
                <asp:Parameter Name="RR_No" />
                <asp:Parameter Name="Location_Code" />
                <asp:Parameter Name="Meter_No" />
                <asp:Parameter Name="Sub_Division" />
                <asp:Parameter Name="Prev_Reading" />
                <asp:Parameter Name="Cur_Reading" />
                <asp:Parameter Name="Penalty" />
                <asp:Parameter Name="Issued_Date" />
                <asp:Parameter Name="Bill_No" />
                <asp:Parameter Name="Amount" />
                <asp:Parameter Name="Due_Date" />
            </UpdateParameters>
        </asp:SqlDataSource>--%>


        <%--<asp:DetailsView ID="DetailsView1" runat="server" Height="150px" Width="700px" AutoGenerateRows="False" DataSourceID="SqlDataSource1" AutoGenerateEditButton="True" CellPadding="10" CellSpacing="5" HorizontalAlign="Center">
        <Fields>
            <asp:BoundField DataField="Customer_No" HeaderText="Customer" SortExpression="Customer_No" />
            <asp:BoundField DataField="RR_No" HeaderText="RR_No" SortExpression="RR_No" />
            <asp:BoundField DataField="Location_Code" HeaderText="Location_Code" SortExpression="Location_Code" />
            <asp:BoundField DataField="Meter_No" HeaderText="Meter_No" SortExpression="Meter_No" />
            <asp:BoundField DataField="Prev_Reading" HeaderText="Prev_Reading" SortExpression="Prev_Reading" />
            <asp:BoundField DataField="Cur_Reading" HeaderText="Cur_Reading" SortExpression="Cur_Reading" />
            <asp:BoundField DataField="Issued_Date" HeaderText="Issued_Date" SortExpression="Issued_Date" />
            <asp:BoundField DataField="Bill_No" HeaderText="Bill_No" SortExpression="Bill_No" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
            <asp:BoundField DataField="Due_Date" HeaderText="Due_Date" SortExpression="Due_Date" />
        </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEBConnectionString %>" SelectCommand="SELECT * FROM [tblBill] WHERE ([Customer_No] = @Customer_No)">
            <SelectParameters>
                <asp:SessionParameter Name="Customer_No" SessionField="GenBill" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
    </form>


</asp:Content>
