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
    public partial class Vendor_Registration : System.Web.UI.Page
    {
        protected void myConnection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + e.Message + "');", true);
            Response.Write(e.Message);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void vend_sumbit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("vendorRegister", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string username = input_vend_username.Text;
            string first_name = input_vend_first_name.Text;
            string last_name = input_vend_last_name.Text;
            string password = input_vend_password.Text;
            string email = input_vend_email.Text;
            string company_name = input_vend_company_name.Text;
            string bank_acc = input_vend_bank_acc_number.Text;

            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@first_name", first_name));
            cmd.Parameters.Add(new SqlParameter("@last_name", last_name));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@company_name", company_name));
            cmd.Parameters.Add(new SqlParameter("@bank_acc_no", bank_acc));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}