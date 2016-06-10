using school.Model.Model;
using school.Model.Response;
using school.Repository.Abstract;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Repository.Abstract
{
    public interface IPayTransactionRepository : IGenericRepository<PayTransactionModel>, IDisposable
    {
        ServiceResponseWithResultset<PayTransactionModel> GetAllAvailablesPay(int periodGradeStudentId);
        SaveResult SubmitPayment(decimal paymentAmount,decimal balance, int studentPayTransactionId,int submitById);
        ServiceResponseWithResultset<PayTransactionModel> GetPayHistory(int periodGradeStudentId);
    }
}
