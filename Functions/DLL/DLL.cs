using Functions.Models;
using PqgridWithDatabase.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI.WebControls;
using System.Xml.Linq;
namespace Functions.Data_Link_Layer
{
    public class DLL
    {
        private string conval = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;

        public string InsertMessage(string Name, string Email, string Subject, string Message)
        {
            string response = "";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "insertmessage";
                using (SqlConnection conn1 = new SqlConnection(conval))
                {
                    cmd.Connection = conn1;
                    conn1.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = Name;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = Email;
                    cmd.Parameters.Add("@subject", SqlDbType.VarChar).Value = Subject;
                    cmd.Parameters.Add("@message", SqlDbType.VarChar).Value = Message;
                    using (SqlDataReader sd = cmd.ExecuteReader())
                    {
                        if (sd.HasRows)
                        {
                            while (sd.Read())
                            {
                                response = sd.GetString(0);
                            }
                        }
                    }
                }
            }
            return response;
        }

        public string RegisterUser(string FName, string MName, string LName, string Email, string UName, string Password, int Ward)
        {
            string response = "";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "RegisterUser";
                using (SqlConnection conn1 = new SqlConnection(conval))
                {
                    cmd.Connection = conn1;
                    conn1.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.Add("@fname", SqlDbType.VarChar).Value = FName;
                    cmd.Parameters.Add("@mname", SqlDbType.VarChar).Value = MName;
                    cmd.Parameters.Add("@lname", SqlDbType.VarChar).Value = LName;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = Email;
                    cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = UName;
                    cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = Password;
                    cmd.Parameters.Add("@ward", SqlDbType.VarChar).Value = Ward;
                    using (SqlDataReader sd = cmd.ExecuteReader())
                    {
                        if (sd.HasRows)
                        {
                            while (sd.Read())
                            {
                                response = sd.GetString(0);
                            }
                        }
                    }
                }
            }
            return response;
        }

        public string LoginUser(string UName, string Password)
        {
            string response = "";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "LoginUser";
                using (SqlConnection conn1 = new SqlConnection(conval))
                {
                    cmd.Connection = conn1;
                    conn1.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = UName;
                    cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = Password;
                    using (SqlDataReader sd = cmd.ExecuteReader())
                    {
                        if (sd.HasRows)
                        {
                            while (sd.Read())
                            {
                                response = sd.GetString(0);
                            }
                        }
                    }
                }
            }
            return response;
        }

        public List<string> DatafromUserTable(string name)
        {
            List<string> s2 = new List<string>();
            string fname = "";
            string mname = "";
            string lname = "";
            string email = "";
            string username = "";
            string ward = "";
            string phone = "";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select* from Users where Username=@name";
                using (SqlConnection conn1 = new SqlConnection(conval))
                {
                    cmd.Connection = conn1;
                    conn1.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.AddWithValue("@name", name);
                    using (SqlDataReader sd = cmd.ExecuteReader())
                    {
                        if (sd.HasRows)
                        {
                            while (sd.Read())
                            {
                                fname = Convert.ToString(sd["FName"]);
                                mname = Convert.ToString(sd["MName"]);
                                lname = Convert.ToString(sd["LName"]);
                                email = Convert.ToString(sd["Email"]);
                                username = Convert.ToString(sd["Username"]);
                                ward = Convert.ToString(sd["Ward"]);
                                s2.Add(fname);
                                s2.Add(mname);
                                s2.Add(lname);
                                s2.Add(email);
                                s2.Add(username);
                                s2.Add(ward);
                            }
                        }
                    }
                }
            }
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select* from ExtraUserData where Username=@name";
                using (SqlConnection conn1 = new SqlConnection(conval))
                {
                    cmd.Connection = conn1;
                    conn1.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.AddWithValue("@name", name);
                    using (SqlDataReader sd = cmd.ExecuteReader())
                    {
                        if (sd.HasRows)
                        {
                            while (sd.Read())
                            {
                                phone = Convert.ToString(sd["PhoneNo"]);
                                s2.Add(phone);
                            }
                        }
                    }
                }
            }
            return s2;
        }

        public DataTable GetData(SqlCommand cmd, string name)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(conval);
            SqlDataAdapter sda = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select* from ExtraUserData where Username=@name";
            cmd.Connection = con;
            cmd.Parameters.AddWithValue("@name", name);

            try
            {
                con.Open();
                sda.SelectCommand = cmd;
                sda.Fill(dt);
                return dt;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
                sda.Dispose();
                con.Dispose();
            }
        }

        public string UpdateUsersTable(string fname, string mname, string lname, string phone, string ward, string name)
        {
            string response = "";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "UpdateProfile";
                using (SqlConnection conn1 = new SqlConnection(conval))
                {
                    cmd.Connection = conn1;
                    conn1.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.AddWithValue("@fname", fname);
                    cmd.Parameters.AddWithValue("@mname", mname);
                    cmd.Parameters.AddWithValue("@lname", lname);
                    cmd.Parameters.AddWithValue("@phone", phone);
                    cmd.Parameters.AddWithValue("@ward", ward);
                    cmd.Parameters.AddWithValue("@name", name);
                    using (SqlDataReader sd = cmd.ExecuteReader())
                    {
                        if (sd.HasRows)
                        {
                            while (sd.Read())
                            {
                                response = sd.GetString(0);
                            }
                        }
                    }
                }
            }
            return response;
        }

        public void UpdateUserImage(byte[] pic, string name)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Update ExtraUserData set Image=@img where Username=@name";
                using (SqlConnection conn = new SqlConnection(conval))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.Add("@img", SqlDbType.Image).Value = pic;
                    cmd.Parameters.AddWithValue("@name", name);
                    int n = cmd.ExecuteNonQuery();
                }
            }
        }

        public string InsertWasteData(int n,string uname)
        {
            string response="";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "updatewastedata";
                using (SqlConnection conn = new SqlConnection(conval))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.AddWithValue("@username",uname);
                    cmd.Parameters.AddWithValue("@val", n);
                    using(SqlDataReader rd=cmd.ExecuteReader())
                    {
                        if(rd.HasRows )
                        {
                            while(rd.Read())
                            {
                                response = rd[0].ToString();
                            }
                        }
                    }
                }
            }
            return response;
        }
        public DataTable Extractdata(string name)
        {
            DataTable table = new DataTable();
            using (SqlConnection conn = new SqlConnection(conval))
            {
                string sql = "SELECT [UsernameWH], [Waste_Data_History], [WardNoWH],[DateReviewedWH] FROM [TblWasteHistory] where UsernameWH=@name order by [DateReviewedWH] desc";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = sql;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        ad.Fill(table);
                    }
                }
            }
            return table;
        }
        public List<string> getwarddetail(string uname)
        {
            List<string> list = new List<string>();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "displaywarddetails";
                using (SqlConnection conn = new SqlConnection(conval))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = uname;
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (rd.HasRows)
                        {
                            while (rd.Read())
                            {
                                list.Add(rd[0].ToString());
                                list.Add(rd[1].ToString());
                                list.Add(rd[2].ToString());
                                list.Add(rd[3].ToString());
                                list.Add(rd[4].ToString());
                                list.Add(rd[5].ToString());
                            }
                        }
                    }
                }
            }
            return list;
        }
        public DataTable Extractwastedata()
        {
            DataTable table = new DataTable();
            using (SqlConnection conn = new SqlConnection(conval))
            {
                string sql = "wardsandwaste";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = sql;
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        ad.Fill(table);
                    }
                }
            }
            return table;
        }
        public DataTable Extractwastewithwarddata(int n2)
        {
            DataTable table = new DataTable();
            using (SqlConnection conn = new SqlConnection(conval))
            {
                string sql = "Wastewithward";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = sql;
                    cmd.Parameters.Add("@ward",SqlDbType.Int).Value=n2;
                    using (SqlDataAdapter ad = new SqlDataAdapter(cmd))
                    {
                        ad.Fill(table);
                    }
                }
            }
            return table;
        }
        public List<int> getaverage()
        {
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
            return list;
        }
        public void setonfire(int n)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "settozero";
                using (SqlConnection conn = new SqlConnection(conval))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.Add("@ward", SqlDbType.Int).Value = n;
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public string CheckEmail(string email)
        {
            string response = "";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "checkforemail";
                using (SqlConnection conn = new SqlConnection(conval))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.Add("@email",SqlDbType.VarChar).Value = email;
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (rd.HasRows)
                        {
                            while (rd.Read())
                            {
                                response=rd.GetString(0);
                            }
                        }
                    }
                }
            }
            return response;
        }
        public string ResetPassword(string Password, string email)
        {
            string response = "";
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "resetpassword";
                using (SqlConnection conn = new SqlConnection(conval))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;
                    cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = Password;
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (rd.HasRows)
                        {
                            while (rd.Read())
                            {
                                response = rd.GetString(0);
                            }
                        }
                    }
                }
            }
            HttpContext.Current.Session["Code"] = null;
            HttpContext.Current.Session["Email"] = null;
            return response;
        }
        public List<string> CountUser()
        {
            List<string> counts1 = new List<string>();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "CountUserAndColors";
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
                                counts1.Add(Convert.ToString(rd["Users"]));
                                counts1.Add(Convert.ToString(rd["green"]));
                                counts1.Add(Convert.ToString(rd["yellow"]));
                                counts1.Add(Convert.ToString(rd["red"]));
                            }
                        }
                    }
                }
            }
            return counts1;
        }
        public List<WasteWithWard> Getwastedetailswithward()
        {
            List<WasteWithWard> list1=new List<WasteWithWard> ();
            
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "wardsandwaste";
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
                                WasteWithWard w1 = new WasteWithWard();
                                w1.Ward_No = Convert.ToInt32(rd["Ward_No"]);
                                w1.Waste = Convert.ToInt32(rd["Waste"]);
                                list1.Add(w1);
                            }
                        }
                    }
                }
            }
            return list1;
        }
        public StringBuilder GetUserData(int pq_curPage, int pq_rPP)
        {
            DLL _dll2=new DLL();
            List<string> list2 = _dll2.CountUser();
            int users = Convert.ToInt32(list2[0]);
            List<Users> list1=new List<Users> ();
            
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Pagination_";
                using (SqlConnection conn = new SqlConnection(conval))
                {
                    cmd.Connection = conn;
                    conn.Open();
                    cmd.CommandTimeout = 30;
                    cmd.Parameters.Add("@rows", SqlDbType.Int).Value = pq_rPP;
                    cmd.Parameters.Add("@page", SqlDbType.Int).Value = pq_curPage;
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (rd.HasRows)
                        {
                            while (rd.Read())
                            {
                                Users u1 = new Users();
                                u1.FName = Convert.ToString(rd["FNAme"]);
                                u1.MName = Convert.ToString(rd["MNAme"]);
                                u1.LName = Convert.ToString(rd["LNAme"]);
                                u1.Email = Convert.ToString(rd["Email"]);
                                u1.Username = Convert.ToString(rd["Username"]);
                                u1.PhoneNo = Convert.ToString(rd["PhoneNo"]);
                                u1.Password = Convert.ToString(rd["Password"]);
                                u1.Ward = Convert.ToInt32(rd["Ward"]);
                                list1.Add(u1);
                            }
                        }
                    }
                }
            }
            StringBuilder sb = new StringBuilder(@"{""totalRecords"":" + users + @",""curPage"":" + pq_curPage + @",""data"":");

            JavaScriptSerializer js = new JavaScriptSerializer();

            String json = js.Serialize(list1);
            sb.Append(json);
            sb.Append("}");
            return sb;
        }
        public List<Wards> getdetails()
        {
            List<Wards> wards = new List<Wards>();
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "Select* from TblWardDetails";
                using (SqlConnection conn = new SqlConnection(conval))
                {
                    cmd.Connection = conn;
                    cmd.CommandTimeout = 30;
                    conn.Open();
                    using (SqlDataReader rd = cmd.ExecuteReader())
                    {
                        if (rd.HasRows)
                        {
                            while (rd.Read())
                            {
                                Wards w1 = new Wards();
                                w1.ward = Convert.ToInt32(rd["Ward_Id"]);
                                w1.name = Convert.ToString(rd["Ward_Name"]);
                                w1.ward_no = Convert.ToInt32(rd["Ward_No"]);
                                w1.email = Convert.ToString(rd["Ward_Email"]);
                                w1.phone = Convert.ToString(rd["Ward_Phone"]);
                                w1.location = Convert.ToString(rd["Ward_Location"]);
                                w1.population = Convert.ToString(rd["Ward_Population"]);
                                w1.chief = Convert.ToString(rd["Ward_Chief_Name"]);
                                w1.chiefphone = Convert.ToString(rd["Ward_Chief_Phone"]);
                                wards.Add(w1);
                            }
                        }
                    }
                }
            }
            return wards;
        }
    }
}