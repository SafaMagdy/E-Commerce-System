using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Bakota
{
    public partial class Create_Wishlist : System.Web.UI.Page
    {
        protected void myConnection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + e.Message + "');", true);
            Response.Write(e.Message);
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("createWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string customername = (string)(Session["username"]);
            string wishlistname = input_wishlist_name.Text; ;

            cmd.Parameters.Add(new SqlParameter("@customername", customername));
            cmd.Parameters.Add(new SqlParameter("@name", wishlistname));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}