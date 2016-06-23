using school.Model.Model;
using school.Model.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static school.Model.Enumerator.Enum;

namespace school.Repository.Abstract
{
    interface IUserRoleRepository: IGenericRepository<UserRoleModel>, IDisposable
    {
        ServiceResponseWithResultset<UserRoleModel> GetUserByRole(UserRoles userRole);
    }
}
