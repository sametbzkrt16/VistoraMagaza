<%@ Page Title="" Language="C#" MasterPageFile="~/kullanıcı.Master" AutoEventWireup="true" CodeBehind="Hakkimizda.aspx.cs" Inherits="OnlineMagaza.Hakkimizda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Temel stil */
        body {
            font-family: Arial, sans-serif;
            background-color: #e0fada;
            margin: 0;
            padding: 20px;
            color: #333;

        }

        /* Başlık stil */
        h2 {
            color: #333;
            text-align: center;
            font-size: 28px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* Konteyner stil */
        .container {
            max-width: 700px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            line-height: 1.6;
            font-size: 18px;
        }

        /* Paragraf stil */
        .about-text p {
            text-align: justify;
            margin-bottom: 15px;
        }
        
        /* İlk harf stil (isteğe bağlı) */
        .about-text p:first-of-type::first-letter {
            font-size: 28px;
            font-weight: bold;
            color: #0056b3;
        }

    </style>

    <div class="container">
        <h2>Hakkımızda</h2>
        <div class="about-text">
            <asp:Label ID="lblHakkimizda" runat="server" Text=""></asp:Label>
        </div>
    </div>

</asp:Content>
