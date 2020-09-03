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
    public partial class Add_to_Cart : System.Web.UI.Page
    {
        protected void myConnection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + e.Message + "');", true);
            Response.Write(e.Message);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void add_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("addToCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string customername = (string)(Session["username"]);
            Int32 serialnum = int.Parse(serialnumber.Text);

            cmd.Parameters.Add(new SqlParameter("@customername", customername));
            cmd.Parameters.Add(new SqlParameter("@serial", serialnum));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            conn.Open();
            cmd.ExecuteNonQuery();  //not sure
            conn.Close();               //not sure 
        }

        protected void remove_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("removefromCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string customername = (string)(Session["username"]);
            try
            {
                Int32 serialnum = int.Parse(serialnumber.Text);
                cmd.Parameters.Add(new SqlParameter("@serial", serialnum));
            }
            catch
            {
                Response.Write("This is an invalid serial number");
            }
            cmd.Parameters.Add(new SqlParameter("@customername", customername));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            conn.Open();
            cmd.ExecuteNonQuery();  
            conn.Close();
        }
    }
}
