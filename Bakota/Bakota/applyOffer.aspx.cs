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
    public partial class applyOffer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void apply_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("applyOffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string serialno = serial.Text;
            string offer = offerid.Text;

            cmd.Parameters.Add(new SqlParameter("@serial", serialno));
            cmd.Parameters.Add(new SqlParameter("@offerid", offer));


            string Vname = (string)(Session["username"]);
            cmd.Parameters.Add(new SqlParameter("@vendorname", Vname));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }


        void myConnection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + e.Message + "');", true);
        }

        protected void ApplyAnotherOffer_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            Response.Redirect("applyOffer.aspx", true);
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