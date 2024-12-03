using System;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineMagaza
{
    public partial class AdminGiris : System.Web.UI.Page
    {
        protected void btnAdminGiris_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                // Kullanıcı adı ve şifreyi kontrol et
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM yöneticiler WHERE KullaniciAdi=@KullaniciAdi AND Sifre=@Sifre", con);
                cmd.Parameters.AddWithValue("@KullaniciAdi", txtAdminKullaniciAdi.Text);
                cmd.Parameters.AddWithValue("@Sifre", txtAdminSifre.Text);

                int result = (int)cmd.ExecuteScalar();
                if (result > 0)
                {
                    // Giriş başarılı, admin oturumu açma
                    Session["admin"] = txtAdminKullaniciAdi.Text; // Admin kullanıcı adını oturuma kaydet
                    Response.Redirect("AdminPanel.aspx"); // Yönetim paneline yönlendir
                }
                else
                {
                    lblMesaj.Text = "Kullanıcı adı veya şifre bulunamadı.";
                    lblMesaj.Visible = true; // Hata mesajını göster
                }
            }
        }
    }
}
