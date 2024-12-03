using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineMagaza
{
    public partial class Hakkimizda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadHakkimizda();
            }

        }

        private void LoadHakkimizda()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["OnlineMagazaDBConnaction"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT Aciklama FROM Hakkimizda WHERE HakkimizdaId = 1", conn);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblHakkimizda.Text = reader["Aciklama"].ToString(); // İçeriği etiketin Text özelliğine ekle
                }
            }


        }
    }
}