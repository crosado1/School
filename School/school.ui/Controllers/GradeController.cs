using school.Repository.Concrete;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace school.ui.Controllers
{
    public class GradeController : Controller
    {
        private GradeRepository _gradeRepository;
        private string _periodId = ConfigurationManager.AppSettings["activePeriodId"];
        private string _period = ConfigurationManager.AppSettings["activePeriod"];
        public GradeController()
        {
            _gradeRepository = new GradeRepository();
        }

        // GET: Grade
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetGroups(int periodGradeId)
        {
            var result = _gradeRepository.GetGroups(periodGradeId);
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        //public JsonResult GetAll()
        //{
        //    var result = _gradeRepository.GetAll();           
        //    var jsonData = new
        //    {
        //        period = _period,
        //        dataInfo = result.Data
        //    };

        //    return Json(jsonData, JsonRequestBehavior.AllowGet);
        //}
    }
}