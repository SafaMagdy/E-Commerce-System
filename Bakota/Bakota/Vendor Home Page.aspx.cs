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
    public partial class Vendor_Home_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void postProduct_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("newProduct.aspx", true);
        }

        protected void viewProducts_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("viewProducts.aspx", true);
        }

        protected void editProduct_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("editProduct.aspx", true);
        }

        protected void addOffer_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("addOffer.aspx", true);
        }

        protected void applyOffer_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("applyOffer.aspx", true);
        }

        protected void removeOffer_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("removeOffer.aspx", true);
        }

        protected void add_mobile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mobile Numbers.aspx", true);
        }

        protected void Logout_Click(object sender, ImageClickEventArgs e)
        {
            Session["username"] = "";
            Response.Redirect("Registration.aspx", true);
        }
    }
}