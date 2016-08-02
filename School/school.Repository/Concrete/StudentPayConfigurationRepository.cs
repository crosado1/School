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
    public class StudentPayConfigurationRepository : IStudentPayConfigurationRepository
    {
        private SchoolEntities _context;
        public StudentPayConfigurationRepository()
        {
            _context = new SchoolEntities();
        }
        public SaveResult Add(StudentPayConfigurationModel entity)
        {
            try
            {
                ObjectParameter param1 = new ObjectParameter("periodGradeStudentTranTypeConfigurationId", entity.PeriodGradeStudentTranTypeConfigurationId);
                var result = _context.proc_PeriodGradeStudentTranTypeConfiguration_Insert(param1, entity.PeriodGradeStudentModel.PeriodGradeStudentId,
                                                                                          entity.TransactionTypeId,entity.PayConfiguration,entity.PayAmount,1);
                return new SaveResult
                {
                    Id = (int)param1.Value,
                    Message = "Student Grade Pay Configuration was created.",
                    Status = "OK"
                };
            }
            catch (Exception ex)
            {
                return new SaveResult
                {
                    Id = 0,
                    Message = "Error on StudentPayConfigurationRepository Add method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message,
                    Status = "ERROR"
                };
            }
        }

        public SaveResult Delete(StudentPayConfigurationModel entity)
        {
            throw new NotImplementedException();
        }

        public SaveResult Edit(StudentPayConfigurationModel entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<StudentPayConfigurationModel> FindBy(StudentPayConfigurationModel entity)
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<StudentPayConfigurationModel> GetAll()
        {
            throw new NotImplementedException();
        }
    }
}
