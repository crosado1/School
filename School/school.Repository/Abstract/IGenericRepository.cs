using school.Model.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Repository.Abstract
{
    public interface IGenericRepository<T> where T : class
    {
        ServiceResponseWithResultset<T> GetAll();
        IQueryable<T> FindBy(T entity);
        SaveResult Add(T entity);
        SaveResult Delete(T entity);
        SaveResult Edit(T entity);
        //void Save();
    }
}
