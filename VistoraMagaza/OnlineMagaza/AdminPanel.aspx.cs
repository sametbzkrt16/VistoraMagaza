using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.Helpers;

namespace OnlineMagaza
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("AdminGiris.aspx");
            }

            if (!IsPostBack)
            {
                LoadCategories();
                LoadProducts();
                lblMesaj.Visible = false; // Hide message label initially


            }
        }

        private void LoadCategories()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT KategoriId, KategoriAd FROM Kategoriler", con);
                SqlDataReader reader = cmd.ExecuteReader();
                ddlKategori.Items.Clear();
                ddlGuncelKategori.Items.Clear();
                while (reader.Read())
                {
                    ListItem item = new ListItem(reader["KategoriAd"].ToString(), reader["KategoriId"].ToString());
                    ddlKategori.Items.Add(item);
                    ddlGuncelKategori.Items.Add(item);
                }
            }
        }

        private void LoadProducts()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT UrunAdi FROM Urunler", con);
                SqlDataReader reader = cmd.ExecuteReader();
                ddlSilinecekUrun.Items.Clear();
                ddlGuncellenecekUrun.Items.Clear();
                while (reader.Read())
                {
                    string urunAdi = reader["UrunAdi"].ToString();
                    ddlSilinecekUrun.Items.Add(urunAdi);
                    ddlGuncellenecekUrun.Items.Add(urunAdi);
                }
            }
        }

        

        protected void btnUrunEkle_Click(object sender, EventArgs e)
        {
            if (fileUploadResim.HasFile && fileUploadResim1.HasFile && fileUploadResim2.HasFile)
            {
                string fileName = Path.GetFileName(fileUploadResim.FileName);
                string fileName1 = Path.GetFileName(fileUploadResim1.FileName);
                string fileName2 = Path.GetFileName(fileUploadResim2.FileName);
                string filePath = Server.MapPath("~/Resimler/") + fileName;
                string filePath1 = Server.MapPath("~/Resimler/") + fileName1;
                string filePath2 = Server.MapPath("~/Resimler/") + fileName2;

                // Resimleri kaydediyoruz
                fileUploadResim.SaveAs(filePath);
                fileUploadResim1.SaveAs(filePath1);
                fileUploadResim2.SaveAs(filePath2);

                string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    // Veritabanına birden fazla resim ekleniyor
                    SqlCommand cmd = new SqlCommand("INSERT INTO Urunler (UrunAdi, UrunFiyat, UrunAciklama, UrunResim, UrunResim1, UrunResim2, KategoriId) VALUES (@UrunAdi, @UrunFiyat, @UrunAciklama, @UrunResim, @UrunResim1, @UrunResim2, @KategoriId)", con);
                    cmd.Parameters.AddWithValue("@UrunAdi", txtUrunAd.Text);
                    cmd.Parameters.AddWithValue("@UrunFiyat", txtUrunFiyat.Text);
                    cmd.Parameters.AddWithValue("@UrunAciklama", txtUrunAciklama.Text);
                    cmd.Parameters.AddWithValue("@UrunResim", fileName);
                    cmd.Parameters.AddWithValue("@UrunResim1", fileName1);
                    cmd.Parameters.AddWithValue("@UrunResim2", fileName2);
                    cmd.Parameters.AddWithValue("@KategoriId", ddlKategori.SelectedValue);
                    cmd.ExecuteNonQuery();

                    lblMesaj.Text = "Ürün başarıyla eklendi!";
                    lblMesaj.Visible = true;
                    LoadProducts();
                }
            }
            else
            {
                lblMesaj.Text = "Lütfen üç resim yükleyin.";
                lblMesaj.ForeColor = System.Drawing.Color.Red;
                lblMesaj.Visible = true;
            }
        }

        protected void btnUrunSil_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Urunler WHERE UrunAdi=@UrunAdi", con);
                cmd.Parameters.AddWithValue("@UrunAdi", ddlSilinecekUrun.SelectedValue);
                cmd.ExecuteNonQuery();
                lblMesaj.Text = "Ürün başarıyla silindi!";
                lblMesaj.Visible = true;
                LoadProducts();
            }
        }

        protected void btnUrunGuncelle_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Eski ürünü almak için bir sorgu yapıyoruz
                string eskiResim = ""; // Eski resmin değerini tutmak için bir değişken
                SqlCommand cmdGetOldImage = new SqlCommand("SELECT UrunResim FROM Urunler WHERE UrunAdi=@EskiUrunAdi", con);
                cmdGetOldImage.Parameters.AddWithValue("@EskiUrunAdi", ddlGuncellenecekUrun.SelectedValue);

                // Eski resmi veritabanından alıyoruz
                SqlDataReader reader = cmdGetOldImage.ExecuteReader();
                if (reader.Read())
                {
                    eskiResim = reader["UrunResim"].ToString();
                }
                reader.Close(); // Reader'ı kapatmayı unutmayın

                SqlCommand cmd = new SqlCommand("UPDATE Urunler SET UrunAdi=@YeniUrunAdi, UrunFiyat=@YeniUrunFiyat, UrunAciklama=@YeniUrunAciklama, UrunResim=@YeniUrunResim, KategoriId=@YeniKategoriId WHERE UrunAdi=@EskiUrunAdi", con);

                cmd.Parameters.AddWithValue("@YeniUrunAdi", txtGuncelUrunAd.Text);
                cmd.Parameters.AddWithValue("@YeniUrunFiyat", txtGuncelFiyat.Text);
                cmd.Parameters.AddWithValue("@YeniUrunAciklama", txtGuncelAciklama.Text);
                cmd.Parameters.AddWithValue("@YeniKategoriId", ddlGuncelKategori.SelectedValue);

                // Resim yüklenmişse yeni resmi ekle
                if (fileUploadGuncelResim.HasFile)
                {
                    string fileName = Path.GetFileName(fileUploadGuncelResim.FileName);
                    string filePath = Server.MapPath("~/Resimler/") + fileName;
                    fileUploadGuncelResim.SaveAs(filePath);
                    cmd.Parameters.AddWithValue("@YeniUrunResim", fileName); // Burada yeni resmi parametre olarak ekliyoruz
                }
                else
                {
                    // Yeni resim yüklenmemişse, eski resmi koru
                    cmd.Parameters.AddWithValue("@YeniUrunResim", eskiResim);
                }

                cmd.Parameters.AddWithValue("@EskiUrunAdi", ddlGuncellenecekUrun.SelectedValue);
                cmd.ExecuteNonQuery();
                lblMesaj.Text = "Ürün başarıyla güncellendi!";
                lblMesaj.Visible = true;
                LoadProducts();
            }
        }

        protected void btnHakkimizdaEkle_Click(object sender, EventArgs e)
        {
            string aciklama = txtHakkimizda.Text;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString))
            {
                string query = "UPDATE Hakkimizda SET Aciklama = @Aciklama  WHERE HakkimizdaId = 1"; // Güncelleme sorgusu
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Aciklama", aciklama);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            lblMesaj.Text = "Hakkımızda bilgileri başarıyla güncellendi!"; // Kullanıcıya mesaj göster
            lblMesaj.Visible = true;
        }
        



        protected void btnAnaSayfa_Click(object sender, EventArgs e)
        {
            Response.Redirect("Urunler.aspx"); // Anasayfa sayfasına yönlendir

        }

    }
}
