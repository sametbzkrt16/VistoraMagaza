using System;

namespace OnlineMagaza
{
    public partial class Iletisim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Statik verileri burada tanımlayın
                lblTelefon.Text = $"Telefon: <a href='tel:05458306849'>0545 830 68 49</a>";
                lblEmail.Text = $"E-posta: <a href='mailto:sametbozkurtceng@gmail.com'>sametbozkurtceng@gmail.com</a>";
                lblAdres.Text = $"Adres: <a href='https://www.google.com/maps/search/?api=1&query={Uri.EscapeDataString("Mahmudiye Mahallesi, Kısmet Sokak, No:14, Inegol")}' target='_blank'>Mahmudiye Mahallesi, Kısmet Sokak, No:14, Inegol</a>";
            }
        }
    }
}
