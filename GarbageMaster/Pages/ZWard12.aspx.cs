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
    public partial class ZWard12 : System.Web.UI.Page
    {
        public DLL _dll;
        public BLL _bll;
        public ZWard12()
        {
            _dll = new DLL();
            _bll= new BLL();
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
                Label12.Text = Convert.ToString(list[11]);
            }
        }
        private void GetData()
        {
            DataTable table = _dll.Extractwastewithwarddata(12);
            GridView1.DataSource = table;
            int a = table.Rows.Count;
            if (a != 0)
            {
                GridView1.DataBind();
            }

        }
        protected void TruckSent(object sender, EventArgs e)
        {
            _bll.mailsend(Label12.Text, 12);
        }
        protected void Checkedout(object sender, EventArgs e)
        {
            _dll.setonfire(12);
            Response.Redirect("ZWard12.aspx");
        }
    }
}