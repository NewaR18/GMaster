using Functions.Business_Logic_Layer;
using System;
using System.Web.UI;

namespace GarbageMaster
{
    public partial class HomePage : System.Web.UI.Page
    {
        public BLL _bll;

        public HomePage()
        {
            _bll = new BLL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                string Username1 = Session["UserName"].ToString();
            }
        }
        protected void redirectingtowastepage(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                Response.Redirect("Wastedata.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Alertforclick()", true);
            }
        }
        protected void redirectingtonetworkpage(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                Response.Redirect("TableDisplay.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Alertforclick()", true);
            }
        }
        protected void redirectingtomappage(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                Response.Redirect("Maps.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Alertforclick()", true);
            }
        }
    }
}