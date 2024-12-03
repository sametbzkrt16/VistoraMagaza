<%@ Page Title="" Language="C#" MasterPageFile="~/kullanıcı.Master" AutoEventWireup="true" CodeBehind="profil.aspx.cs" Inherits="OnlineMagaza.profil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        /* Varsayılan stil (Gündüz modu) */
body {
    background-color: #e9ecef; /* Gündüz modu arka plan rengi */
    color: #212529; /* Gündüz modu yazı rengi */
}

/* Gece modu stilleri */
body.dark-mode {
    background-color: #343a40; /* Gece modu arka plan rengi */
    color: #ffffff; /* Gece modu yazı rengi */
}

.profile-row {
    background-color: #f8f9fa; /* Gündüz modu profil satırı rengi */
}

/* Gece modu profil satırı rengi */
body.dark-mode .profile-row {
    background-color: #495057; /* Gece modu profil satırı rengi */
}

/* Diğer elemanlar için de benzer stiller eklenebilir */

         body {
        font-family: Arial, sans-serif;
        background-color: #e9ecef;
        margin: 0;
        padding: 0;
    }
   .container {
    max-width: 1200px;
    margin: auto;
    padding: 80px;
    margin-top: 50px;
    display: flex; /* Flexbox kullanarak içeriği ortalamak için */
    justify-content: center; /* Yatayda ortala */
    align-items: flex-start; /* Üstten başlayarak hizala */
}

.profile-section {
    /* Mevcut stilinizi koruyun */
    width: 48%; /* Genişliği koruyun */
}

.orders-section {
    margin-right: 0; /* Mevcut stilinizi koruyun */
}

    h2, h3 {
        color: #343a40;
        margin-bottom: 20px;
    }
    .profile-row {
        display: flex;
        justify-content: space-between;
        background-color: #f8f9fa;
        padding: 15px;
        border-radius: 8px;
        margin-bottom: 15px;
        width: 100%; /* Tam genişlik */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .profile-row label {
        font-size: 16px;
        color: #495057;
        font-weight: bold;
        width: 40%;
    }
    .profile-row .info {
        flex-grow: 1;
        color: #212529;
        text-align: right;
    }
    .profile-section button {
        width: 100%;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 12px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin-top: 30px; /* Butona üstten boşluk */
    }
    .profile-section button:hover {
        background-color: #007bff;
    }
    .orders-section .table {
        width: 100%;
        text-align: center;
        border-collapse: collapse;
    }
    .table-bordered th, .table-bordered td {
        border: 1px solid #dee2e6;
        padding: 10px;
    }
    </style>

    <div class="container">
        <!-- Sol kısım: Kullanıcı Bilgileri -->
        <div class="profile-section">
            <h2>Profil Bilgileri</h2>

            <div class="profile-row">
                <label>Kullanıcı Adı:</label>
                <div class="info"><asp:Label ID="lblKullaniciAdi" runat="server" Text=""></asp:Label></div>
            </div>

            <div class="profile-row">
                <label>E-posta:</label>
                <div class="info"><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></div>
            </div>

            <div class="profile-row">
                <label>Ev Adresi:</label>
                <div class="info"><asp:Label ID="lblEvAdresi" runat="server" Text=""></asp:Label></div>
            </div>

            <div class="profile-row">
                <label>İş Adresi:</label>
                <div class="info"><asp:Label ID="lblIsAdresi" runat="server" Text=""></asp:Label></div>
            </div>

            <div class="profile-row">
                <label>Cep Telefonu:</label>
                <div class="info"><asp:Label ID="lblCepTelefonu" runat="server" Text=""></asp:Label></div>
            </div>
            <div>
            <asp:Button ID="btnCikis" runat="server" Text="Çıkış Yap" OnClick="btnCikis_Click" CssClass="btn-exit" />
        </div></div>
        <script>
    function toggleDarkMode() {
        const body = document.body;
        body.classList.toggle('dark-mode');

        // Kullanıcının tercihine göre yerel depolamada ayarı kaydet
        if (body.classList.contains('dark-mode')) {
            localStorage.setItem('theme', 'dark');
        } else {
            localStorage.setItem('theme', 'light');
        }
    }

    // Sayfa yüklendiğinde kullanıcı tercihine göre tema ayarla
    window.onload = function() {
        const theme = localStorage.getItem('theme');
        if (theme === 'dark') {
            document.body.classList.add('dark-mode');
        }
    }
        </script>

        
</asp:Content>
