using school.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using school.Model.Model;
using school.Repository.EntityFramework;
using school.Model.Response;

namespace school.Repository.Concrete
{
    public class PeriodRepository : IPeriodRepository
    {
        private SchoolEntities _context;
        public PeriodRepository()
        {
            _context = new SchoolEntities();
        }
        public SaveResult Add(PeriodModel entity)
        {
            throw new NotImplementedException();
        }
        public SaveResult Delete(PeriodModel entity)
        {
            throw new NotImplementedException();
        }

        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        public SaveResult Edit(PeriodModel entity)
        {
            throw new NotImplementedException();
        }
        public IQueryable<PeriodModel> FindBy(PeriodModel entity)
        {
            throw new NotImplementedException();
        }
        public ServiceResponseWithResultset<PeriodModel> GetAll()
        {
            try
            {
                var result = this._context.proc_Period_GetAll().ToList();
                List<PeriodModel> collection = new List<PeriodModel>();
                foreach (var item in result)
                {
                    collection.Add(new PeriodModel
                    {
                        Active = item.active.HasValue ? item.active.Value : false,
                        PeriodId = item.periodId,
                        YearDescription = item.YearDescription,
                        YearFrom = item.yearFrom,
                        YearTo = item.yearTo,
                        PeriodStatusTypeModel = new PeriodStatusTypeModel
                        {
                            PeriodStatusTypeId = item.periodStatusTypeId,
                            PeriodStatusTypeDesc = item.periodStatusTypeDesc
                        }
                    });
                }

                return new ServiceResponseWithResultset<PeriodModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch(Exception ex)
            {
                 return new ServiceResponseWithResultset<PeriodModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetAll method. " + ex.InnerException != null?ex.InnerException.Message:ex.Message
                    
                };
            }
        }
        public ServiceResponseWithResultset<SummaryResult> GetSummary()
        {
            try
            {
                var result = this._context.proc_Period_StudentSummaryByPeriod().ToList();
                List<SummaryResult> collection = new List<SummaryResult>();
                foreach (var item in result)
                {
                    collection.Add(new SummaryResult
                    {
                        Count = item.studentCountByYear.HasValue ? item.studentCountByYear.Value : 0,
                        Description = item.periodYear,
                        Id = item.periodId
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
    }
}
