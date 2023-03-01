using Functions.Data_Link_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarbageMaster.Pages
{
    public partial class Admin2 : System.Web.UI.Page
    {
        public DLL _dll;
        public Admin2() { 
            _dll= new DLL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> mylist = _dll.CountUser();
            lblUsers.Text = mylist[0];
            lblGreen.Text = mylist[1];
            lblYellow.Text = mylist[2];
            lblRed.Text = mylist[3];
        }
    }
}