<%@ Page Title="" Language="C#" MasterPageFile="~/kullanıcı.Master" AutoEventWireup="true" CodeBehind="Iletisim.aspx.cs" Inherits="OnlineMagaza.Iletisim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .contact-info {
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 5px;
            background-color: #f9f9f9;
            margin-bottom: 15px;
            transition: background-color 0.3s ease;
        }

        .contact-info:hover {
            background-color: #e9e9e9;
        }

        .contact-info i {
            font-size: 24px;
            color: #007BFF;
            margin-right: 15px;
        }

        .contact-info a {
            color: #007BFF;
            text-decoration: none;
            font-weight: bold;
            flex-grow: 1;
        }

        .contact-info a:hover {
            text-decoration: underline;
        }
    </style>

    <div class="container">
        <h2>İletişim Bilgileri</h2>
        <div class="contact-info">
            <i class="fas fa-phone-alt"></i>
            <asp:Label ID="lblTelefon" runat="server" Text=""></asp:Label>
        </div>
        <div class="contact-info">
            <i class="fas fa-envelope"></i>
            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
        </div>
        <div class="contact-info">
            <i class="fas fa-map-marker-alt"></i>
            <asp:Label ID="lblAdres" runat="server" Text=""></asp:Label>
        </div>
        <div class="contact-info">
            <i class="fab fa-instagram"></i>
            <asp:HyperLink ID="hlInstagram" runat="server" NavigateUrl="https://www.instagram.com/erichomestore/" Target="_blank">Erichome</asp:HyperLink>
        </div>
    </div>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />


</asp:Content>
