<%@ Page Title="" Language="C#" MasterPageFile="~/kullanıcı.Master" AutoEventWireup="true" CodeBehind="Favoriler.aspx.cs" Inherits="OnlineMagaza.Favoriler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="rptFavoriler" runat="server">

    <ItemTemplate>
        <div>
            <h3><%# Eval("UrunAdi") %></h3>
            <p>Fiyat: <%# Eval("UrunFiyat") %> TL</p>
            <img src="Resimler/<%# Eval("UrunResim") %>" alt="Ürün Resmi" />
        </div>
    </ItemTemplate>
</asp:Repeater>

</asp:Content>
