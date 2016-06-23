using school.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using school.Model.Enumerator;
using school.Model.Model;
using school.Model.Response;
using school.Repository.EntityFramework;

namespace school.Repository.Concrete
{
    public class UserRoleRepository : IUserRoleRepository
    {
        private SchoolEntities _context;
        public UserRoleRepository()
        {
            _context = new SchoolEntities();
        }
        public SaveResult Add(UserRoleModel entity)
        {
            throw new NotImplementedException();
        }

        public SaveResult Delete(UserRoleModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public SaveResult Edit(UserRoleModel entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<UserRoleModel> FindBy(UserRoleModel entity)
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<UserRoleModel> GetAll()
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<UserRoleModel> GetUserByRole(Model.Enumerator.Enum.UserRoles userRole)
        {
            try
            {
                var result = this._context.proc_User_GetUserByRole((int)userRole).ToList();
                List<UserRoleModel> collection = new List<UserRoleModel>();
                foreach (var item in result)
                {
                    collection.Add(new UserRoleModel
                    {
                        FromDate = item.fromDate,
                        ToDate = item.toDate.HasValue ? item.toDate : null,
                        UserRoleId = item.userRoleId,
                        RoleModel = new RoleModel
                        {
                            RoleDescription = item.roleDescription
                        },
                        UserModel = new UserModel
                        {
                            UserEmailAddress = item.userEmailAddress,
                            UserFullName = item.userFullName,
                            UserId = item.userId,
                            UserName = item.userName,
                            UserPassword = item.userPassword
                        }
                    });
                }

                return new ServiceResponseWithResultset<UserRoleModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<UserRoleModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetUserByRole method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message
                };
            }
        }
    }
}
