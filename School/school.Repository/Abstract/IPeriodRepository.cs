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
        bool IsReadyToAdd();

        SaveResult Add(PeriodModel entity, school.Model.Enumerator.Enum.PeriodStatusTypes periodStatusType);
    }
}
