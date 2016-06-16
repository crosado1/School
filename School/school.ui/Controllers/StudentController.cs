using school.Model.Model;
using school.Model.Model.Request;
using school.Repository.Concrete;
using school.ui.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
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
        private TransactionTypeRepository _transactionTypeRepository;
        private PeriodGradeStudentRepository _periodGradeStudentRepository;
        
        public StudentController()
        {
            _repository = new PeriodGradeStudentRepository();
            _periodRepository = new PeriodRepository();
            _gradeRepository = new GradeRepository();
            _genderRepository = new GenderRepository();
            _studentRepository = new StudentRepository();
            _transactionTypeRepository = new TransactionTypeRepository();
            _periodGradeStudentRepository = new PeriodGradeStudentRepository();
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
        public JsonResult ShowStudentProfile()
        {
            return Json(new
            {
                Html = RenderPartial.RenderPartialView(this, "~/Views/Student/_profile.cshtml", null),

                Message = "",
                Status = "OK"
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ShowStudentTransaction()
        {
            return Json(new
            {
                Html = RenderPartial.RenderPartialView(this, "~/Views/Student/_payTransactionSummary.cshtml", null),

                Message = "",
                Status = "OK"
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ShowStudentCreate()
        {
            ViewBag.Grade = _gradeRepository.GetAll().Data
                                                .Select(i => new SelectListItem()
                                                {
                                                    Text = i.GradeDescription,
                                                    Value = i.GradeId.ToString()
                                                });

            ViewBag.Gender = _genderRepository.GetAll().Data
                                               .Select(i => new SelectListItem()
                                               {
                                                   Text = i.GenderDescription,
                                                   Value = i.GenderId.ToString()
                                               });

            ViewBag.TransactionType = _transactionTypeRepository.GetAll().Data;
                                            

            return Json(new
            {
                Html = RenderPartial.RenderPartialView(this, "~/Views/Student/_addStudent.cshtml", new school.Model.Model.StudentModel()),

                Message = "",
                Status = "OK"
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetStudentById(int studentId)
        {
            var result = _studentRepository.GetById(studentId);
            //return Json(result, JsonRequestBehavior.AllowGet);
            return Json(new
            {
                Html = RenderPartial.RenderPartialView(this, "~/Views/Student/_demographic.cshtml", result.Model),
                Message = "",
                Status = "OK"
            }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Save(Dictionary<string, string> transactions,StudentModel student,int periodGroupId)
                                                          //  string firstName,
                                                          //  string middleName,
                                                          //  string lastName,
                                                          //  string genderId
                                                          //)

        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var studentResult = _studentRepository.Add(student);

                    if (studentResult.Status == "OK")
                    {
                        var periodGradeStudentResult = _periodGradeStudentRepository.Add(new PeriodGradeStudentModel
                        {
                             StudentModel = new StudentModel {  StudentId= studentResult.Id},
                              PeriodGradeGroupModel=new PeriodGradeGroupModel {  PeriodGradeGroupId= periodGroupId }
                        });
                    }
                    else
                        throw new Exception(studentResult.Message);


                    scope.Complete();
                }

                return Json(new
                {                   
                    Message = "Student Configuration was created",
                    Status = "OK"
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    Message = ex.Message,
                    Status = "OK"
                }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}