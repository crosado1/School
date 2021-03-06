﻿using school.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using school.Model.Model;
using school.Model.Response;
using school.Repository.EntityFramework;
using school.Model.Model.Request;
using System.Data.Entity.Core.Objects;

namespace school.Repository.Concrete
{
    public class PeriodGradeStudentRepository : IPeriodGradeStudentRepository
    {
        private SchoolEntities _context;
        public PeriodGradeStudentRepository()
        {
            _context = new SchoolEntities();
        }
        public SaveResult Add(PeriodGradeStudentModel entity)
        {
            try
            {
                ObjectParameter param1 = new ObjectParameter("periodGradeStudentId", entity.PeriodGradeStudentId);
                var result = _context.proc_PeriodGradeStudent_Insert(param1,entity.PeriodGradeGroupModel.PeriodGradeGroupId,
                                                                        entity.StudentModel.StudentId);
                return new SaveResult
                {
                    Id = (int)param1.Value,
                    Message = "Student Grade was created.",
                    Status = "OK"
                };
            }
            catch (Exception ex)
            {
                return new SaveResult
                {
                    Id = 0,
                    Message = "Error on PeriodGradeStudent Add method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message,
                    Status = "ERROR"
                };
            }
        }

        public SaveResult Delete(PeriodGradeStudentModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public SaveResult Edit(PeriodGradeStudentModel entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<PeriodGradeStudentModel> FindBy(PeriodGradeStudentModel entity)
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<PeriodGradeStudentModel> GetAll()
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<PeriodGradeStudentModel> GetAll(Search_StudentRequest request)
        {
            //throw new NotImplementedException();
            try
            {
                var result = this._context.proc_Grade_StudentDetailByPeriod(request.PeriodId, 
                                                                            request.GradeId, 
                                                                            request.FirstName, 
                                                                            request.LastName,
                                                                            request.GenderId, 
                                                                            request.StudentCode, 
                                                                            request.PageIndex, 
                                                                            request.PageSize.Equals(0)?10: request.PageSize,
                                                                            request.SortColumn, 
                                                                            "ASC").ToList();

                List<PeriodGradeStudentModel> collection = new List<PeriodGradeStudentModel>();
                var totalRecords = result.First().TotalRecord;
                foreach (var item in result)
                {
                    collection.Add(new PeriodGradeStudentModel
                    {
                        PeriodGradeStudentId=item.periodGradeStudentId,

                        StudentModel = new StudentModel
                        {
                            FirstName = item.firstName,
                            MiddleName = item.middleName,
                            LastName = item.lastName,
                            StudentId = item.studentId,
                            StudentCode = "123456",
                            GenderModel = new GenderModel
                            {
                                GenderDescription = item.genderDescription,
                                GenderLetter = item.genderLetter,
                                GenderId = item.genderId
                            },
                             IsReadyToNextYear = item.IsReadyToNextYear == 0?false:true
                        },
                        PeriodGradeGroupModel = new PeriodGradeGroupModel
                        {
                            GroupDescription = "01",
                            PeriodGradeGroupId = 1,
                            PeriodGradeModel = new PeriodGradeModel
                            {
                                PeriodGradeId = item.periodGradeId,
                                GradeModel = new GradeModel
                                {
                                    GradeDescription = item.gradeDescription,
                                    GradeId = item.gradeId
                                },
                                PeriodModel = new PeriodModel
                                {
                                    Active = true,
                                    PeriodId = item.periodId,
                                    YearDescription = item.YearDescription,
                                    YearFrom = item.YearFrom,
                                    YearTo = item.YearTo
                                }
                            }
                        }
                    });
                }
                

                return new ServiceResponseWithResultset<PeriodGradeStudentModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection,
                    TotalRecords= totalRecords
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<PeriodGradeStudentModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetAll method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }
    }
}
