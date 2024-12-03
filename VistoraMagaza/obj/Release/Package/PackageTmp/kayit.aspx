<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kayit.aspx.cs" Inherits="OnlineMagaza.kayit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kayıt Ol</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
             background-image: url('img/yesil.jpeg');
        }
        .container {
            width: 500px;
            margin: auto;
            background: #e0fada;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
        }
        h2 {
            text-align: center;
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 97%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        .btn:hover {
            background-color: #218838;
        }
        .message {
            color: green;
            text-align: center;
            margin-bottom: 10px;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }
        .auto-style1 {
            color: #000000;
            text-align: center;
            margin-bottom: 10px;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Kayıt Ol</h2>
            <asp:Label ID="lblMesaj" runat="server" CssClass="message" Visible="false"></asp:Label>
            <strong>
            <asp:Label ID="lblHata" runat="server" CssClass="auto-style1" Visible="false"></asp:Label>

            </strong>

            <!-- Kullanıcı Adı -->
            <div class="input-group">
                <label for="txtKullaniciAdi">Kullanıcı Adı *</label>
                <asp:TextBox ID="txtKullaniciAdi" runat="server" />
            </div>
            <!-- Şifre -->
            <div class="input-group">
                <label for="txtSifre">Şifre *</label>
                <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" />
            </div>
            <!-- Şifreyi Tekrar Girin -->
            <div class="input-group">
                <label for="txtSifreTekrar">Şifreyi Tekrar Girin *</label>
                <asp:TextBox ID="txtSifreTekrar" runat="server" TextMode="Password" />
            </div>
            <!-- E-posta -->
            <div class="input-group">
                <label for="txtEmail">E-posta *</label>
                <asp:TextBox ID="txtEmail" runat="server" />
            </div>
            <!-- Ev Adresi -->
            <div class="input-group">
                <label for="txtEvAdresi">Ev Adresi *</label>
                <asp:TextBox ID="txtEvAdresi" runat="server" />
            </div>
            <!-- İş Adresi (isteğe bağlı) -->
            <div class="input-group">
                <label for="txtIsAdresi">İş Adresi (isteğe bağlı)</label>
                <asp:TextBox ID="txtIsAdresi" runat="server" />
            </div>
            <!-- Cep Telefonu -->
            <div class="input-group">
                <label for="txtCepTelefonu">Cep Telefonu *</label>
                <asp:TextBox ID="txtCepTelefonu" runat="server" />
            </div>

            <asp:Button ID="btnKayit" runat="server" Text="Kayıt Ol" CssClass="btn" OnClick="btnKayit_Click" />
            <div><h2>
    <p>Hesabınız varsa <a href="giris.aspx">giriş yap</a></p></h2>
</div>
        </div>

    </form>
</body>
</html>
