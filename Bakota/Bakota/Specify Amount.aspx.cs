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
    public partial class Specify_Amount : System.Web.UI.Page
    {
        protected void myConnection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + e.Message + "');", true);
            Response.Write(e.Message);
        }

        protected void submit_specify_amount_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("SpecifyAmount", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            Int32 order_id = int.Parse(input_order_id.Text);
            Decimal cash = decimal.Parse(input_cach_amount.Text);
            Decimal credit = decimal.Parse(input_credit_amount.Text);
            string username = (string)Session["username"];

            cmd.Parameters.Add(new SqlParameter("@customername", username));
            cmd.Parameters.Add(new SqlParameter("@orderID", order_id));
            cmd.Parameters.Add(new SqlParameter("@cash", cash));
            cmd.Parameters.Add(new SqlParameter("@credit", credit));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }
    }
}