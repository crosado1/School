using school.Model.Model;
using school.Model.Model.Request;
using school.Repository.Concrete;
using school.ui.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace school.ui.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student

        private PeriodGradeStudentRepository _repository;
        private PeriodRepository _periodRepository;
        private GradeRepository _gradeRepository;
        private GenderRepository _genderRepository;
        private StudentRepository _studentRepository;
        
        public StudentController()
        {
            _repository = new PeriodGradeStudentRepository();
            _periodRepository = new PeriodRepository();
            _gradeRepository = new GradeRepository();
            _genderRepository = new GenderRepository();
            _studentRepository = new StudentRepository();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Test()
        {
            return View();
        }
        public JsonResult GetAll(Search_StudentRequest request)
        {

            var result = _repository.GetAll(request);

            if (result.Response == Model.Enumerator.Enum.ServiceResponses.Success)
            {
                return Json(new
                {
                    status = "OK",
                    aaData = result.Data,
                    iTotalRecords = result.TotalRecords,
                    iTotalDisplayRecords = result.TotalRecords
                }, JsonRequestBehavior.AllowGet);
            }
            else
                return Json(new
                {
                    status="ERROR",
                    message = result.Reason
                }, JsonRequestBehavior.AllowGet);

        }
        public JsonResult ShowSearch()
        {
          
            ViewBag.Period = _periodRepository.GetAll().Data
                                                .Select(i => new SelectListItem()
                                                {   
                                                    Text = i.YearFrom.ToString() + " - " + i.YearTo.ToString(),
                                                    Value = i.PeriodId.ToString()
                                                });

            ViewBag.Grade = _gradeRepository.GetAll().Data
                                                .Select(i => new SelectListItem()
                                                {
                                                    Text =i.GradeDescription,
                                                    Value = i.GradeId.ToString()
                                                });

            ViewBag.Gender = _genderRepository.GetAll().Data
                                               .Select(i => new SelectListItem()
                                               {
                                                   Text = i.GenderDescription,
                                                   Value = i.GenderId.ToString()
                                               });
            return Json(new
            {
                Html = RenderPartial.RenderPartialView(this, "~/Views/Student/_search.cshtml",null),

                Message = "",
                Status = "OK"
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetStudentById(int studentId)
        {
            var result = _studentRepository.GetById(studentId);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}