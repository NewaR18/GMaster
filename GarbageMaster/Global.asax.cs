using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace GarbageMaster
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            FirebaseApp.Create(new AppOptions()
            {
                Credential = GoogleCredential.FromFile("garbage-master-firebase-adminsdk-ermzn-ab027619ae.json"),
            });
        }
    }
}