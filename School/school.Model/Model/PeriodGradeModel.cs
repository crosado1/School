using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class PeriodGradeModel
    {
        public int PeriodGradeId { get; set; }
        public PeriodModel PeriodModel { get; set; }
        public GradeModel GradeModel { get; set; }
    }
}
