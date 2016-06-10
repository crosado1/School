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
    public class StudentRepository : IStudentRepository
    {
        private SchoolEntities _context;
        public StudentRepository()
        {
            _context = new SchoolEntities();
        }

        public SaveResult Add(StudentModel entity)
        {
            throw new NotImplementedException();
        }

        public SaveResult Delete(StudentModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public SaveResult Edit(StudentModel entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<StudentModel> FindBy(StudentModel entity)
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<StudentModel> GetAll()
        {
            throw new NotImplementedException();
        }

        public ServiceResponseModel<StudentModel> GetById(int studentId)
        {
            try
            {
                var result = this._context.proc_Student_GetById(studentId).FirstOrDefault();
                
                return new ServiceResponseModel<StudentModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Model= new StudentModel
                    {
                        Address1 = result.address1,
                        Address2 = result.address2,
                        CityModel = new CityModel
                        {
                            CityDescription = result.cityDescription,
                            CityId = result.cityId.HasValue ? result.cityId.Value : 0,
                        },
                        FirstName = result.firstName,
                        GenderModel = new GenderModel
                        {
                            GenderDescription = result.genderDescription,
                            GenderId = result.genderId,
                            GenderLetter = result.genderLetter
                        },
                        LastName = result.lastName,
                        MiddleName = result.middleName,
                        StateCode = result.stateCode,
                        StudentCode = "12345",
                        StudentId = result.studentId,
                        ZipCode = result.zipCode
                    }
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseModel<StudentModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetById method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }
    }
}
