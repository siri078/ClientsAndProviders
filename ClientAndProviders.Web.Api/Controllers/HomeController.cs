using System.Web.Mvc;

namespace ClientAndProviders.Web.Api.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return RedirectToAction("Index", "Help"); 
        }
    }
}
