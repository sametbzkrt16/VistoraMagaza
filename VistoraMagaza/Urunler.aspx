<%@ Page Title="" Language="C#" MasterPageFile="~/kullanıcı.Master" AutoEventWireup="true" CodeBehind="Urunler.aspx.cs" Inherits="OnlineMagaza.Urunler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Ürünler</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .product-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center; /* Yatay merkezleme */
    align-items: center; /* Dikey merkezleme */
    margin: 20px auto; /* Otomatik merkezleme */
    width: 1000px;
    min-height: 100vh; /* Ekran yüksekliğini doldur */
    box-sizing: border-box; /* Genişlik ve padding hesaplaması */
}


        .product-item {
            width: calc(50% - 20px); /* Her satırda iki ürün, kenarlık için boşluk */
            margin: 10px; /* Kutular arasında boşluk */
            box-sizing: border-box; /* Kenarlık ve dolgu dahil genişlik */
            border: 1px solid #ccc;
            padding: 10px;
            background-color: #f9f9f9;
            text-align: center;
        }

        h3 {
            font-size: 24px;
            color: #333;
        }

      .slides {
    display: flex;
    transition: transform 1s ease-in-out; /* Yumuşak geçiş */
    overflow: hidden;
    width: 100%;
}

.slide-item {
    min-width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.slide-image {
    width: 100%;
    max-width: 400px; /* Resim boyutlarını korur */
    height: auto;
    object-fit: cover; /* Resmin kapsayıcıya oturmasını sağlar */
    transition: transform 0.5s ease-in-out; /* Görselin kayarken büyümesi */
}

/* Yenilikçi animasyon */
.slide-item.active .slide-image {
    transform: scale(1.05); /* Resmi büyütme */
}


        p {
            font-size: 18px;
            color: #555;
        }

        .controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        /* Sepete Ekle Butonu */
        .auto-style15 {
            font-size: 16px;
            padding: 12px 20px;
            color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s ease;
            text-align: center;
        }

        .auto-style15:hover {
            background-color: #FF8C1A; /* Hover durumunda daha açık turuncu */
            transform: scale(1.05); /* Hoverda buton büyüsün */
        }

        .auto-style15:active {
            background-color: #E65C00; /* Tıklanma durumunda daha koyu turuncu */
            transform: scale(1); /* Tıklanırken boyut eski haline dönsün */
        }

        .auto-style15:focus {
            outline: none; /* Butona odaklanıldığında kenar çerçevesini kaldır */
            box-shadow: 0 0 8px rgba(255, 111, 0, 0.8); /* Fırıldak etki */
        }

        .product-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
        }

        #sepet {
            max-height: 300px;
            overflow-y: auto;
            border: 2px solid #007bff;
            border-radius: 10px;
            padding: 25px;
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
            height: 60px;
            width: 60px;
            margin-right: 10px;
        }

        .sepet-total {
            font-weight: bold;
            margin-top: 10px;
            font-size: 20px;
        }

        .auto-style34 {
            width: 527px;
        }
    </style>

    <div style="text-align: center; margin-top: 20px; margin-bottom: 50px;">
        <input type="text" id="searchInput" placeholder="Aradığın Ürün Vistora' da..." 
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
                    <p><%# Eval("UrunAciklama") %></p>

                    <div class="product-info">
                        <div class="controls">
                            <button class="auto-style15" type="button" onclick="startAutoSlide(this)">
                                <strong>Devam Et</strong>
                            </button>
                            <button class="auto-style15" type="button" onclick="stopAutoSlide(this)">
                                <strong>Durdur</strong>
                            </button>
                            <asp:Button class="auto-style15" ID="btnSepeteEkle" runat="server" Text="Sepete Ekle" 
                                        OnClick="SepeteEkle_Click" CommandArgument='<%# Eval("UrunAdi") %>' /> 
                        </div>

                        <div>
                            <asp:Label ID="lblUrunAdi" runat="server" Text='<%# Eval("UrunAdi") %>' Visible="true"></asp:Label>
                            <asp:Label ID="lblUrunFiyati" runat="server" Text='<%# Eval("UrunFiyat") %>' Visible="true"></asp:Label>
                        </div>
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
                    item.style.display = "";
                } else {
                    item.style.display = "none";
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
                    slide.classList.remove('active'); // Önce aktif sınıfı kaldır
                    slide.style.transform = `translateX(-${slideIndex * 100}%)`; // Yeni kaydırma

                    if (index === slideIndex) {
                        slide.classList.add('active'); // Yeni slayta aktif sınıf ekle
                    }
                });

                slideIndex = (slideIndex + 1) % slides.length;
                if (isAutoSliding) {
                    autoSlideInterval = setTimeout(showSlides, 3000); // 3 saniyede bir geçiş
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

            showSlides(); // Başlangıçta slaytları başlat

            const startButton = container.parentElement.querySelector('button[onclick*="startAutoSlide"]');
            const stopButton = container.parentElement.querySelector('button[onclick*="stopAutoSlide"]');

            startButton.onclick = startAutoSlide;
            stopButton.onclick = stopAutoSlide;
        });


    </script>
</asp:Content>
