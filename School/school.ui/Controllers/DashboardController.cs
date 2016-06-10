using school.ui.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace school.ui.Controllers
{
    public class DashboardController : Controller
    {
        // GET: Dashboard
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult BindDashboardByRole()
        {
            return Json(new
            {
                Html = RenderPartial.RenderPartialView(this, "~/Views/Dashboard/_adminDashboard.cshtml", null),
                Message = "",
                Status = "OK"
            }, JsonRequestBehavior.AllowGet);
        }
    }
}