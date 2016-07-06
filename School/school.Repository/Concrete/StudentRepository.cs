using school.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using school.Model.Model;
using school.Repository.EntityFramework;
using school.Model.Response;
using System.Data.Entity.Core.Objects;
using school.Model.Model.Request;

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
            try
            {
                ObjectParameter param1 = new ObjectParameter("studentId", entity.StudentId);
                var result = _context.proc_Student_Insert(param1, entity.FirstName,
                                                            entity.MiddleName, entity.LastName,
                                                            entity.GenderModel.GenderId,
                                                            entity.Address1, entity.Address2,
                                                            entity.CityModel != null?entity.CityModel.CityId:(int?)null,
                                                            entity.ZipCode, entity.StateCode);
                return new SaveResult
                {
                    Id = (int)param1.Value,
                    Message = "Student was created.",
                    Status="OK"
                };
            }
            catch (Exception ex)
            {
                return new SaveResult
                {
                    Id = 0,
                    Message = "Error on Student Add method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message,
                    Status = "ERROR"
                };
            }
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
                        StudentCode = this.GetStudentNumber(result.studentId),
                        StudentId = result.studentId,
                        ZipCode = result.zipCode,
                        Phone1=result.phone1,
                        Phone2=result.phone2,
                        Phone3=result.phone3
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

        public ServiceResponseWithResultset<StudentModel> Search(Search_StudentRequest request)
        {
            try
            {
                var result = this._context.proc_Student_GetAll(request.FirstName,
                                                                  request.LastName,
                                                                  request.GenderId,
                                                                  request.StudentCode,
                                                                  request.CityId,
                                                                  request.PageIndex,
                                                                   request.PageSize.Equals(0) ? 10 : request.PageSize,
                                                                  request.SortColumn,
                                                                  "ASC").ToList();

                List<StudentModel> collection = new List<StudentModel>();
                var totalRecords = result.First().TotalRecord;
                foreach (var item in result)
                {
                    collection.Add(new StudentModel 
                        {
                            FirstName = item.firstName,
                            MiddleName = item.middleName,
                            LastName = item.lastName,
                            StudentId = item.studentId,
                        StudentCode = this.GetStudentNumber(item.studentId),
                        GenderModel = new GenderModel
                            {
                                GenderDescription = item.GenderDescription,
                                GenderId = item.genderId
                            },
                            CityModel = new CityModel
                            {
                                 CityDescription = item.CityDescription,
                                 CityId = item.cityId.HasValue?item.cityId.Value:0
                            }
                    });
                }


                return new ServiceResponseWithResultset<StudentModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection,
                    TotalRecords = totalRecords
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<StudentModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on Search method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }

        private string GetStudentNumber(int studentId)
        {
            string value = string.Empty;
            switch (studentId.ToString().Length)
            {
                case 1:
                    value= "00000";
                    break;
                case 2:
                    value = "0000";
                    break;
                case 3:
                    value = "000";
                    break;
                case 4:
                    value = "00";
                    break;
                case 5:
                    value = "0";
                    break;
                default:
                    break;                    

            }

            return value + studentId.ToString();
        }
    }
}
