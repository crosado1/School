using school.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using school.Model.Model;
using school.Model.Response;
using school.Repository.EntityFramework;

namespace school.Repository.Concrete
{
    public class CityRepository : ICityRepository
    {
        private SchoolEntities _context;

        public CityRepository()
        {
            _context = new SchoolEntities();
        }
        public SaveResult Add(CityModel entity)
        {
            throw new NotImplementedException();
        }

        public SaveResult Delete(CityModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public SaveResult Edit(CityModel entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<CityModel> FindBy(CityModel entity)
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<CityModel> GetAll()
        {
            try
            {
                var cities = _context.Cities.ToList();
                var collection = new List<CityModel>();


                foreach (var city in cities)
                {
                    collection.Add(new CityModel
                    {
                        CityDescription = city.cityDescription,
                        CityId = city.cityId
                    });
                }

                return new ServiceResponseWithResultset<CityModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<CityModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetAll method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message
                };
            }
           
        }
    }
}
