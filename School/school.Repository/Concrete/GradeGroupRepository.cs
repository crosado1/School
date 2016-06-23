using school.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using school.Model.Model;
using school.Model.Response;
using System.Data.Entity.Core.Objects;
using school.Repository.EntityFramework;

namespace school.Repository.Concrete
{
    public class GradeGroupRepository : IGradeGroupRepository
    {
        private SchoolEntities _context;
        public GradeGroupRepository()
        {
            _context = new SchoolEntities();
        }
        public SaveResult Add(PeriodGradeGroupModel entity)
        {
            try
            {
                ObjectParameter param1 = new ObjectParameter("periodGradeGroupId", entity.PeriodGradeGroupId);
                var result = _context.proc_PeriodGradeGroup_Insert(param1, entity.PeriodGradeModel.PeriodGradeId,
                                                            entity.GroupNumber, entity.GroupDescription,
                                                            entity.LeaderId);
                return new SaveResult
                {
                    Id = (int)param1.Value,
                    Message = "Group was created.",
                    Status = "OK"
                };
            }
            catch (Exception ex)
            {
                return new SaveResult
                {
                    Id = 0,
                    Message = "Error on GradeGroup Add method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message,
                    Status = "ERROR"
                };
            }
        }

        public SaveResult Delete(PeriodGradeGroupModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public SaveResult Edit(PeriodGradeGroupModel entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<PeriodGradeGroupModel> FindBy(PeriodGradeGroupModel entity)
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<PeriodGradeGroupModel> GetAll()
        {
            throw new NotImplementedException();
        }
    }
}
