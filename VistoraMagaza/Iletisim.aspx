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

        /* Harita için Stil */
        .map-container {
            margin-top: 30px;
            text-align: center;
            padding: 10px;
            background-color: rgba(255, 255, 255, 0.9);
            border: 1px solid #ccc;
        }

        footer {
            margin-top: 50px;
            text-align: right;
            padding: 20px;
            background-color: #f9f9f9;
            border-top: 1px solid #ddd;
        }

        .map-container iframe {
            width: 1000px;
            height: 300px;
            border: 0;
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

    <!-- Harita Footer'a Eklendi -->
    <footer>
        <div class="map-container">
            <h3>İş Yerinin Konumu</h3>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3142.4384746618193!2d-29.2!3d40.1!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x88b36a3d4a31d0ff%3A0x580c86e2c7d74bd0!2sMahmudiye%20Mahallesi%2C%20K%C4%B1smet%20Sokak%2C%20No%3A14%2C%20Ineg%C3%B6l!5e0!3m2!1str!2str!4v1692722749568!5m2!1str!2str" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </footer>
</asp:Content>
