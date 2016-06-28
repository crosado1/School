﻿using school.Repository.Concrete;
using school.ui.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace school.ui.Controllers
{
    public class PeriodGradeController : Controller
    {
        private PeriodGradeRepository _repository;
        private UserRoleRepository _userRepository;
        private GradeGroupRepository _gradeGroupRepository;
        private GradeRepository _gradeRepository;

        public PeriodGradeController()
        {
            _repository = new PeriodGradeRepository();
            _userRepository = new UserRoleRepository();
            _gradeGroupRepository = new GradeGroupRepository();
            _gradeRepository = new GradeRepository();


        }

         
        // GET: PeriodGrade
        public ActionResult Index(int periodId=0)
        {
            ViewBag.PeriodId = periodId;
            return View();
        }

        public JsonResult GetAllByPeriod(int periodId = 0)
        {
            var result = _repository.GetAllByPeriod(periodId);            
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult ShowStudentTransaction()
        {

            ViewBag.Teachers = _userRepository.GetUserByRole(Model.Enumerator.Enum.UserRoles.Teacher).Data
                                               .Select(i => new SelectListItem()
                                               {
                                                   Text = i.UserModel.UserFullName,
                                                   Value = i.UserRoleId.ToString()
                                               });            

            return Json(new
            {
                Html = RenderPartial.RenderPartialView(this, "~/Views/GradeGroup/_addGroup.cshtml", null),
                Message = "",
                Status = "OK"
            }, JsonRequestBehavior.AllowGet);

            
        }

        public JsonResult SaveGroup(int periodGradeId,int leader,string group, string description)
        {
            var result = _gradeGroupRepository.Add(new Model.Model.PeriodGradeGroupModel
            {
                GroupDescription = description,
                GroupNumber = group,
                LeaderId = leader,
                PeriodGradeModel = new Model.Model.PeriodGradeModel
                {
                    PeriodGradeId = periodGradeId
                }
            });

            //_gradeGroupRepository.Dispose();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        //public JsonResult GetGroups(int periodGradeId)
        //{
        //    GradeController gradeController = new GradeController();
        //    return gradeController.GetGroups(periodGradeId);
        //}



    }
}