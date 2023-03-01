using System;
using System.Web.UI.WebControls;

namespace GarbageMaster.Pages
{
    public partial class Wastedata : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }
        }
    }
}