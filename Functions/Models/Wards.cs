using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PqgridWithDatabase.Models
{
    public class Wards
    {
        public int ward { get; set; }
        public string name { get; set; }
        public int ward_no { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string location { get; set; }
        public string population { get; set; }
        public string chief { get; set; }
        public string chiefphone { get; set; }
    }
}