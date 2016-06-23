using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class UserRoleModel
    {
        public int UserRoleId { get; set; }
        public RoleModel RoleModel { get; set; }
        public UserModel UserModel { get; set; }

        public DateTime FromDate { get; set; }
        public DateTime? ToDate { get; set; }
    }
}
