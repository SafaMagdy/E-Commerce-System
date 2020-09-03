using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Bakota
{
    public partial class removeOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void remove_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("checkandremoveExpiredoffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string offer = offerid.Text;
            cmd.Parameters.Add(new SqlParameter("@offerid", offer));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("removeOffer.aspx", true);
        }

        protected void removeAnotherOffer_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("removeOffer.aspx", true);
        }

        protected void back_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("Vendor Home Page.aspx", true);
        }
    }
}