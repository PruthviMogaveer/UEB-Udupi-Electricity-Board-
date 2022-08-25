<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/CustomerMaster.Master" CodeBehind="CustomerHome.aspx.vb" Inherits="UdupiElectricityBoard.CustomerHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>UdupiElectricityBoard</title>
    <style>
        body{
            height:100vh;
        }
        .head1 {
            position: absolute;
            left: 560px;
            top: 320px;
            font-size: 6rem;
            width: 430px;
            text-align: center;
            /*text-decoration: underline;*/
            font-style: italic;
        }

       iframe{
           position:relative;
           top:-262px;
           width:100vw;
           max-width:100%;
       }

       .division{
           position:absolute;
           top:700px;
           width:100vw;
           display:block;
           height:50px;
           background-color:orangered;
           max-width:100%;
       }
       video{
           width:100vw;
           max-width:100%;
       }
       .w3l-footer-29-main {
    top: -262px;
    position: relative;
    height:100px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">

    </form>
    <h1 class="head1">Welcome To UEB </h1>
    <video autoplay muted loop>
        <source src ="/assets/video/video.mp4" type="video/mp4" />
        
    </video>

    <div >
        <span class="division"></span>
    </div>

   <%-- <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d31115.369566305875!2d74.84827126184018!3d12.880615889611617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1selectricity%20board!5e0!3m2!1sen!2sin!4v1625197065017!5m2!1sen!2sin" width="1510" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>--%>
    <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d31114.901921362118!2d74.84003151574645!3d12.884381051923594!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1selectricity%20board!5e0!3m2!1sen!2sin!4v1625197509527!5m2!1sen!2sin" height="500" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
</asp:Content>
