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
    }
}
