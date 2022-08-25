<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/AdminMaster.Master" CodeBehind="AdminHome.aspx.vb" Inherits="UdupiElectricityBoard.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UEB-AdminHome</title>
    <style>
        .bgImage{
            width: 100%;
            height: 80%;
        }
        .Head{
            position: absolute;
top: 425px;
left: 690px;
width: 100px;
font-size: 90px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 id="Heading1" runat="server" class="Head"></h1>
   <img runat="server" src="/assets/images/AdminHome.gif" alt="could not be found" class="bgImage"/>
</asp:Content>
