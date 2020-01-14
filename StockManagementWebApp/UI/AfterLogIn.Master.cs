using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementWebApp.UI
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void signOutButton_OnClick(object sender, EventArgs e)
        {
            Session["Email"] = null;
            Response.Redirect("/UI/IndexUI.aspx");
        }
    }
}