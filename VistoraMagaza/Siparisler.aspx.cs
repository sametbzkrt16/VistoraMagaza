using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration; // ConfigurationManager için gerekli

namespace OnlineMagaza
{
    public partial class Siparisler : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSiparisler();
            }
        }

        private void LoadSiparisler()
        {
            // Kullanıcı adını oturumdan alın
            string kullaniciAdi = Session["KullaniciAdi"]?.ToString(); // Null kontrolü

            if (string.IsNullOrEmpty(kullaniciAdi))
            {
                Response.Write("<script>alert('Kullanıcı oturumu yok.');</script>");
                return;
            }

            // Bağlantı dizesini al
            string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                // Sorguyu tanımlayın
                SqlCommand cmd = new SqlCommand("SELECT SiparisId, KullaniciAdi, UrunAdi, UrunFiyat, SiparisTarihi, Adres FROM Siparisler WHERE KullaniciAdi = @KullaniciAdi", con);

                // Parametreyi ekleyin
                cmd.Parameters.Add("@KullaniciAdi", SqlDbType.NVarChar).Value = kullaniciAdi;

                // Veritabanından verileri okuyun
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    rptSiparisler.DataSource = reader;
                    rptSiparisler.DataBind();
                }
                else
                {
                    // Sipariş yoksa kullanıcıya bilgi verebilirsiniz
                    Response.Write("<script>alert('Henüz siparişiniz bulunmamaktadır.');</script>");
                }
            }
        }

    }
}
