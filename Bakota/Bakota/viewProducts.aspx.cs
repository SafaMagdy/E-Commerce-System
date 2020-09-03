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
    public partial class viewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable da = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString))
            using (var cmd = new SqlCommand("vendorviewProducts", con))
            using (var dat = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@vendorname", (string)(Session["username"])));
                dat.Fill(da);
            }

            string htmlTable = "<font face='Courier New' size='1'><table border='1' cellpadding='3' cellspacing='0'><tr>";
            foreach (DataColumn column in da.Columns)
            {
                htmlTable += "<th>" + column.ColumnName + "</th>";
            }
            htmlTable += "</tr>";
            foreach (DataRow dr in da.Rows)
            {

                String serial_no = dr["serial_no"].ToString();
                string product_name = dr["product_name"].ToString();
                String category = dr["category"].ToString();
                String product_description = dr["product_description"].ToString();
                String price = dr["price"].ToString();
                String final_price = dr["final_price"].ToString();
                String color = dr["color"].ToString();
                String available = dr["available"].ToString();
                String rate = dr["rate"].ToString();
                String vendor_username = dr["vendor_username"].ToString();
                String customer_username = dr["customer_username"].ToString();
                String customer_order_id = dr["customer_order_id"].ToString();

                htmlTable += "<tr><td>" + serial_no + "</td><td>" + product_name + "</td><td>" + category + "</td><td>" + product_description + "</td><td>" + price
                    + "</td><td>" + final_price + "</td><td>" + color + "</td><td>" + available + "</td><td>" + rate + "</td><td>" + vendor_username
                    + "</td><td>" + customer_username + "</td><td>" + customer_order_id + "</td></tr>";
            }

            htmlTable += "</table>";
            lblTable.Text = htmlTable;
        }
    }
}