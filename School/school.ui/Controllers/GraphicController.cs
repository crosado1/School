using school.Repository.Concrete;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace school.ui.Controllers
{
    public class GraphicController : Controller
    {
        // GET: Graphic
        private GradeRepository _gradeRepository;
        private PeriodRepository _periodRepository;
        private string _periodId = ConfigurationManager.AppSettings["activePeriodId"];
        private string _period = ConfigurationManager.AppSettings["activePeriod"];
        public GraphicController()
        {
            _gradeRepository = new GradeRepository();
            _periodRepository = new PeriodRepository();
        }
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult GetGradeByActivePeriod()
        {
            var result = _gradeRepository.GetSummary(Int32.Parse(_periodId));

            string[] labels = new string[result.Data.Count()]; //{ "Pre-Kinder", "Kinder", "Primero", "Segundo", "Tercero", "Cuarto", "Quinto", "Sexto", "Septimo", "Octavo", "Noveno" };
            int[] information = new int[result.Data.Count()]; //= { 65, 59, 80, 81, 56, 55, 40, 8, 15, 25, 62 };

            for (int i = 0; i < result.Data.Count(); i++)
            {
                labels[i] = result.Data[i].Description;
                information[i] = result.Data[i].Count;

            }
            var jsonData = new
            {
                labelInfo = labels,
                dataInfo = information,
                labelTitle = "Grades by period " + _period
            };

            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetStudentByPeriods()
        {
            var result = _periodRepository.GetSummary();

            string[] labels = new string[result.Data.Count()]; //{ "Pre-Kinder", "Kinder", "Primero", "Segundo", "Tercero", "Cuarto", "Quinto", "Sexto", "Septimo", "Octavo", "Noveno" };
            int[] information = new int[result.Data.Count()]; //= { 65, 59, 80, 81, 56, 55, 40, 8, 15, 25, 62 };

            for (int i = 0; i < result.Data.Count(); i++)
            {
                labels[i] = result.Data[i].Description;
                information[i] = result.Data[i].Count;

            }
            var jsonData = new
            {
                labelInfo = labels,
                dataInfo = information,
                labelTitle = "Students Count by periods"
            };

            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetGradeExpenseByActivePeriod()
        {
            var result = _gradeRepository.GetExpenseSummary(Int32.Parse(_periodId));

            string[] labels = new string[result.Data.Count()]; //{ "Pre-Kinder", "Kinder", "Primero", "Segundo", "Tercero", "Cuarto", "Quinto", "Sexto", "Septimo", "Octavo", "Noveno" };
            decimal[] information = new decimal[result.Data.Count()]; //= { 65, 59, 80, 81, 56, 55, 40, 8, 15, 25, 62 };

            for (int i = 0; i < result.Data.Count(); i++)
            {
                labels[i] = result.Data[i].Description;
                information[i] = result.Data[i].Amount;

            }
            var jsonData = new
            {
                labelInfo = labels,
                dataInfo = information,
                labelTitle = "Grades Expenses by period " + _period
            };

            return Json(jsonData, JsonRequestBehavior.AllowGet);
        }


        //public JsonResult GetGradeGroupByPeriod()
        //{
        //    //var result = _gradeRepository.GetGroups(4);

        //    string[] labels = new string[] { "Pre-Kinder", "Kinder", "Primero", "Segundo", "Tercero" };
        //    int[] information = new int[result.Data.Count()]; //= { 65, 59, 80, 81, 56, 55, 40, 8, 15, 25, 62 };

        //    //for (int i = 0; i < result.Data.Count(); i++)
        //    //{
        //    //    labels[i] = result.Data[i].Description;
        //    //    information[i] = result.Data[i].Count;

        //    //}
        //    var jsonData = new
        //    {
        //        labelInfo = labels,
        //        dataInfo = information,
        //        labelTitle = "Grades by period " + _period
        //    };

        //    return Json(jsonData, JsonRequestBehavior.AllowGet);
        //}
    }
}