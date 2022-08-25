<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/master1.Master" CodeBehind="ForgotPass.aspx.vb" Inherits="UdupiElectricityBoard.ForgotPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Forget password</title>
    <style>
      .head{
        width: 318px;
        margin: auto;
        text-decoration: underline;
        font-size: 2rem;
      }

      .contain{
        display: block;
        margin: 50px auto;
        width: 400px;
      }

      label{
        display: inline;
        font-size: 1.5rem;
        margin: 5px 27px;
      }
      input[type="text"]{
        display: inline;
height: 30px;
border-radius: 5px;
width: 250px;
padding: 20px;
      }
      input[type="submit"]{
        display: block;
        width: 160px;
        padding: 9px;
        margin: 30px auto;
        border-radius: 8px;
        background-color: #f3525a;
        cursor: pointer;
        border:none;
        color:white;
        font-weight:600;
      }
    </style>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="head">
      <h1>Forget Password</h1>
    </div>
    <form runat="server">
      <div class="contain">
        <label runat="server" for="mail">Email id</label>
        <input runat="server" type="text" id="mail" placeholder="Enter your email id" />
        <input runat="server" type="submit" value="Submit" onserverclick="SendMail"/>
      </div>
    </form>
</asp:Content>

