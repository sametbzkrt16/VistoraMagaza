using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineMagaza
{
    public partial class kullanıcı : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Sayfa ilk yüklendiğinde sepeti göster
            {
                SepetiGoster();
            }
        }
        protected void btnGirisYap_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("giris.aspx"); // Giriş sayfasına yönlendir
        }
        protected void btnSepetiSatinal_Click(object sender, EventArgs e)
        {
            if (Session["Sepet"] != null && ((List<Tuple<string, decimal>>)Session["Sepet"]).Count > 0)
            {
                Response.Redirect("OdemeSayfasi.aspx");
            }
            else
            {
                // Sepet boşsa kullanıcıya bir mesaj gösterebilirsiniz
                // Örneğin: lblMesaj.Text = "Sepetinizde ürün yok.";
            }
        }


        private void SepetiGoster()
        {
            // Sepet varsa, içeriğini göster
            if (Session["Sepet"] != null && ((List<Tuple<string, decimal>>)Session["Sepet"]).Count > 0)
            {
                List<Tuple<string, decimal>> sepet = (List<Tuple<string, decimal>>)Session["Sepet"];

                // Sepet içeriğini Repeater'a bağla
                rptSepet.DataSource = sepet.Select((item, index) => new { UrunAdi = item.Item1, UrunFiyati = item.Item2, Index = index });
                rptSepet.DataBind();

                // Toplam fiyat hesaplama
                decimal toplamFiyat = sepet.Sum(item => item.Item2);
                lblToplamFiyat.Text = $"Toplam: {toplamFiyat:C}";
                lblMesaj.Visible = false;  // Eğer ürün varsa mesaj gizlenir
            }
            else
            {
                // Sepet boşsa mesaj göster
                lblMesaj.Text = "Sepetinizde ürün yok.";
                lblMesaj.Visible = true;  // Sepetin boş olduğunu belirt
                rptSepet.DataSource = null; // Repeater temizlenir
                rptSepet.DataBind();
                lblToplamFiyat.Text = ""; // Toplam fiyat boş
            }
        }

    
        protected void Sil_Click(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            List<Tuple<string, decimal>> sepet = (List<Tuple<string, decimal>>)Session["Sepet"];

            if (sepet != null && index >= 0 && index < sepet.Count)
            {
                sepet.RemoveAt(index);
                Session["Sepet"] = sepet;
            }

            // Sayfayı yenile
            Response.Redirect(Request.RawUrl);
        }

    }
}