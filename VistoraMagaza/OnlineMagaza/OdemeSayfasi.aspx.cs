using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;

namespace OnlineMagaza
{
    public partial class OdemeSayfasi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Kullanıcının oturum bilgilerini alın
            string kullaniciAdi = Session["KullaniciAdi"]?.ToString(); // Null kontrolü

            if (string.IsNullOrEmpty(kullaniciAdi))
            {
                // Kullanıcı oturumu yoksa yönlendirin
                Response.Redirect("giris.aspx"); // Giriş sayfasına yönlendir
                return;
            }
        }

        protected void btnOdemeTamamla_Click(object sender, EventArgs e)
        {
            // Kullanıcının girdiği bilgileri al
            string ad = txtAd.Text;
            string adres = txtAdres.Text;
            string kartNo = txtKartNo.Text;
            string sonKullanma = txtSonKullanma.Text;
            string cvv = txtCvv.Text;

            // Kullanıcının oturum bilgilerini alın
            string kullaniciAdi = Session["KullaniciAdi"]?.ToString(); // Null kontrolü

            // Sepet bilgilerini kontrol et
            if (Session["Sepet"] is List<Tuple<string, decimal>> sepet)
            {
                var sepetUrunleri = new List<Urun>();
                foreach (var item in sepet)
                {
                    sepetUrunleri.Add(new Urun { UrunAdi = item.Item1, UrunFiyat = item.Item2 });
                }

                if (sepetUrunleri.Count == 0)
                {
                    // Sepet boşsa kullanıcıyı bilgilendirin
                    lblHataMesaji.Text = "Sepetiniz boş. Lütfen ürün ekleyin.";
                    lblHataMesaji.Visible = true;
                    return; // Sepet boşsa yönlendirme yapma
                }

                // Sipariş bilgilerini veritabanına kaydedin
                string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;

                try
                {
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        foreach (var urun in sepetUrunleri)
                        {
                            string query = "INSERT INTO Siparisler (KullaniciAdi, UrunAdi, UrunFiyat, SiparisTarihi, Adres) VALUES (@KullaniciAdi, @UrunAdi, @UrunFiyat, @SiparisTarihi, @Adres)";
                            SqlCommand cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
                            cmd.Parameters.AddWithValue("@UrunAdi", urun.UrunAdi);
                            cmd.Parameters.AddWithValue("@UrunFiyat", urun.UrunFiyat);
                            cmd.Parameters.AddWithValue("@SiparisTarihi", DateTime.Now);
                            cmd.Parameters.AddWithValue("@Adres", adres);
                            cmd.ExecuteNonQuery();
                        }
                    }

                    string whatsappNumber = "905458306849"; // Telefon numarası
                    string message = $"Merhaba, adım {ad}. Adresim: {adres}. Kredi kartı numaram: {kartNo}. Son kullanma tarihi: {sonKullanma}. CVV: {cvv}.";
                    string url = $"https://wa.me/{whatsappNumber}?text={Uri.EscapeDataString(message)}";
                    Response.Redirect(url);
                }
                catch (Exception ex)
                {
                    // Hata oluşursa kullanıcıya bildirin
                    lblHataMesaji.Text = $"Sipariş kaydı sırasında bir hata oluştu: {ex.Message}";
                    lblHataMesaji.Visible = true;
                }
            }
            else
            {
                // Sepet, beklenen türde değil
                Response.Redirect("Urunler.aspx");
            }
        }
    }

    // Urun sınıfının tanımı
    public class Urun
    {
        public string UrunAdi { get; set; }
        public decimal UrunFiyat { get; set; }
    }
}
