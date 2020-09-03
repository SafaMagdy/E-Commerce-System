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
    public partial class addOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("addOffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string offer_amount = amount.Text;
            string expiry = exp.Text;


            cmd.Parameters.Add(new SqlParameter("@offeramount", offer_amount));
            cmd.Parameters.Add(new SqlParameter("@expiry_date", expiry));

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("Offer Added Successfully");
        }

        protected void AddAnotherOffer_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("addOffer.aspx", true);
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