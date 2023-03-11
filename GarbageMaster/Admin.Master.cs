using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarbageMaster
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || Session["Role"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }
        }
        protected void Dashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/Profile.aspx");
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Session["UserName"] = null;
            HttpContext.Current.Session["Role"] = null;
            Response.Redirect("../Pages/HomePage.aspx");
        }
        protected void HomeLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/HomePage.aspx");
        }
    }
}