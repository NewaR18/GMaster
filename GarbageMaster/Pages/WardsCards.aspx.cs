using Functions.Data_Link_Layer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GarbageMaster.Pages
{
    public partial class WardsCards : System.Web.UI.Page
    {
        public DLL _dll2;
        public WardsCards()
        {
            _dll2= new DLL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            List<int> list2 = _dll2.getaverage();
            Label1.Text = list2[0].ToString();
            Label2.Text = list2[1].ToString();
            Label3.Text = list2[2].ToString();
            Label4.Text = list2[3].ToString();
            Label5.Text = list2[4].ToString();
            Label6.Text = list2[5].ToString();
            Label7.Text = list2[6].ToString();
            Label8.Text = list2[7].ToString();
            Label9.Text = list2[8].ToString();
            Label10.Text = list2[9].ToString();
            Label11.Text = list2[10].ToString();
            Label12.Text = list2[11].ToString();
            Label13.Text = list2[12].ToString();
            Label14.Text = list2[13].ToString();
            Label15.Text = list2[14].ToString();
            Label16.Text = list2[15].ToString();
            Label17.Text = list2[16].ToString();
            Label18.Text = list2[17].ToString();
            Label19.Text = list2[18].ToString();
            Label20.Text = list2[19].ToString();
            Label21.Text = list2[20].ToString();
            Label22.Text = list2[21].ToString();
            Label23.Text = list2[22].ToString();
            Label24.Text = list2[23].ToString();
            Label25.Text = list2[24].ToString();
            Label26.Text = list2[25].ToString();
            Label27.Text = list2[26].ToString();
            Label28.Text = list2[27].ToString();
            Label29.Text = list2[28].ToString();
            Label30.Text = list2[29].ToString();
            Label31.Text = list2[30].ToString();
            Label32.Text = list2[31].ToString();
            string json = JsonConvert.SerializeObject(list2);
            string script = $"MakeitColorized({json});";
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", script, true);
        }
    }
}