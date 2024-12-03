<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OdemeSayfasi.aspx.cs" Inherits="OnlineMagaza.OdemeSayfasi" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ödeme Sayfası</title>
    <style>
        /* Sayfa genel stili */
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
        }

        /* Form kutusunun stili */
        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: left;
        }

        h2 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            background-color: #f9f9f9;
            transition: border 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #007BFF;
            outline: none;
        }

        /* Buton stili */
        button {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        /* Hata mesajı stili */
        .error {
            color: red;
            font-weight: bold;
        }

        /* Bilgilendirme mesajı stili */
        .info {
            margin-bottom: 20px;
            font-size: 14px;
            color: #555;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Ödeme Bilgileri</h2>
       
        <label for="txtAd">Adınız:</label>
        <asp:TextBox ID="txtAd" runat="server"></asp:TextBox><br />
        
        <label for="txtAdres">Adresiniz:</label>
        <asp:TextBox ID="txtAdres" runat="server" required="required" ></asp:TextBox><br />
        
        <label for="txtKartNo">Kredi Kartı Numarası:</label>
        <asp:TextBox ID="txtKartNo" runat="server" ></asp:TextBox><br />
        
        <label for="txtSonKullanma">Son Kullanma Tarihi (MM/YY):</label>
        <asp:TextBox ID="txtSonKullanma" runat="server" ></asp:TextBox><br />
        
        <label for="txtCvv">CVV:</label>
        <asp:TextBox ID="txtCvv" runat="server"></asp:TextBox><br />
        
        <asp:Label ID="lblHataMesaji" runat="server" CssClass="error" Visible="false"></asp:Label><br />
         
        <div class="info">Sipariş ve Ürünler hakkında detaylı bilgi almak için ödemeyi tamamla butonuna tıklayarak WhatsApp'a yönlendiriliyorsunuz.</div>
        
        
        <asp:Button ID="btnOdemeTamamla" runat="server" Text="Ödemeyi Tamamla" OnClick="btnOdemeTamamla_Click" />
        <a href="Urunler.aspx">Ürünler Sayfasına Git</a>

    </form>
</body>
</html>
