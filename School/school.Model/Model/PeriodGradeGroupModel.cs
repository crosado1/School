using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class PeriodGradeGroupModel
    {
        public int PeriodGradeGroupId { get; set; }
        public PeriodGradeModel PeriodGradeModel { get; set; }
        public string GroupDescription { get; set; }
        public string GroupNumber { get; set; }
        public int LeaderId { get; set; }
        public string LeaderFullName { get; set; }
        public int StudentCount { get; set; }
    }
}
