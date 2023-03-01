using Functions.Data_Link_Layer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace GarbageMaster.Pages
{
    public partial class Profile : System.Web.UI.Page
    {
        private string conval = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        public DLL _dll;

        public Profile()
        {
            _dll = new DLL();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                if (FirstName.Text == "")
                {
                    DoInPageLoad();
                }
                string uname = Session["UserName"].ToString();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "Select DateReviewed from TblWasteDetails where UsernameW=@username";
                    using(SqlConnection conn=new SqlConnection(conval))
                    {
                        cmd.Connection = conn;
                        cmd.CommandTimeout = 30;
                        conn.Open();
                        cmd.Parameters.Add("@username",SqlDbType.VarChar).Value= uname;
                        using(SqlDataReader rd = cmd.ExecuteReader())
                        {
                            if (rd.HasRows)
                            {
                                while (rd.Read())
                                {
                                    DateTime dt = new DateTime();
                                    string dates2 = rd["DateReviewed"].ToString();
                                    if (rd["DateReviewed"].ToString() != "")
                                    {
                                        dt = Convert.ToDateTime(rd["DateReviewed"]);
                                        String s2 = dt.ToString("MMMM dd, yyyy");
                                        label7.Text = s2;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
        }

        protected void Update(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                try
                {
                    string name = Session["UserName"].ToString();
                    string response = "";
                    update.Visible = false;
                    Ward.ReadOnly = true;
                    FirstName.ReadOnly = true;
                    MiddleName.ReadOnly = true;
                    LastName.ReadOnly = true;
                    PhoneNo.ReadOnly = true;
                    boxforedit.Visible = true;
                    upload2.Visible = false;
                    FirstName.Attributes.CssStyle.Add("background", "EEEEEE");
                    MiddleName.Attributes.CssStyle.Add("background", "EEEEEE");
                    LastName.Attributes.CssStyle.Add("background", "EEEEEE");
                    PhoneNo.Attributes.CssStyle.Add("background", "EEEEEE");
                    Ward.Attributes.CssStyle.Add("background", "EEEEEE");
                    string fname = FirstName.Text;
                    string mname = MiddleName.Text;
                    string lname = LastName.Text;
                    string phone = PhoneNo.Text;
                    string ward = Ward.Text;
                    response = _dll.UpdateUsersTable(fname, mname, lname, phone, ward, name);
                    if (!upload2.HasFile)
                    {
                    }
                    else if (upload2.PostedFile.ContentLength > 100000)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Func()", true);
                    }
                    else
                    {
                        int length = upload2.PostedFile.ContentLength;
                        byte[] pic = new byte[length];
                        upload2.PostedFile.InputStream.Read(pic, 0, length);
                        try
                        {
                            _dll.UpdateUserImage(pic, name);
                        }
                        catch (Exception ex)

                        {
                            throw ex;
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void Makeiteditable(object sender, EventArgs e)
        {
            update.Visible = true;
            Ward.ReadOnly = false;
            FirstName.ReadOnly = false;
            MiddleName.ReadOnly = false;
            LastName.ReadOnly = false;
            PhoneNo.ReadOnly = false;
            boxforedit.Visible = false;
            upload2.Visible = true;
            FirstName.Attributes.CssStyle.Add("background", "none");
            MiddleName.Attributes.CssStyle.Add("background", "none");
            LastName.Attributes.CssStyle.Add("background", "none");
            PhoneNo.Attributes.CssStyle.Add("background", "none");
            Ward.Attributes.CssStyle.Add("background", "none");
        }

        protected void DoInPageLoad()
        {
            string name = Session["UserName"].ToString();
            List<string> list = _dll.DatafromUserTable(name);
            FirstName.Text = list[0];
            MiddleName.Text = list[1];
            LastName.Text = list[2];
            Email.Text = list[3];
            Username.Text = list[4];
            myuname.InnerText = list[4];
            myemail.InnerText = list[3];
            Ward.Text = list[5];
            PhoneNo.Text = list[6];
            SqlCommand cmd = new SqlCommand();
            DataTable dt = _dll.GetData(cmd, name);
            try
            {
                if (Request.QueryString["ImageID"] != null)
                {
                    if (dt != null)
                    {
                        Byte[] bytes = (Byte[])dt.Rows[0]["Image"];
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.AddHeader("content-disposition", "attachment;filename=" + dt.Rows[0]["Id"].ToString());
                        Response.BinaryWrite(bytes);
                        Response.Flush();
                        Response.End();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            upload2.Visible = false;
        }
    }
}