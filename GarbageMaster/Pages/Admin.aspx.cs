using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Functions.Data_Link_Layer;

namespace GarbageMaster.Pages
{
    public partial class Admin : System.Web.UI.Page
    {
        public DLL _dll;
        public Admin()
        {
            _dll = new DLL();
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
                List<int> list = new List<int>();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "findaverage";
                    using (SqlConnection conn = new SqlConnection(conval))
                    {
                        cmd.Connection = conn;
                        conn.Open();
                        cmd.CommandTimeout = 30;
                        using (SqlDataReader rd = cmd.ExecuteReader())
                        {
                            if (rd.HasRows)
                            {
                                while (rd.Read())
                                {
                                    list.Add(Convert.ToInt32(rd[0]));
                                }
                            }
                        }
                    }
                }
                Label1.Text = Convert.ToString(list[0]);
                Label2.Text = Convert.ToString(list[1]);
                Label3.Text = Convert.ToString(list[2]);
                Label4.Text = Convert.ToString(list[3]);
                Label5.Text = Convert.ToString(list[4]);
                Label6.Text = Convert.ToString(list[5]);
                Label7.Text = Convert.ToString(list[6]);
                Label8.Text = Convert.ToString(list[7]);
                Label9.Text = Convert.ToString(list[8]);
                Label10.Text = Convert.ToString(list[9]);
                Label11.Text = Convert.ToString(list[10]);
                Label12.Text = Convert.ToString(list[11]);
                Label13.Text = Convert.ToString(list[12]);
                Label14.Text = Convert.ToString(list[13]);
                Label15.Text = Convert.ToString(list[14]);
                Label16.Text = Convert.ToString(list[15]);
                Label17.Text = Convert.ToString(list[16]);
                Label18.Text = Convert.ToString(list[17]);
                Label19.Text = Convert.ToString(list[18]);
                Label20.Text = Convert.ToString(list[19]);
                Label21.Text = Convert.ToString(list[20]);
                Label22.Text = Convert.ToString(list[21]);
                Label23.Text = Convert.ToString(list[22]);
                Label24.Text = Convert.ToString(list[23]);
                Label25.Text = Convert.ToString(list[24]);
                Label26.Text = Convert.ToString(list[25]);
                Label27.Text = Convert.ToString(list[26]);
                Label28.Text = Convert.ToString(list[27]);
                Label29.Text = Convert.ToString(list[28]);
                Label30.Text = Convert.ToString(list[29]);
                Label31.Text = Convert.ToString(list[30]);
                Label32.Text = Convert.ToString(list[31]);
            }
        }
        private void GetData()
        {
            DataTable table = _dll.Extractwastedata();
            GridView1.DataSource = table;
            int a = table.Rows.Count;
            if (a != 0)
            {
                GridView1.DataBind();
            }

        }
    }
}