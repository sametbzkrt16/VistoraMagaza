<%@ Page Title="" Language="C#" MasterPageFile="~/kullanıcı.Master" AutoEventWireup="true" CodeBehind="Siparisler.aspx.cs" Inherits="OnlineMagaza.Siparisler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Siparişler</title>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #0056b3; /* Başlık rengi */
            font-size: 2em; /* Başlık boyutu */
        }

        .order-container {
            max-width: 800px; /* Maksimum genişlik */
            margin: 20px auto; /* Orta hizalama */
            padding: 20px;
            border-radius: 10px; /* Kenar yuvarlama */
            background-color: #fff; /* Arka plan rengi */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Gölgelendirme */
            border: 1px solid #ddd; /* Kenar rengi */
            transition: box-shadow 0.3s, transform 0.3s; /* Geçiş efekti */
        }

        .order-container:hover {
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.2); /* Hover durumunda gölge */
            transform: scale(1.02); /* Hover durumunda büyütme */
        }

        .order-item {
            border: 1px solid #e2e2e2;
            margin: 15px 0;
            padding: 20px;
            border-radius: 5px; /* Kenar yuvarlama */
            background-color: #f9f9f9; /* Arka plan rengi */
            transition: box-shadow 0.3s; /* Geçiş efekti */
        }

        .order-item:hover {
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* Hover durumunda gölge */
        }

        .order-header {
            font-weight: bold;
            font-size: 1.4em; /* Başlık boyutu */
            color: #333; /* Başlık rengi */
            margin-bottom: 10px; /* Başlık alt boşluğu */
        }

        .order-price {
            font-weight: bold;
            color: #28a745; /* Fiyat rengi */
            font-size: 1.2em; /* Fiyat boyutu */
        }

        p {
            margin: 8px 0; /* Paragraf marjları */
        }

        /* Responsive tasarım */
        @media (max-width: 600px) {
            .order-container {
                padding: 15px; /* Küçük ekranlar için padding azaltma */
            }

            .order-item {
                padding: 15px; /* Küçük ekranlar için padding azaltma */
            }

            h2 {
                font-size: 1.5em; /* Küçük ekranlarda başlık boyutu */
            }
        }
    </style>

    <h2>Siparişlerim</h2>
    <div class="order-container">
        <asp:Repeater ID="rptSiparisler" runat="server">
            <ItemTemplate>
                <div class="order-item">
                    <div class="order-header">
                        Sipariş ID: <%# Eval("SiparisId") %> - Tarih: <%# Eval("SiparisTarihi", "{0:dd.MM.yyyy}") %>
                    </div>
                    <p>Kullanıcı Adı: <%# Eval("KullaniciAdi") %></p>
                    <p>Ürün Adı: <%# Eval("UrunAdi") %></p>
                    <p class="order-price">Ürün Fiyatı: <%# Eval("UrunFiyat", "{0:C}") %></p>
                    <p>Adres: <%# Eval("Adres") %></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
