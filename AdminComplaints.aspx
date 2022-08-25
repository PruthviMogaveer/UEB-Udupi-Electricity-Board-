<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminComplaints.aspx.vb" Inherits="UdupiElectricityBoard.AdminComplaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-Complaints</title>
    <style>
        .Complaint {
            display: block;
            width: 800px;
            padding: 20px;
            /*            margin:auto;*/
            margin: 30px auto;
            border-radius:10px;
        }

        .btn {
            display: block;
            margin: auto;
            border-radius:8px;
        }

        .CustName{
            
            margin: 20px;
            width: 210px;
            display:block;
            border-radius: 5px;
            padding: 9px;
            display:inline-block;
        }
        .input-group{
            margin:auto;
            width:500px;
        }
        .title-big{
            text-decoration:underline;
            margin:20px auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title-heading-w3 text-center mx-auto">
        <h3 class="title-big">Complaints </h3>
    </div>
    <form runat="server" action="#" method="post" class="main-input">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <span style="background-color: #FFFFFF;color: #284775; display: block;
margin:20px  auto;
width: 1000px; padding:20px; border-radius:15px;">Complaint_Date:
                <asp:Label ID="Complaint_DateLabel" runat="server" Text='<%# Eval("Complaint_Date") %>' />
                <br />
                Cust_Name:
                <asp:Label ID="Cust_NameLabel" runat="server" Text='<%# Eval("Cust_Name") %>' />
                <br />
                Complaint:
                <asp:Label ID="ComplaintLabel" runat="server" Text='<%# Eval("Complaint") %>' />
                <br />
                Admin_Name:
                <asp:Label ID="Admin_NameLabel" runat="server" Text='<%# Eval("Admin_Name") %>' />
                <br />Reply:
                <asp:Label ID="ReplyLabel" runat="server" Text='<%# Eval("Reply") %>' />
                <br />
                Reply_Date:
                <asp:Label ID="Reply_DateLabel" runat="server" Text='<%# Eval("Reply_Date") %>' />
                <br />
                </span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="background-color: #999999;">Complaint_Date:
                <asp:TextBox ID="Complaint_DateTextBox" runat="server" Text='<%# Bind("Complaint_Date") %>' />
                <br />
                Cust_Name:
                <asp:TextBox ID="Cust_NameTextBox" runat="server" Text='<%# Bind("Cust_Name") %>' />
                <br />
                Complaint:
                <asp:TextBox ID="ComplaintTextBox" runat="server" Text='<%# Bind("Complaint") %>' />
                <br />
                Admin_Name:
                <asp:TextBox ID="Admin_NameTextBox" runat="server" Text='<%# Bind("Admin_Name") %>' />
                <br />
                Reply:
                <asp:TextBox ID="ReplyTextBox" runat="server" Text='<%# Bind("Reply") %>' />
                <br />
                Reply_Date:
                <asp:TextBox ID="Reply_DateTextBox" runat="server" Text='<%# Bind("Reply_Date") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /><br /></span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">Complaint_Date:
                <asp:TextBox ID="Complaint_DateTextBox" runat="server" Text='<%# Bind("Complaint_Date") %>' />
                <br />Cust_Name:
                <asp:TextBox ID="Cust_NameTextBox" runat="server" Text='<%# Bind("Cust_Name") %>' />
                <br />Complaint:
                <asp:TextBox ID="ComplaintTextBox" runat="server" Text='<%# Bind("Complaint") %>' />
                <br />
                Admin_Name:
                <asp:TextBox ID="Admin_NameTextBox" runat="server" Text='<%# Bind("Admin_Name") %>' />
                <br />
                Reply:
                <asp:TextBox ID="ReplyTextBox" runat="server" Text='<%# Bind("Reply") %>' />
                <br />
                Reply_Date:
                <asp:TextBox ID="Reply_DateTextBox" runat="server" Text='<%# Bind("Reply_Date") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /><br /></span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="background-color: #E0FFFF;color: #333333; display: block;
margin:20px auto;
width: 1000px; padding:20px; border-radius:15px;">Complaint_Date:
                <asp:Label ID="Complaint_DateLabel" runat="server" Text='<%# Eval("Complaint_Date") %>' />
                <br />
                Cust_Name:
                <asp:Label ID="Cust_NameLabel" runat="server" Text='<%# Eval("Cust_Name") %>' />
                <br />
                Complaint:
                <asp:Label ID="ComplaintLabel" runat="server" Text='<%# Eval("Complaint") %>' />
                <br />
                Admin_Name:
                <asp:Label ID="Admin_NameLabel" runat="server" Text='<%# Eval("Admin_Name") %>' />
<br />Reply:
                <asp:Label ID="ReplyLabel" runat="server" Text='<%# Eval("Reply") %>' />
                <br />
                Reply_Date:
                <asp:Label ID="Reply_DateLabel" runat="server" Text='<%# Eval("Reply_Date") %>' />
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
                <span style="background-color: #E2DED6;font-weight: bold;color: #333333;">Complaint_Date:
                <asp:Label ID="Complaint_DateLabel" runat="server" Text='<%# Eval("Complaint_Date") %>' />
                <br />
                Cust_Name:
                <asp:Label ID="Cust_NameLabel" runat="server" Text='<%# Eval("Cust_Name") %>' />
                <br />
                Complaint:
                <asp:Label ID="ComplaintLabel" runat="server" Text='<%# Eval("Complaint") %>' />
                <br />
                Admin_Name:
                <asp:Label ID="Admin_NameLabel" runat="server" Text='<%# Eval("Admin_Name") %>' />
<br />Reply:
                <asp:Label ID="ReplyLabel" runat="server" Text='<%# Eval("Reply") %>' />
                <br />
                Reply_Date:
                <asp:Label ID="Reply_DateLabel" runat="server" Text='<%# Eval("Reply_Date") %>' />
                <br />
                <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT [Complaint_Date], [Cust_Name], [Complaint], [Admin_Name], [Reply], [Reply_Date] FROM [tblComplaint]"></asp:SqlDataSource>
        <div class="input-group">
        <input class="CustName" placeholder="Customer Name" runat="server" type="text" id="Cust_Name"  required="required"/>
        <input class="CustName" placeholder="Complaint Date" runat="server" type="text" id="C_Date" required="required" />
            </div>
        <textarea style="resize:none;" runat="server" placeholder="Complaint Reply" class="Complaint" id="Complaint_Reply" rows="5" cols="100" required=""></textarea>
        <input runat="server" type="submit" value="Submit"  class="btn btn-primary btn-style" onserverclick="Submit"/>
    </form>
    <!-- //contact -->
</asp:Content>

