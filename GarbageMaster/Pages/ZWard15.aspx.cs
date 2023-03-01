using Functions.Business_Logic_Layer;
using Functions.Data_Link_Layer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarbageMaster.Pages
{
    public partial class ZWard15 : System.Web.UI.Page
    {
        public DLL _dll;
        public BLL _bll;
        public ZWard15()
        {
            _dll = new DLL();
            _bll = new BLL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || Session["Role"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                GetData();
                string conval = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
                List<int> list = _dll.getaverage();
                Label15.Text = Convert.ToString(list[14]);
            }
        }
        private void GetData()
        {
            DataTable table = _dll.Extractwastewithwarddata(15);
            GridView1.DataSource = table;
            int a = table.Rows.Count;
            if (a != 0)
            {
                GridView1.DataBind();
            }

        }
        protected void TruckSent(object sender, EventArgs e)
        {
            _bll.mailsend(Label15.Text, 15);
        }
        protected void Checkedout(object sender, EventArgs e)
        {
            _dll.setonfire(15);
            Response.Redirect("ZWard15.aspx");
        }
    }
}