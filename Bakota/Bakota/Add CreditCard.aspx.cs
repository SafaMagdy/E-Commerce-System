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
    public partial class Add_CreditCard : System.Web.UI.Page
    {
        protected void myConnection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + e.Message + "');", true);
            Response.Write(e.Message);
        }


        protected void Add_credit_button_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("AddCreditCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string creditnumber = creditcardnumber.Text;
            string cvv = cc.Text;
            DateTime expirydate = DateTime.Parse(doe.Text);
            cmd.Parameters.Add(new SqlParameter("@expirydate", expirydate));


            string field1 = (string)(Session["username"]);

            cmd.Parameters.Add(new SqlParameter("@creditcardnumber", creditnumber));
            cmd.Parameters.Add(new SqlParameter("@cvv", cvv));
            cmd.Parameters.Add(new SqlParameter("@customername", field1));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


        }

    }
}
