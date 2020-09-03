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
    public partial class Admin_Home_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Deals_Click(object sender, EventArgs e)
        {
            DataTable da = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString))
            using (var cmd = new SqlCommand("reviewOrders", con))
            using (var dat = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
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

                String order_no = dr["order_no"].ToString();
                string order_date = dr["order_date"].ToString();
                String total_amount = dr["total_amount"].ToString();
                String cash_amount = dr["cash_amount"].ToString();
                String credit_amount = dr["credit_amount"].ToString();
                String payment_type = dr["payment_type"].ToString();
                String order_status = dr["order_status"].ToString();
                String remaining_days = dr["remaining_days"].ToString();
                String time_limit = dr["time_limit"].ToString();
                String Gift_Card_code_used = dr["Gift_Card_code_used"].ToString();
                String customer_name = dr["customer_name"].ToString();
                String delivery_id = dr["delivery_id"].ToString();
                String creditCard_number = dr["creditCard_number"].ToString();





                htmlTable += "<tr><td>" + order_no + "</td><td>" + order_date + "</td><td>" + total_amount + "</td><td>" + cash_amount + "</td><td>" + credit_amount
             + "</td><td>" + payment_type + "</td><td>" + order_status + "</td><td>" + remaining_days + "</td><td>" + time_limit + "</td><td>" + Gift_Card_code_used
             + "</td><td>" + customer_name + "</td><td>" + delivery_id + "</td><td>" + creditCard_number + "</td></tr>";




            }
            htmlTable += "</table>";
            lblTable.Text = htmlTable;






        }
        protected void process_Click(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("updateOrderStatusInProcess", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@Order_no", ordertoproc.Text));

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("Admin Home Page.aspx");
        }
        protected void Activate_Click(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("activateVendors", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string username = (string)(Session["username"]);

            cmd.Parameters.Add(new SqlParameter("@admin_username", username));
            cmd.Parameters.Add(new SqlParameter("@vendor_username", InputUsername.Text));
            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Vendor succesfully activated" + "');", true);


        }

        protected void CreateNewDeal_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("createTodaysDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (!string.IsNullOrEmpty(DealAmount.Text))
            {

                string username = (string)(Session["username"]);
                conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);
                cmd.Parameters.Add(new SqlParameter("@deal_amount", DealAmount.Text));
                cmd.Parameters.Add(new SqlParameter("@admin_username", username));
                cmd.Parameters.Add(new SqlParameter("@expiry_date", ExpiryDate.Text));

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Deal succesfully created" + "');", true);

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "please enter amount" + "');", true);

            }


        }

        protected void Add_Click(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("addTodaysDealOnProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.Add(new SqlParameter("@serial_no", ProductSerial.Text));
            cmd.Parameters.Add(new SqlParameter("@deal_id", DealID.Text));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage); // this is creating an instance of the listener for the sql message in this procedure or method (

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Deal successfully added to product" + "');", true);
        }


        void myConnection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + e.Message + "');", true); //this part is a pop up window that displays whatever the sql prints (either the print statements or even error messages)
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("removeExpiredDeal", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@deal_id", DealIDD.Text));

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage); // this is creating an instance of the listener for the sql message in this procedure or method (

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Deal successfully removed" + "');", true);

        }

        protected void Logout_Click(object sender, ImageClickEventArgs e)
        {
            Session["username"] = "";
            Response.Redirect("Registration.aspx", true);
        }

        protected void add_mobile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mobile Numbers.aspx", true);
        }

    }
}