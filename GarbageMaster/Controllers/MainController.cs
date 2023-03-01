using Functions.Business_Logic_Layer;
using System.Text;
using System.Web.Mvc;

namespace GarbageMaster.Controllers
{
    public class MainController : Controller
    {
        private readonly BLL _repo;

        public MainController()
        {
            _repo = new BLL();
        }

        [HttpPost]
        public JsonResult PostName(string Name, string Email, string Subject, string Message)
        {
            return Json(new { Name = _repo.QuickMessage(Name, Email, Subject, Message) }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult RegisterUser(string FName, string MName, string LName, string Email, string UName, string Password, int Ward)
        {
            return Json(new { Name = _repo.Register(FName, MName, LName, Email, UName, Password, Ward) }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult CheckLogin(string UName, string Password)
        {
            return Json(new { Name = _repo.Login(UName, Password) }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult InsertWasteData(string SP, string BP, string DB, string sack)
        {
            string uname = Session["UserName"].ToString();
            return Json(new { Name = _repo.WasteData(SP, BP, DB, sack,uname) }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CheckEmail(string Email)
        {
            return Json(new { Name = _repo.checkemail(Email) }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult SendEmail(string Email)
        {
            return Json(new { Name = _repo.sendemail(Email) }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult CheckPin(string Pin)
        {
            return Json(new { Name = _repo.checkpin(Pin) }, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult ResetPassword(string Password)
        {
            return Json(new { Name = _repo.resetpassword(Password) }, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public JsonResult getwastedetails()
        {
            return Json(_repo.Getwastedetailswithward(), JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public string getuserdetails(int pq_curPage, int pq_rPP)
        {
            return _repo.GetUserDetails(pq_curPage,pq_rPP).ToString();
        }
    }
}