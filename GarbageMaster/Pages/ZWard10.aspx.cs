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
    public partial class ZWard10 : System.Web.UI.Page
    {
        public DLL _dll;
        public BLL _bll;
        public ZWard10()
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
                Label10.Text = Convert.ToString(list[9]);
            }
        }
        private void GetData()
        {
            DataTable table = _dll.Extractwastewithwarddata(10);
            GridView1.DataSource = table;
            int a = table.Rows.Count;
            if (a != 0)
            {
                GridView1.DataBind();
            }

        }
        protected void TruckSent(object sender, EventArgs e)
        {
            _bll.mailsend(Label10.Text, 10);
            DoSomethingAsync();
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertforTruckSent()", true);
        }
        protected async void DoSomethingAsync()
        {
            //var registrationToken = "cNt8U6DNSLKtug4UAul2F_:APA91bF1iITZTJs_u7YcgEYJa_2pcLGsqbr-WtBFpu8j9DqOC4h-RcK0Dqxad3OR1VUdWMhXxdPyeNj_31P9zhumtdtRyfpYupeLPZy6qT0AILYZUJ81WKLIjJXMIzyXaIP3gVI3YSYe";
            var message = new FirebaseAdmin.Messaging.Message()
            {
                Data = new Dictionary<string, string>()
                {
                    { "title", "Truck Arrival" },
                    { "body", "Truck will be making its rounds in your area soon, Have it properly bagged" },
                },
                Topic = "ward10",
            };
            string response = await FirebaseAdmin.Messaging.FirebaseMessaging.DefaultInstance.SendAsync(message);
        }
        protected void Checkedout(object sender, EventArgs e)
        {
            _dll.setonfire(10);
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "AlertforCheckedOut('ZWard10.aspx')", true);
        }
    }
}