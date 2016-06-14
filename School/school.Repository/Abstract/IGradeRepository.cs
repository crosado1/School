using school.Model.Model;
using school.Model.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Repository.Abstract
{
    public interface IGradeRepository:IGenericRepository<GradeModel>,IDisposable
    {
        ServiceResponseWithResultset<SummaryResult> GetSummary(int periodId);
        ServiceResponseWithResultset<SummaryAmountResult> GetExpenseSummary(int periodId);
        ServiceResponseWithResultset<PeriodGradeGroupModel> GetGroups(int periodGradeId);
        
    }
}
