<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="giris.aspx.cs" Inherits="OnlineMagaza.giris" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giriş Yap</title>
    <style>
        
        body {
            font-family: Arial, sans-serif;
            background-color: #808080;
            margin: 0;
            padding: 0;
 background-image: url('img/yesil.jpeg');        }
        .container {
            width: 500px;
            height:340px;
            margin: auto;
            background: #e0fada;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 300px;
          

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
            width: 100%;
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
            <h2>Giriş Yap</h2>
            <asp:Label ID="lblMesaj" runat="server" CssClass="message" Visible="false"></asp:Label>
            <strong>
            <asp:Label ID="lblHata" runat="server" CssClass="auto-style1" Visible="false"></asp:Label>
            </strong>
            <div class="input-group">
                <label for="txtKullaniciAdi">Kullanıcı Adı</label>
                <asp:TextBox ID="txtKullaniciAdi" runat="server" />
            </div>
            <div class="input-group">
                <label for="txtSifre">Şifre</label>
                <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" />
            </div>
            <asp:Button ID="btnGiris" runat="server" Text="Giriş Yap" CssClass="btn" OnClick="btnGiris_Click" />
            <div>
                <h2>
    <p>Üye Değilseniz <a href="Kayit.aspx">Kayıt Ol</a></p></h2>
</div>
        </div>
    </form>
</body>
</html>