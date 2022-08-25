<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/CustomerMaster.Master" CodeBehind="CustFeedback.aspx.vb" Inherits="UdupiElectricityBoard.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-CustomerFeedback</title>

    <style>
        .Feedback {
            display: block;
            width: 800px;
            padding: 20px;
            margin: 30px auto;
            border-radius: 8px;
       /*     background-color:black;
            color:white;*/
        }

        .btn {
            display: block;
            margin: auto;
        }

        #form1 {
            margin: auto;
        }

        .Name{
            display:block;
            margin:auto;
            width:220px;
            border-radius:5px;
            outline:none;
            margin-top:20px;
            padding:8px;
        }

        .labell{
            display:inline-block;
            padding:5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title-heading-w3 text-center mx-auto">
        <h3 class="title-big">Give Us Your Valuable Feedback </h3>
    </div>

    <form id="form1" action="#" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="background-color: #FFFFFF; color: #284775; display: block;
margin:20px auto;
width: 700px; border-radius: 8px; padding: 20px;">
            <span class="labell">Date:</span> 
            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
            <br />
            <span class="labell">Name:</span>
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            <span class="labell">Feedback:</span>
            <asp:Label ID="FeedbackLabel" runat="server" Text='<%# Eval("Feedback") %>' />
            <br />
</span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="background-color: #999999;">Date:
            <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Feedback:
            <asp:TextBox ID="FeedbackTextBox" runat="server" Text='<%# Bind("Feedback") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Date:
            <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
            <br />Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />Feedback:
            <asp:TextBox ID="FeedbackTextBox" runat="server" Text='<%# Bind("Feedback") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="background-color: #E0FFFF; color: #333333; display: block;
margin:20px auto;
width: 700px; border-radius: 8px; padding: 20px;">
                <span class="labell">Date:</span> 
            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
            <br />
            <span class="labell">Name:</span>
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            <span class="labell">Feedback:</span>
            <asp:Label ID="FeedbackLabel" runat="server" Text='<%# Eval("Feedback") %>' />
            <br />

            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF; ">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #E2DED6;font-weight: bold;color: #333333;">Date:
            <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
            <br />
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
            <br />
            Feedback:
            <asp:Label ID="FeedbackLabel" runat="server" Text='<%# Eval("Feedback") %>' />
            <br />
<br /></span>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:UEB1ConnectionString2 %>" SelectCommand="SELECT [Date], [Name], [Feedback] FROM [tblFeedback]"></asp:SqlDataSource>

    
        <input type="text" id="Name" class="Name" runat="server" placeholder="Your Name" required="required" readonly/>
        <textarea style="resize:none;" runat="server" placeholder="Feedback" class="Feedback" id="Feedback" rows="5" cols="100" required=""></textarea>
        <input runat="server" type="submit" value="Submit" class="btn btn-primary btn-style" onserverclick="Submit"/>
    </form>
</asp:Content>
