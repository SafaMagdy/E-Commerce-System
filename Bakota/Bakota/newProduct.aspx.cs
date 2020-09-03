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
    public partial class newProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void post_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("postProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string name = p_name.Text;
            string cat = p_category.Text;
            string desc = p_desc.Text;
            string price = p_price.Text;
            string color = p_color.Text;

            cmd.Parameters.Add(new SqlParameter("@product_name", name));
            cmd.Parameters.Add(new SqlParameter("@category", cat));
            cmd.Parameters.Add(new SqlParameter("@product_description", desc));
            cmd.Parameters.Add(new SqlParameter("@price", price));
            cmd.Parameters.Add(new SqlParameter("@color", color));

            string Vname = (string)(Session["username"]);
            cmd.Parameters.Add(new SqlParameter("@vendorUsername", Vname));

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Write("Product Added Successfully");
           }

        protected void AnotherProduct_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("newProduct.aspx", true);
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