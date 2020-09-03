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
    public partial class Customer_Home_Page : System.Web.UI.Page
    {
        protected void myConnection_InfoMessage(object sender, SqlInfoMessageEventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + e.Message + "');", true);
            Response.Write(e.Message);
        }

        protected void add_mobile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mobile Numbers.aspx", true);
        }

        protected void Page_Load1(object sender, EventArgs e)
        {

            DataTable prods = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString))

            using (var cmd = new SqlCommand("ShowProductsbyPrice", con))
            using (var dat = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                dat.Fill(prods);
            }

            string htmlTable = "<font face='Courier New' size='1'><table border='1' cellpadding='3' cellspacing='0'><tr>";
            foreach (DataColumn column in prods.Columns)
            {
                htmlTable += "<th>" + column.ColumnName + "</th>";
            }
            htmlTable += "</tr>";
            foreach (DataRow dr in prods.Rows)
            {

                string Productname = dr["product_name"].ToString();
                string fielddes = dr["product_description"].ToString();
                string fieldprice = dr["price"].ToString();
                string fieldcolor = dr["color"].ToString();

                htmlTable += "<tr><td>" + Productname + "</td><td>" + fielddes + "</td><td>" + fieldprice + "</td><td>" + fieldcolor + "</td><td>";
            }

            htmlTable += "</table>";
            lblTable.Text = htmlTable;

        }

        protected void create_wishlist_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create Wishlist.aspx", true);
        }

        protected void Page_Load2(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["Conn"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("calculatepriceOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string username = (string)Session["username"];

            cmd.Parameters.Add(new SqlParameter("@customername", username));

            SqlParameter sum = cmd.Parameters.Add("@sum", SqlDbType.Decimal);
            sum.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();  
            conn.Close();

            Label lbl_sum = new Label();
            lbl_sum.Text = "  <br /> <br />" + sum.Value.ToString() + "  <br /> <br />";
            form1.Controls.Add(lbl_sum);

            DataTable orders = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString))


            using (var cmdd = new SqlCommand("makeOrder", con))
            using (var dat = new SqlDataAdapter(cmdd))

            {
                cmdd.Parameters.Add(new SqlParameter("@customername", username));
                cmdd.CommandType = CommandType.StoredProcedure;
                dat.Fill(orders);
            }
            

            conn.InfoMessage += new SqlInfoMessageEventHandler(myConnection_InfoMessage);

            string htmlTable2 = "<font face='Courier New' size='1'><table border='1' cellpadding='3' cellspacing='0'><tr>";
            foreach (DataColumn column in orders.Columns)
            {
                htmlTable2 += "<th>" + column.ColumnName + "</th>";
            }
            htmlTable2 += "</tr>";

            foreach (DataRow dr in orders.Rows)
            {
                string fieldSerial = dr["serial_no"].ToString();
                string fieldProdName = dr["product_name"].ToString();
                string fieldCategory = dr["category"].ToString();
                string fieldProdDesc = dr["product_description"].ToString();
                string fieldFinalPrice = dr["final_price"].ToString();
                string fieldprice = dr["price"].ToString();
                string fieldcolor = dr["color"].ToString();
                string fieldAvailable = dr["available"].ToString();
                string fieldRate = dr["rate"].ToString();
                string fieldVendorName = dr["vendor_username"].ToString();
                string fieldCustomerName = dr["customer_username"].ToString();
                string fieldOrderId = dr["customer_order_id"].ToString();
                string fieldSerial2 = dr["serial_no"].ToString();
                string fieldCustomerName2 = dr["customer_name"].ToString();

                htmlTable2 += "<tr><td>" + fieldSerial + "</td><td>" + fieldProdName + "</td><td>" + fieldCategory + "</td><td>" + fieldProdDesc + "</td><td>" 
                            + fieldFinalPrice + "</td><td>" + fieldprice + "</td><td>" + fieldcolor + "</td><td>" + fieldAvailable + "</td><td>"
                            + fieldRate + "</td><td>" + fieldVendorName + "</td><td>" + fieldCustomerName + "</td><td>" + fieldOrderId + "</td><td>" + fieldSerial2 + "</td><td>" + fieldCustomerName2 + "</td><td>";
            }

            htmlTable2 += "</table>";
            Label1.Text = htmlTable2;

        }
        
        protected void specify_amount_Click(object sender, EventArgs e)
        {
            Response.Redirect("Specify Amount.aspx", true);
        }

        protected void choose_credit_card_Click(object sender, EventArgs e)
        {
            Response.Redirect("Choose Credit Card.aspx", true);
        }

        protected void Cancel_order_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cancel Order.aspx", true);
        }

        protected void Add_credit_card_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add CreditCard.aspx", true);
        }

        protected void add_or_remove_from_wishlist_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add or Remove from Wishlist.aspx", true);
        }

        protected void add_to_cart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add to Cart.aspx", true);
        }

        protected void Logout_Click(object sender, ImageClickEventArgs e)
        {
            Session["username"] = "";
            Response.Redirect("Registration.aspx", true);
        }
    }
    }

