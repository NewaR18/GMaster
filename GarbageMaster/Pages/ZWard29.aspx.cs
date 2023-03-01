using Functions.Data_Link_Layer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Functions.Business_Logic_Layer;

namespace GarbageMaster.Pages
{
    public partial class ZWard29 : System.Web.UI.Page
    {
        public DLL _dll;
        public BLL _bll;
        public ZWard29()
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
                Label29.Text = Convert.ToString(list[28]);
            }
        }
        private void GetData()
        {
            DataTable table = _dll.Extractwastewithwarddata(29);
            GridView1.DataSource = table;
            int a = table.Rows.Count;
            if (a != 0)
            {
                GridView1.DataBind();
            }

        }
        protected void TruckSent(object sender, EventArgs e)
        {
            _bll.mailsend(Label29.Text, 29);
        }
        protected void Checkedout(object sender, EventArgs e)
        {
            _dll.setonfire(29);
            Response.Redirect("ZWard29.aspx");
        }
    }
}