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
    public partial class editProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void edit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("EditProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string serial = p_serial.Text;
            string name = p_name.Text;
            string cat = p_category.Text;
            string desc = p_desc.Text;
            string price = p_price.Text;
            string color = p_color.Text;

            cmd.Parameters.Add(new SqlParameter("@serialnumber", serial));
            if (!string.IsNullOrWhiteSpace(name))
                cmd.Parameters.Add(new SqlParameter("@product_name", name));
            else
                cmd.Parameters.Add(new SqlParameter("@product_name", DBNull.Value));

            if (!string.IsNullOrWhiteSpace(cat))
                cmd.Parameters.Add(new SqlParameter("@category", cat));
            else
                cmd.Parameters.Add(new SqlParameter("@category", DBNull.Value));

            if (!string.IsNullOrWhiteSpace(desc))
                cmd.Parameters.Add(new SqlParameter("@product_description", desc));
            else
                cmd.Parameters.Add(new SqlParameter("@product_description", DBNull.Value));

            if (!string.IsNullOrWhiteSpace(price))
                cmd.Parameters.Add(new SqlParameter("@price", price));
            else
                cmd.Parameters.Add(new SqlParameter("@price", DBNull.Value));

            if (!string.IsNullOrWhiteSpace(color))
                cmd.Parameters.Add(new SqlParameter("@color", color));
            else
                cmd.Parameters.Add(new SqlParameter("@color", DBNull.Value));

            string Vname = (string)(Session["username"]);
            cmd.Parameters.Add(new SqlParameter("@vendorname", Vname));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        void myConnection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Serial Number is Incorrect" + "');", true);

        }

        protected void EditAnotherProduct_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();

            Response.Redirect("editProduct.aspx", true);
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