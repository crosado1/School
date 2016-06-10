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
    public interface IPeriodRepository: IGenericRepository<PeriodModel>, IDisposable
    {
        ServiceResponseWithResultset<SummaryResult> GetSummary();
    }
}
