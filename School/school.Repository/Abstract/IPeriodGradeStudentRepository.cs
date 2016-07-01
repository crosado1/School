using school.Model.Model;
using school.Model.Model.Request;
using school.Model.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Repository.Abstract
{
    public interface IPeriodGradeStudentRepository : IGenericRepository<PeriodGradeStudentModel>, IDisposable
    {
        ServiceResponseWithResultset<PeriodGradeStudentModel> GetAll(Search_StudentRequest request);      

    }
}
