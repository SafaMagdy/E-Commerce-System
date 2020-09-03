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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_submit_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("userLogin", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string username = input_login_username.Text;
            string password = input_login_password.Text;

            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));

            SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Bit);
            SqlParameter t = cmd.Parameters.Add("@type", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            t.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString().Equals("False"))
            {
                Response.Redirect("wrong username or password.aspx" , true);
            }
            else
            {
                Session["username"] = username;
                if (t.Value.ToString().Equals("0"))
                {
                    Response.Redirect("Customer Home Page.aspx", true);
                }
                else
                {
                    if (t.Value.ToString().Equals("1"))
                    {
                        Response.Redirect("Vendor Home Page.aspx", true);
                    }
                    else
                    {
                        if (t.Value.ToString().Equals("2"))
                        {
                            Response.Redirect("Admin Home Page.aspx", true);
                        }
                        else
                        {
                            if (t.Value.ToString().Equals("3"))
                            {
                                Response.Redirect("Delivery Home Page.aspx", true);
                            }
                        }
                    }
                }
            }

        }
    }
}