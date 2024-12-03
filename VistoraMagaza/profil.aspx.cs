using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace OnlineMagaza
{
    public partial class profil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Oturumda kullanıcı adı var mı kontrol et
                if (Session["KullaniciAdi"] != null)
                {
                    
                    string kullaniciAdi = Session["KullaniciAdi"].ToString();
                    // Kullanıcı bilgilerini veritabanından al
                    LoadUserInfo(kullaniciAdi);
                }
                else
                {
                    // Kullanıcı giriş yapmamış, giriş sayfasına yönlendir
                    Response.Redirect("giris.aspx");
                }
            }
        }

        private void LoadUserInfo(string kullaniciAdi)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT KullaniciAdi, Email, EvAdresi, IsAdresi, CepTelefonu FROM Kullanici WHERE KullaniciAdi = @KullaniciAdi", con);
                cmd.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblKullaniciAdi.Text += reader["KullaniciAdi"].ToString();
                    lblEmail.Text += reader["Email"].ToString();
                    lblEvAdresi.Text += reader["EvAdresi"].ToString();
                    lblIsAdresi.Text += reader["IsAdresi"].ToString();
                    lblCepTelefonu.Text += reader["CepTelefonu"].ToString();
                }
            }
        }
       
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            // Çıkış yapma işlemleri
            Session.Clear();
            Response.Redirect("giris.aspx");
        }
    }
}
