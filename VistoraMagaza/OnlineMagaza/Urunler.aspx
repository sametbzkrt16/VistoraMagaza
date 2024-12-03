<%@ Page Title="" Language="C#" MasterPageFile="~/kullanıcı.Master" AutoEventWireup="true" CodeBehind="Urunler.aspx.cs" Inherits="OnlineMagaza.Urunler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Ürünler</title>
    <style>
        body {
            font-family: Arial, sans-serif; /* Yazı tipi ayarı */
            background-color: #f4f4f4; /* Sayfa arka plan rengi */
            margin: 0;
            padding: 0;
        }

        .product-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 20px;
        }

        .product-item {
            border: 1px solid #ddd;
            padding: 20px; /* İç boşluğu artırdık */
            margin: 15px; /* Kenar boşluğunu artırdık */
            text-align: center;
            flex: 0 1 300px;
            border-radius: 10px; /* Kenarları yuvarlamak için */
            background-color: #ffffff; /* Ürün kutusunun arka plan rengi */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Hafif gölge efekti */
        }

        h3 {
            font-size: 24px; /* Ürün adı yazı boyutu */
            color: #333; /* Yazı rengi */
        }

        .slides {
            display: flex;
            transition: transform 0.5s ease;
            overflow: hidden;
            width: 100%;
        }

        .slide-item {
            min-width: 100%;
            box-sizing: border-box;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .slide-image {
            width: 100%;
            max-width: 400px; /* Resim boyutunu ayarladık */
            height: auto;
        }

        p {
            font-size: 18px; /* Açıklama yazı boyutu */
            color: #555; /* Açıklama yazı rengi */
        }

        .controls {
            text-align: center;
            margin: 10px 0;
        }

        .auto-style15 {
            margin: 5px;
            font-size: 16px; /* Buton yazı boyutu */
            padding: 10px 15px; /* Buton iç boşluğu */
            background-color: #007bff; /* Buton arka plan rengi */
            color: white; /* Buton yazı rengi */
            border: none; /* Kenarlık kaldırma */
            border-radius: 5px; /* Kenarları yuvarlak yapma */
            cursor: pointer; /* İmleci göster */
        }

        .auto-style15:hover {
            background-color: #0056b3; /* Hover efekti */
        }

        #sepet {
            max-height: 300px;
            overflow-y: auto;
            border: 2px solid #007bff;
            border-radius: 10px;
            padding: 15px;
            background-color: #f8f8f8;
            position: absolute;
            z-index: 1000;
            top: 40px;
            left: -100px;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
        }

        .sepet-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .sepet-item:last-child {
            border-bottom: none;
        }

        .sepet-item img {
            height: 60px; /* Ürün resminin yüksekliği */
            width: 60px; /* Ürün resminin genişliği */
            margin-right: 10px; /* Resim ile yazı arasında boşluk */
        }

        .sepet-total {
            font-weight: bold;
            margin-top: 10px;
            font-size: 20px; /* Toplam fiyat yazı boyutu */
        }

        .auto-style34 {
            width: 527px;
        }

    </style>
    <!-- Arama Çubuğu -->
<div style="text-align: center; margin-top: 20px; margin-bottom: 50px;">
    <input type="text" id="searchInput" placeholder="Aradığın Ürün Erichome' da..." 
           style="font-size: 20px; padding: 10px;" 
           onkeyup="filterProducts()" class="auto-style34" />
</div>

    <div class="product-container">
        <asp:Repeater ID="rptUrunler" runat="server">
            <ItemTemplate>
                <div class="product-item">
                    <h3><%# Eval("UrunAdi") %></h3>
                    <div class="slides">
                        <div class="slide-item">
                            <img src="Resimler/<%# Eval("UrunResim") %>" alt="Ürün Resmi" class="slide-image" />
                        </div>
                        <div class="slide-item">
                            <img src="Resimler/<%# Eval("UrunResim1") %>" alt="Ürün Resmi" class="slide-image" />
                        </div>
                        <div class="slide-item">
                            <img src="Resimler/<%# Eval("UrunResim2") %>" alt="Ürün Resmi" class="slide-image" />
                        </div>
                    </div>

                    <p>Fiyat: <%# Eval("UrunFiyat") %> TL</p>
                    <p> <%# Eval("UrunAciklama") %></p>

                    <div class="controls">
                        <button class="auto-style15" type="button" onclick="startAutoSlide(this)">
                            <strong>Devam Et</strong>
                        </button>
                        <button class="auto-style15" type="button" onclick="stopAutoSlide(this)">
                            <strong>Durdur</strong>
                        </button>
                        <asp:Button ID="btnSepeteEkle" runat="server" Text="Sepete Ekle" 
                                    OnClick="SepeteEkle_Click" CommandArgument='<%# Eval("UrunAdi") %>' /> 

                        <asp:Label ID="lblUrunAdi" runat="server" Text='<%# Eval("UrunAdi") %>' Visible="true"></asp:Label>
                        <asp:Label ID="lblUrunFiyati" runat="server" Text='<%# Eval("UrunFiyat") %>' Visible="true"></asp:Label>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <script>
        function filterProducts() {
            const input = document.getElementById('searchInput');
            const filter = input.value.toLowerCase();
            const productItems = document.querySelectorAll('.product-item');

            productItems.forEach(item => {
                const productName = item.querySelector('h3').textContent.toLowerCase();
                if (productName.includes(filter)) {
                    item.style.display = ""; // Eşleşiyorsa görünür yap
                } else {
                    item.style.display = "none"; // Eşleşmiyorsa gizle
                }
            });
        }

        const slidesContainers = document.querySelectorAll('.slides');

        slidesContainers.forEach(container => {
            let slideIndex = 0;
            let autoSlideInterval;
            let isAutoSliding = true;

            const showSlides = () => {
                const slides = container.querySelectorAll('.slide-item');
                slides.forEach((slide, index) => {
                    slide.style.display = index === slideIndex ? 'flex' : 'none';
                });

                slideIndex = (slideIndex + 1) % slides.length;
                if (isAutoSliding) {
                    autoSlideInterval = setTimeout(showSlides, 3000);
                }
            };

            const stopAutoSlide = () => {
                isAutoSliding = false;
                clearTimeout(autoSlideInterval);
            };

            const startAutoSlide = () => {
                if (!isAutoSliding) {
                    isAutoSliding = true;
                    showSlides();
                }
            };

            showSlides();

            const startButton = container.parentElement.querySelector('button[onclick*="startAutoSlide"]');
            const stopButton = container.parentElement.querySelector('button[onclick*="stopAutoSlide"]');

            startButton.onclick = startAutoSlide;
            stopButton.onclick = stopAutoSlide;
        });
    </script>
</asp:Content>
