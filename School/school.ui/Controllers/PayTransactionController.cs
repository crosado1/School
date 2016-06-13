using school.Repository.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace school.ui.Controllers
{
    public class PayTransactionController : Controller
    {
        // GET: PayTransaction

        private PayTransactionRepository _payTranRepo;
        public PayTransactionController()
        {
            _payTranRepo = new PayTransactionRepository();
        }
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetAvailablePay(int periodGradeStudentId)
        {
            var result = _payTranRepo.GetAllAvailablesPay(periodGradeStudentId);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult SubmitPayment(decimal paymentAmount, int studentPayTransactionId,decimal balance)
        {
            var result = _payTranRepo.SubmitPayment(paymentAmount, balance, studentPayTransactionId,0);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetPayHistory(int periodGradeStudentId)
        {
            var result = _payTranRepo.GetPayHistory(periodGradeStudentId);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetAllByStudent(int studentId)
        {
            var result = _payTranRepo.GetAllByStudent(studentId);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}