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
    public class GenderRepository:IGenderRepository
    {
        private SchoolEntities _context;
        public GenderRepository()
        {
            _context = new SchoolEntities();
        }
        public Model.Response.ServiceResponseWithResultset<Model.Model.GenderModel> GetAll()
        {
            try
            {
                var result = this._context.proc_Gender_GetAll().ToList();
                List<GenderModel> collection = new List<GenderModel>();
                foreach (var item in result)
                {
                    collection.Add(new GenderModel
                    {
                         GenderDescription=item.genderDescription,
                         GenderId = item.genderId,
                         GenderLetter=item.genderLetter
                    });
                }

                return new ServiceResponseWithResultset<GenderModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<GenderModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetAll method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message
                };
            }
        }

        public IQueryable<Model.Model.GenderModel> FindBy(Model.Model.GenderModel entity)
        {
            throw new NotImplementedException();
        }

        public Model.Response.SaveResult Add(Model.Model.GenderModel entity)
        {
            throw new NotImplementedException();
        }

        public Model.Response.SaveResult Delete(Model.Model.GenderModel entity)
        {
            throw new NotImplementedException();
        }

        public Model.Response.SaveResult Edit(Model.Model.GenderModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
