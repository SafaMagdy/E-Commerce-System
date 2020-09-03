using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bakota
{
    public partial class Delivery_Person_Home_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

         protected void add_mobile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mobile Numbers.aspx", true);
        }

        protected void Logout_Click(object sender, ImageClickEventArgs e)
        {
            Session["username"] = "";
            Response.Redirect("Registration.aspx", true);
        }
    }
}