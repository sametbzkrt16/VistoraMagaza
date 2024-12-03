using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineMagaza
{
    public partial class giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT Email FROM Kullanici WHERE KullaniciAdi = @KullaniciAdi AND Sifre = @Sifre";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@KullaniciAdi", txtKullaniciAdi.Text);
                cmd.Parameters.AddWithValue("@Sifre", txtSifre.Text);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    // Eğer kullanıcı adı ve şifre doğruysa
                    // Email değerini al ve oturuma kaydet
                    Session["KullaniciAdi"] = txtKullaniciAdi.Text;
                    Session["Email"] = reader["Email"].ToString(); // E-posta bilgisini oturuma kaydet
                    lblMesaj.Text = "Giriş başarılı!";
                    lblMesaj.Visible = true;
                    Response.Redirect("profil.aspx"); // Profil sayfasına yönlendirme
                }
                else
                {
                    lblHata.Text = "Kullanıcı adı veya şifre bulunamadı.";
                    lblHata.Visible = true;
                }
            }
        }


    }
}