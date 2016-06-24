using school.Repository.Concrete;
using school.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using school.ui.Utility;

namespace school.ui.Controllers
{
    public class PeriodController : Controller
    {
        private PeriodRepository _repository;
        private GradeRepository _gradeRepository;
        // GET: Period

        public PeriodController()
        {
            _repository = new PeriodRepository();
            _gradeRepository = new GradeRepository();
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

        public JsonResult ShowPeriodModal()
        {
            ViewBag.Grade = _gradeRepository.GetAll().Data;

            return Json(new
            {
                Html = RenderPartial.RenderPartialView(this, "~/Views/Period/_create.cshtml", null),
                Message = "",
                Status = "OK"
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Save(string from, string to,List<int> gradesIds)
        {
            

            return Json(new
            {               
                Message = "",
                Status = "OK"
            }, JsonRequestBehavior.AllowGet);
        }


    }
}