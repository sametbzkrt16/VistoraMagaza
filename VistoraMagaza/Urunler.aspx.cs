using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System;



namespace OnlineMagaza
{
    public partial class Urunler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                UrunleriYukle();
            }
        }


        private void UrunleriYukle()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT UrunAdi, UrunResim, UrunResim1, UrunResim2, UrunFiyat, UrunAciklama FROM Urunler";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptUrunler.DataSource = dt;
                    rptUrunler.DataBind();
                }
                catch (Exception ex)
                {
                    // Hata işleme (örneğin: loglama)
                    Console.WriteLine("Hata: " + ex.Message);
                }
            }
        }

        protected void SepeteEkle_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender; // Buton nesnesini al
            RepeaterItem item = (RepeaterItem)button.NamingContainer; // Butonun ait olduğu RepeaterItem'i al

            // Ürün bilgilerini almak için kontrol nesnelerini bul
            string urunAdi = ((Label)item.FindControl("lblUrunAdi")).Text;
            string urunFiyatiText = ((Label)item.FindControl("lblUrunFiyati")).Text;

            // Debugging için fiyatı konsola yazdır
            Console.WriteLine("Ürün Fiyatı: " + urunFiyatiText); // Konsola yazdır

            decimal urunFiyati;

            // Fiyatı parse etmeye çalış
            if (decimal.TryParse(urunFiyatiText, out urunFiyati))
            {
                // Sepet kontrolü (Session kullanarak)
                List<Tuple<string, decimal>> sepet = Session["Sepet"] as List<Tuple<string, decimal>> ?? new List<Tuple<string, decimal>>();
                sepet.Add(new Tuple<string, decimal>(urunAdi, urunFiyati));
                Session["Sepet"] = sepet;

                // Sepet güncellendikten sonra sayfayı yenileyelim
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                // Hata mesajı gösterme veya loglama
                Console.WriteLine("Fiyat biçimi hatalı: " + urunFiyatiText);
            }
        }
       
    }
}