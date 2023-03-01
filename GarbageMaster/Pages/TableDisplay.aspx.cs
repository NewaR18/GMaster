using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Xml.Linq;
using Functions.Data_Link_Layer;

namespace GarbageMaster.Pages
{
    public partial class TableDisplay : System.Web.UI.Page
    {
        public DLL _dll;
        public TableDisplay()
        {
            _dll = new DLL();
        }
        string conval=ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            dvouter.Visible = true;
            if (Session["UserName"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                GetWardData();
                GetData();
            }
        }
        private void GetData()
        {
            string name = Session["UserName"].ToString();
            DataTable table = _dll.Extractdata(name);
            GridView1.DataSource = table;
            int a=table.Rows.Count;
            if(a!=0)
            {
                dvouter.Visible = false;
                GridView1.DataBind();
            }
            
        }
        private void GetWardData()
        {
            string uname = Session["UserName"].ToString();
            List<string> list = _dll.getwarddetail(uname);
            txtLocation.Text = list[0];
            txtWard.Text = list[1];
            txtEmail.Text = list[2];
            txtPhone.Text = list[3];
            txtChief.Text = list[4];
            txtChiefPhone.Text = list[5];
        }
        protected void lnkWaste_Click(object sender, EventArgs e)
        {
            if (Session["UserName"]!= null)
            {
                Response.Redirect("Wastedata.aspx");
            }
        }
    }
}