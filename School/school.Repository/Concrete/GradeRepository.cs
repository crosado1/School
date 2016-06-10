using school.Model.Model;
using school.Model.Response;
using school.Repository.Abstract;
using school.Repository.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Repository.Concrete
{
    public class GradeRepository:IGradeRepository
    {
        private SchoolEntities _context;
        public GradeRepository()
        {
            _context = new SchoolEntities();
        }
        public Model.Response.ServiceResponseWithResultset<Model.Response.SummaryResult> GetSummary(int periodId)
        {
            try
            {
                var result = this._context.proc_Grade_StudentSummaryByPeriod(periodId).ToList();
                List<SummaryResult> collection = new List<SummaryResult>();
                foreach (var item in result)
                {
                    collection.Add(new SummaryResult
                    {
                        Count = item.studentCountByGrade.HasValue ? item.studentCountByGrade.Value : 0,
                        Description = item.gradeDescription,
                        Id = item.gradeId
                    });
                }

                return new ServiceResponseWithResultset<SummaryResult>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<SummaryResult>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetSummary method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
           
        }
        
        public Model.Response.ServiceResponseWithResultset<GradeModel> GetAll()
        {
            try
            {
                var result = this._context.proc_Grade_GetAll().ToList();
                List<GradeModel> collection = new List<GradeModel>();
                foreach (var item in result)
                {
                    collection.Add(new GradeModel
                    {
                        GradeDescription = item.gradeDescription,
                        GradeId = item.gradeId
                    });
                }

                return new ServiceResponseWithResultset<GradeModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<GradeModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetAll method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }

        public IQueryable<Model.Model.GradeModel> FindBy(Model.Model.GradeModel entity)
        {
            throw new NotImplementedException();
        }

        public Model.Response.SaveResult Add(Model.Model.GradeModel entity)
        {
            throw new NotImplementedException();
        }

        public Model.Response.SaveResult Delete(Model.Model.GradeModel entity)
        {
            throw new NotImplementedException();
        }

        public Model.Response.SaveResult Edit(Model.Model.GradeModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<SummaryAmountResult> GetExpenseSummary(int periodId)
        {
            try
            {
                var result = this._context.proc_Grade_ExpenceSummaryByPeriod(periodId).ToList();
                List<SummaryAmountResult> collection = new List<SummaryAmountResult>();
                foreach (var item in result)
                {
                    collection.Add(new SummaryAmountResult
                    {
                        Amount = item.payAmount,
                        Description = item.gradeDescription,
                        Id = item.gradeId
                    });
                }

                return new ServiceResponseWithResultset<SummaryAmountResult>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<SummaryAmountResult>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetExpenseSummary method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }
    }
}
