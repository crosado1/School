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
    public class PeriodGradeRepository: IPeriodGradeRepository
    {
        private SchoolEntities _context;
        public PeriodGradeRepository()
        {
            _context = new SchoolEntities();
        }

        public SaveResult Add(PeriodGradeModel entity)
        {
            throw new NotImplementedException();
        }

        public SaveResult Delete(PeriodGradeModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public SaveResult Edit(PeriodGradeModel entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<PeriodGradeModel> FindBy(PeriodGradeModel entity)
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<PeriodGradeModel> GetAll()
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<PeriodGradeModel> GetAllByPeriod(int periodId)
        {
            try
            {
                var result = this._context.proc_PeriodGrade_GetByPeriod(periodId).ToList();

                List<PeriodGradeModel> collection = new List<PeriodGradeModel>();
                
                foreach (var item in result)
                {
                    collection.Add(new PeriodGradeModel
                    {
                         PeriodGradeId = item.periodGradeId,
                          GradeModel = new GradeModel
                          {
                               GradeDescription = item.gradeDescription,
                               GradeId = item.gradeId
                          },
                          PeriodModel = new PeriodModel
                          {
                              Active = item.active.HasValue ? item.active.Value : false,
                              PeriodId = item.periodId,
                              YearFrom = item.yearFrom,
                              YearTo = item.yearTo

                          }
                    });
                }


                return new ServiceResponseWithResultset<PeriodGradeModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<PeriodGradeModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetAllByPeriod method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }
        //public Model.Response.ServiceResponseWithResultset<Model.Model.GenderModel> GetAll()
        //{
        //    try
        //    {
        //        var result = this._context.proc_Gender_GetAll().ToList();
        //        List<GenderModel> collection = new List<GenderModel>();
        //        foreach (var item in result)
        //        {
        //            collection.Add(new GenderModel
        //            {
        //                 GenderDescription=item.genderDescription,
        //                 GenderId = item.genderId,
        //                 GenderLetter=item.genderLetter
        //            });
        //        }

        //        return new ServiceResponseWithResultset<GenderModel>
        //        {
        //            Response = Model.Enumerator.Enum.ServiceResponses.Success,
        //            Reason = "OK",
        //            Data = collection
        //        };
        //    }
        //    catch (Exception ex)
        //    {
        //        return new ServiceResponseWithResultset<GenderModel>
        //        {
        //            Response = Model.Enumerator.Enum.ServiceResponses.Failure,
        //            Reason = "Error on GetAll method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message
        //        };
        //    }
        //}

        //public IQueryable<Model.Model.GenderModel> FindBy(Model.Model.GenderModel entity)
        //{
        //    throw new NotImplementedException();
        //}

        //public Model.Response.SaveResult Add(Model.Model.GenderModel entity)
        //{
        //    throw new NotImplementedException();
        //}

        //public Model.Response.SaveResult Delete(Model.Model.GenderModel entity)
        //{
        //    throw new NotImplementedException();
        //}

        //public Model.Response.SaveResult Edit(Model.Model.GenderModel entity)
        //{
        //    throw new NotImplementedException();
        //}

        //public void Dispose()
        //{
        //    throw new NotImplementedException();
        //}
    }
}
