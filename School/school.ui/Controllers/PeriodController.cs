using school.Repository.Concrete;
using school.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using school.ui.Utility;
using System.Transactions;
using school.Model.Model;

namespace school.ui.Controllers
{
    public class PeriodController : Controller
    {
        private PeriodRepository _repository;
        private GradeRepository _gradeRepository;
        private PeriodGradeRepository _periodGradeRepository;
        // GET: Period

        public PeriodController()
        {
            _repository = new PeriodRepository();
            _gradeRepository = new GradeRepository();
            _periodGradeRepository = new PeriodGradeRepository();
        }
        public ActionResult Index()
        {
            ViewBag.IsReadyToAdd = _repository.IsReadyToAdd();
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
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var result = _repository.Add(new Model.Model.PeriodModel
                    {
                        YearTo = Int32.Parse(to),
                        YearFrom = Int32.Parse(from)
                    });

                    List<PeriodGradeModel> periodGradeCollection = new List<PeriodGradeModel>();

                    foreach (var item in gradesIds)
                    {
                        periodGradeCollection.Add(new PeriodGradeModel
                            {
                                PeriodModel = new PeriodModel
                                {
                                    PeriodId = result.Id,
                                },
                                GradeModel = new GradeModel
                                {
                                     GradeId = item
                                }
                            });
                    }

                    var periodGradeResponse = _periodGradeRepository.Add(periodGradeCollection);


                    
                    scope.Complete();

                    return Json(new
                    {
                        Message = result.Message,
                        Status = "OK"
                    }, JsonRequestBehavior.AllowGet);
                }
            }
            catch(Exception ex)
            {
                return Json(new
                {                    
                    Message = ex.Message,
                    Status = "ERROR"
                }, JsonRequestBehavior.AllowGet);
            }
            
            
        }
    }
}