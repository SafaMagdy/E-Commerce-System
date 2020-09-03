using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bakota
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void cust_reg_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer Registration.aspx", true);
        }

        protected void vend_reg_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vendor Registration.aspx" , true);
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", true);
        }
    }
}