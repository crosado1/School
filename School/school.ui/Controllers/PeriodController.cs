using school.Repository.Concrete;
using school.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace school.ui.Controllers
{
    public class PeriodController : Controller
    {
        private PeriodRepository _repository;
        // GET: Period

        public PeriodController()
        {
            _repository = new PeriodRepository();
        }
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetAll()
        {
            var result = _repository.GetAll();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        
    }
}