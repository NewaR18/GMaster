using Functions.Data_Link_Layer;
using Functions.Models;
using PqgridWithDatabase.Models;
using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Xml.Linq;

namespace Functions.Business_Logic_Layer
{
    public class BLL
    {
        public string Uname = null;

        private readonly DLL _dll;

        public BLL()
        {
            _dll = new DLL();
        }

        public string QuickMessage(string Name, string Email, string Subject, string Message)
        {
            return _dll.InsertMessage(Name, Email, Subject, Message);
        }

        public string Register(string FName, string MName, string LName, string Email, string UName, string Password, int Ward)
        {
            return _dll.RegisterUser(FName, MName, LName, Email, UName, Password, Ward);
        }

        public string Login(string UName, string Password)
        {
            string value = _dll.LoginUser(UName, Password);
            if (value == "ValidUser")
            {
                HttpContext.Current.Session["UserName"] = UName;
            }
            if(UName== "PawanWarrior" && value== "ValidUser")
            {
                HttpContext.Current.Session["Role"] = "Admin";
            }
            return value;
        }

        public string GetUName()
        {
            return Uname;
        }

        public string WasteData(string SP, string BP, string DB, string sack,string uname)
        {
            int n;
            int smallP;
            if (SP == "")
            {
                smallP = 0;
            }
            else
            {
                smallP = Convert.ToInt32(SP);
            }
            int bigP;
            if (BP == "")
            {
                bigP = 0;
            }
            else
            {
                bigP = Convert.ToInt32(BP);
            }
            int dustB;
            if (DB == "")
            {
                dustB = 0;
            }
            else
            {
                dustB = Convert.ToInt32(DB);
            }
            int sackB;
            if (sack == "")
            {
                sackB = 0;
            }
            else
            {
                sackB = Convert.ToInt32(sack);
            }
            n = smallP * 1 + bigP * 4 + dustB * 6 + sackB * 12;
            if (n < 1000)
            {
                return _dll.InsertWasteData(n, uname);
            }
            else
            {
                return "spam";
            }
        }
        public string mailsend(string n,int ward)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add("sudipshrestha960@gmail.com");
                mail.From = new MailAddress("chessmastersudip2015@gmail.com");
                int data = Convert.ToInt32(n);
                mail.Subject = "Waste Warning || Garbage Truck Required";
                mail.Body = "Respective Ward Manager,\r\n\r\nI hope this email finds you well. I am writing to bring to your attention an issue in Ward "+ward+" regarding the accumulation of garbage. The amount of waste has been increasing day by day.\r\n\r\nIn view of this situation, I kindly request that you arrange for the dispatch of a garbage truck to Ward "+ward+" to collect the waste and dispose of it properly.\r\n\r\nIf you require any further information, please do not hesitate to contact me. I look forward to your action. \r\n\r\nAverage Garbage: " + data + " (in Plastic bags)\r\n\r\nThank you for your time and consideration.\r\n\r\nBest regards,\r\nGarbage Master\r\nPhone No: 9861141726 \r\nEmail: sudipshrestha960@gmail.com";
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("garbagemaster100@gmail.com", "vwddpwdpqedpqkaw");
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }
            catch (Exception ex)
            {}
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add("sudipshrestha960@gmail.com");
                mail.From = new MailAddress("garbagemaster100@gmail.com");
                int data = Convert.ToInt32(n);
                mail.Subject = "Important Notification - Garbage Collection Schedule";
                mail.Body = "Dear Residents,\r\n\r\nThis is to inform you that the garbage truck will be making its rounds in your area tomorrow. In order to ensure a smooth and efficient collection, please have your trash properly bagged. \r\n\r\nPlease note that only household waste will be collected. Hazardous materials, such as chemicals, batteries, and electronics, cannot be disposed of with regular trash and must be disposed of separately.\r\n\r\nWe appreciate your cooperation and efforts to keep our community clean and healthy. If you have any questions or concerns, please do not hesitate to contact us.\r\n\r\nThank you for your understanding.\r\n\r\nBest regards,\r\nGarbage Master\r\nPhone No: 9861141726 \r\nEmail: sudipshrestha960@gmail.com";
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("garbagemaster100@gmail.com", "vwddpwdpqedpqkaw");
                smtp.EnableSsl = true;
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
            }
            return "sent";
        }

        public string checkemail(string email)
        {
            return _dll.CheckEmail(email);
        }
        public string sendemail(string email)
        {
            Random r = new Random();
            var x = r.Next(0, 999999);
            string s = x.ToString("000000");
            HttpContext.Current.Session["Code"] = s;
            HttpContext.Current.Session["Email"] = email;
            MailMessage mail = new MailMessage();
            mail.To.Add(email);
            mail.From = new MailAddress("garbagemaster100@gmail.com");
            mail.Subject = "Password Reset Code";
            mail.Body = "Dear User,\r\n\r\nWe have received a request to reset your password for your account with us. To proceed, please enter the following 6-digit code to confirm your identity:"+s+".\r\n\r\nIf you did not make this request, please ignore this email and your password will remain unchanged.\r\n\r\nThank you for using our services.\r\n\r\nBest regards,\r\nGarbage Master";
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential("garbagemaster100@gmail.com", "vwddpwdpqedpqkaw");
            smtp.EnableSsl = true;
            smtp.Send(mail);
            return "sent";
        }
        public string checkpin(string pin)
        {
            string PinFromSession = HttpContext.Current.Session["Code"].ToString(); 
            if(pin==PinFromSession)
            {
                return "1";
            }
            return "0";
        }
        public string resetpassword(string Password)
        {
            string email = HttpContext.Current.Session["Email"].ToString();
            return _dll.ResetPassword(Password,email);
        }
        public List<WasteWithWard> Getwastedetailswithward()
        {
            return _dll.Getwastedetailswithward();
        }
        public StringBuilder GetUserDetails(int pq_curPage, int pq_rPP)
        {
            return _dll.GetUserData(pq_curPage, pq_rPP);
        }
        public List<Wards> getdetails()
        {
            return _dll.getdetails();
        }
    }
}