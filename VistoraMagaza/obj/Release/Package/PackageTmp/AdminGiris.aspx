<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminGiris.aspx.cs" Inherits="OnlineMagaza.AdminGiris" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Girişi</title>
    <style>
        /* Genel gövde ve arka plan */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #3a3a3a, #1a1a1a);
        }

        /* Ana kart stil ayarları */
        .login-card {
            background-color: #ffffff;
            width: 100%;
            max-width: 400px;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        /* Başlık */
        .login-card h2 {
            margin: 0 0 20px;
            color: #333333;
        }

        /* Mesaj label */
        #lblMesaj {
            color: #ff4d4d;
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
        }

        /* Input alanları */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #dddddd;
            border-radius: 4px;
            font-size: 16px;
            background-color: #f9f9f9;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
        }

        /* Giriş butonu */
        #btnAdminGiris {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #btnAdminGiris:hover {
            background-color: #0056b3;
        }

        #btnAdminGiris:active {
            background-color: #003d80;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-card">
            <h2>Admin Girişi</h2>
            <asp:Label ID="lblMesaj" runat="server" Visible="false"></asp:Label>
            <asp:TextBox ID="txtAdminKullaniciAdi" runat="server" Placeholder="Kullanıcı Adı" required></asp:TextBox>
            <asp:TextBox ID="txtAdminSifre" runat="server" TextMode="Password" Placeholder="Şifre" required></asp:TextBox>
            <asp:Button ID="btnAdminGiris" runat="server" Text="Giriş Yap" OnClick="btnAdminGiris_Click" />
        </div>
    </form>
</body>
</html>
