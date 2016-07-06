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
    public class PayTransactionRepository : IPayTransactionRepository
    {
        private SchoolEntities _context;
        public PayTransactionRepository()
        {
            _context = new SchoolEntities();
        }
        public SaveResult Add(PayTransactionModel entity)
        {
            throw new NotImplementedException();
        }

        public SaveResult Delete(PayTransactionModel entity)
        {
            throw new NotImplementedException();
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }

        public SaveResult Edit(PayTransactionModel entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<PayTransactionModel> FindBy(PayTransactionModel entity)
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<PayTransactionModel> GetAll()
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<PayTransactionModel> GetAllAvailablesPay(int studentId)
        {
            try
            {
                var result = this._context.proc_Student_PaymentAvailable(studentId).ToList();
                List<PayTransactionModel> collection = new List<PayTransactionModel>();
                foreach (var item in result)
                {
                    collection.Add(new PayTransactionModel
                    {
                        PayAmount=item.payAmount.Value,
                        Remaining=item.remaining.Value,
                        Grade = item.gradeDescription,
                        YearDescription = item.yearFrom + " - " + item.yearTo,                         
                         StudentPayTransactionModel = new StudentPayTransactionModel
                         {
                             StudentPayConfigurationModel = new StudentPayConfigurationModel
                             {
                                 PayConfiguration = item.payConfiguration,
                                 PeriodGradeStudentTranTypeConfigurationId = item.periodGradeStudentTranTypeConfigurationId,
                                  PeriodGradeStudentModel = new PeriodGradeStudentModel
                                  {
                                       PeriodGradeStudentId = item.periodGradeStudentId
                                  }                                  
                             },
                             StudentPayTransactionDescription = item.studentPayTransactionDescription,
                             StudentPayTransactionId = item.studentPayTransactionId,
                             TransactionDate = item.transactionDate,
                         }
                         
                    });
                }

                return new ServiceResponseWithResultset<PayTransactionModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<PayTransactionModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetAllAvailablesPay method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }

        public ServiceResponseWithResultset<StudentTransactionModel> GetAllByStudent(int studentId)
        {
            try
            {
                var result = this._context.proc_PayTransaction_GetAllByStudent(studentId).ToList();
                List<StudentTransactionModel> collection = new List<StudentTransactionModel>();
                foreach (var item in result)
                {
                    collection.Add(new StudentTransactionModel
                    {
                        PayConfiguration = item.payConfiguration,
                        PayTransactionStatusTypeDescription = item.payTransactionStatusTypeDescription,
                        PeriodGradeStudentId = item.periodGradeStudentId,
                        PeriodYear = item.PeriodYear,
                        Restante = item.restante,
                        RunScheduleDescription = item.runScheduleDescription,
                        StudentPayTransactionDescription = item.studentPayTransactionDescription,
                        TotalAmount = item.TotalAmount,
                        TransactionTypeDescription = item.transactionTypeDescription
                    });
                }

                return new ServiceResponseWithResultset<StudentTransactionModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<StudentTransactionModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetAllByStudent method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }

        public ServiceResponseWithResultset<PayTransactionModel> GetPayHistory(int studentId)
        {
            try
            {
                var result = this._context.proc_PayTransaction_GetAll(studentId).ToList();
                List<PayTransactionModel> collection = new List<PayTransactionModel>();
                foreach (var item in result)
                {
                    collection.Add(new PayTransactionModel
                    {
                        YearDescription = item.yearFrom + " - " + item.yearTo,
                        Grade = item.gradeDescription,
                        PayAmount = item.payAmount,
                        PayDate = item.payDate,
                        PayTransactionId = item.payTransactionId,
                        StudentPayTransactionModel = new StudentPayTransactionModel
                        {
                            StudentPayTransactionDescription = item.studentPayTransactionDescription,
                        }
                    });
                }

                return new ServiceResponseWithResultset<PayTransactionModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<PayTransactionModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetPayHistory method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }

        public SaveResult SubmitPayment(decimal paymentAmount, decimal balance,int studentPayTransactionId, int submitById)
        {
            try
            {
                var result = _context.proc_PayTransaction_SubmitPay(studentPayTransactionId, paymentAmount, balance, submitById);


                return new SaveResult
                {
                    Id = studentPayTransactionId,
                    Status = "OK",
                    Message="Pay Transaction was saved successfully!"               
                };
            }
            catch(Exception ex)
            {
                return new SaveResult
                {
                     Status = "ERROR",
                     Message = "Error on SubmitPayment method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message
                };
            }
        }
    }
}
