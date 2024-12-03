<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="OnlineMagaza.AdminPanel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Yönetim Paneli</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 800px; /* Minimum genişlik 500px */
            background-color: #1a1a1a;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: white;
        }

        h2 {
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }

        h3 {
            color: #f39c12;
            border-bottom: 1px solid #4CAF50;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }

        .panel {
            margin-bottom: 25px;
        }

        input[type="text"], 
        textarea, 
        select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #4CAF50;
            border-radius: 5px;
            background-color: #333;
            color: #f4f4f4;
        }

        input[type="file"] {
            margin: 10px 0;
            width: 100%; /* Dosya yükleme alanının genişliği */
        }

        button, .btnAnaSayfa {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
            width: 100%; /* Buton genişliği */
        }

        button:hover {
            background-color: #45a049;
        }

        .btnAnaSayfa {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Admin Paneli</h2>
            <asp:Label ID="lblMesaj" runat="server" ForeColor="Green" Visible="false"></asp:Label>


            <div class="panel">
                <h3>Ürün Ekle</h3>
                <asp:TextBox ID="txtUrunAd" runat="server" placeholder="Ürün Adı"></asp:TextBox><br />
                <asp:TextBox ID="txtUrunFiyat" runat="server" placeholder="Ürün Fiyatı"></asp:TextBox><br />
                <asp:TextBox ID="txtUrunAciklama" runat="server" TextMode="MultiLine" placeholder="Ürün Açıklaması"></asp:TextBox><br />
                <asp:FileUpload ID="fileUploadResim" runat="server" /><br />
                <asp:FileUpload ID="fileUploadResim1" runat="server" /><br />
                <asp:FileUpload ID="fileUploadResim2" runat="server" /><br />
                <asp:DropDownList ID="ddlKategori" runat="server"></asp:DropDownList><br />
                <asp:Button ID="btnUrunEkle" runat="server" Text="Ekle" OnClick="btnUrunEkle_Click" />
            </div>

            <div class="panel">
                <h3>Ürün Sil</h3>
                <asp:DropDownList ID="ddlSilinecekUrun" runat="server"></asp:DropDownList>
                <asp:Button ID="btnUrunSil" runat="server" Text="Sil" OnClick="btnUrunSil_Click" />
            </div>

            <div class="panel">
                <h3>Ürün Güncelle</h3>
                <asp:DropDownList ID="ddlGuncellenecekUrun" runat="server"></asp:DropDownList><br />
                <asp:TextBox ID="txtGuncelUrunAd" runat="server" placeholder="Yeni Ürün Adı"></asp:TextBox><br />
                <asp:TextBox ID="txtGuncelFiyat" runat="server" placeholder="Yeni Fiyat"></asp:TextBox><br />
                <asp:TextBox ID="txtGuncelAciklama" runat="server" TextMode="MultiLine" placeholder="Yeni Açıklama"></asp:TextBox><br />
                <asp:FileUpload ID="fileUploadGuncelResim" runat="server" /><br />
                <asp:DropDownList ID="ddlGuncelKategori" runat="server"></asp:DropDownList><br />
                <asp:Button ID="btnUrunGuncelle" runat="server" Text="Güncelle" OnClick="btnUrunGuncelle_Click" />
            </div>
                 <h3>HAKKIMIZDA</h3>
            <asp:TextBox ID="txtHakkimizda" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
<asp:Button ID="btnHakkimizdaEkle" runat="server" Text="Ekle" OnClick="btnHakkimizdaEkle_Click" />
                


            <asp:Button ID="btnAnaSayfa" runat="server" Text="Ürünlerime Geri Dön" CssClass="btnAnaSayfa" OnClick="btnAnaSayfa_Click" />
        </div>
    </form>
</body>
</html>
