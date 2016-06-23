using school.Repository.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace school.ui.Controllers
{
    public class UserController : Controller
    {
        private UserRoleRepository _repository;
        public UserController()
        {
            _repository = new UserRoleRepository();
        }
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

    }
}