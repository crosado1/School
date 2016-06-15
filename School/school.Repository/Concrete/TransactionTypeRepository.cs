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
    public class TransactionTypeRepository : ITransactionTypeRepository
    {
        private SchoolEntities _context;
        public TransactionTypeRepository()
        {
            _context = new SchoolEntities();
        }
        public SaveResult Add(TransactionTypeModel entity)
        {
            throw new NotImplementedException();
        }

        public SaveResult Delete(TransactionTypeModel entity)
        {
            throw new NotImplementedException();
        }

        public SaveResult Edit(TransactionTypeModel entity)
        {
            throw new NotImplementedException();
        }

        public IQueryable<TransactionTypeModel> FindBy(TransactionTypeModel entity)
        {
            throw new NotImplementedException();
        }

        public ServiceResponseWithResultset<TransactionTypeModel> GetAll()
        {

            try
            {
                var result = this._context.TransactionTypes.ToList();
                List<TransactionTypeModel> collection = new List<TransactionTypeModel>();
                foreach (var item in result)
                {
                    collection.Add(new TransactionTypeModel
                    {
                        TransactionTypeDescription = item.transactionTypeDescription,
                        TransactionTypeId = item.transactionTypeId,
                        MarkOfDefault = item.markOfDefault.HasValue?item.markOfDefault.Value:false
                    });
                }

                return new ServiceResponseWithResultset<TransactionTypeModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Success,
                    Reason = "OK",
                    Data = collection
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponseWithResultset<TransactionTypeModel>
                {
                    Response = Model.Enumerator.Enum.ServiceResponses.Failure,
                    Reason = "Error on GetAll method. " + ex.InnerException != null ? ex.InnerException.Message : ex.Message

                };
            }
        }
    }
}
