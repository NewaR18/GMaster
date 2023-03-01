using Functions.Business_Logic_Layer;
using System;

namespace GarbageMaster.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        public BLL _bll;

        public Login()
        {
            _bll = new BLL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }
    }
}