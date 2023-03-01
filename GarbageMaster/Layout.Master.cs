using System;
using System.Web;

namespace GarbageMaster
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LinkButton3.Visible = false;
            Admin01.Visible = false;
            if (Session["UserName"] != null)
            {
                Profile01.Visible = true;
                Register01.Visible = false;
                LinkButton3.Visible = true;
            }
            if (Session["Role"] != null)
            {
                Admin01.Visible = true;
            }
        }

        protected void HomeLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/HomePage.aspx");
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/Login.aspx");
        }

        protected void UpdateData_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/Wastedata.aspx");
        }
        protected void Services_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/HomePage.aspx#services");
        }
        protected void Team_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/Teams.aspx");
        }
        protected void Admin_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/Admin.aspx");
        }
        protected void Contact_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/HomePage.aspx#contact");
        }

        protected void Profile01_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Pages/HomePage.aspx");
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
    }
}