using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace OnlineMagaza
{
    public partial class kayit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnKayit_Click(object sender, EventArgs e)
        {
            // Hataları sıfırla
            lblHata.Visible = false;
            lblMesaj.Visible = false;

            // Zorunlu alan kontrolü
            if (string.IsNullOrWhiteSpace(txtKullaniciAdi.Text) ||
                string.IsNullOrWhiteSpace(txtSifre.Text) ||
                string.IsNullOrWhiteSpace(txtSifreTekrar.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtEvAdresi.Text) ||
                string.IsNullOrWhiteSpace(txtCepTelefonu.Text))
            {
                lblHata.Text = "Lütfen tüm zorunlu alanları doldurun.";
                lblHata.Visible = true;
                return;
            }

            // Şifrelerin eşleşip eşleşmediğini kontrol et
            if (txtSifre.Text != txtSifreTekrar.Text)
            {
                lblHata.Text = "Şifreler eşleşmiyor.";
                lblHata.Visible = true;
                return;
            }

            string connectionString = WebConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Kullanıcı adı ve e-posta kontrolü
                string checkQuery = "SELECT COUNT(*) FROM Kullanici WHERE KullaniciAdi = @KullaniciAdi OR Email = @Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@KullaniciAdi", txtKullaniciAdi.Text);
                checkCmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                int existingUserCount = (int)checkCmd.ExecuteScalar();

                if (existingUserCount > 0)
                {
                    lblHata.Text = "Bu kullanıcı adı veya e-posta zaten mevcut.";
                    lblHata.Visible = true;
                    return; // Kayıt işlemine devam etmeyin
                }

                // Kayıt sorgusu
                string query = "INSERT INTO Kullanici (KullaniciAdi, Sifre, Email, EvAdresi, IsAdresi, CepTelefonu) VALUES (@KullaniciAdi, @Sifre, @Email, @EvAdresi, @IsAdresi, @CepTelefonu)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@KullaniciAdi", txtKullaniciAdi.Text);
                cmd.Parameters.AddWithValue("@Sifre", txtSifre.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@EvAdresi", txtEvAdresi.Text);
                cmd.Parameters.AddWithValue("@IsAdresi", string.IsNullOrEmpty(txtIsAdresi.Text) ? (object)DBNull.Value : txtIsAdresi.Text); // İş adresi isteğe bağlı
                cmd.Parameters.AddWithValue("@CepTelefonu", txtCepTelefonu.Text);

                int result = cmd.ExecuteNonQuery();
                if (result > 0)
                {
                    lblMesaj.Text = "Kayıt başarılı! Giriş yapabilirsiniz.";
                    lblMesaj.Visible = true;
                    Response.Redirect("giris.aspx"); // Giriş sayfasına yönlendirme
                }
                else
                {
                    lblHata.Text = "Kayıt sırasında bir hata oluştu.";
                    lblHata.Visible = true;
                }
            }
        }
    }
}
