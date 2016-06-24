using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class PeriodModel
    {
        public int PeriodId { get; set; }
        public int YearFrom { get; set; }
        public int YearTo { get; set; }
        public string YearDescription { get; set; }
        public bool Active { get; set; }

        public PeriodStatusTypeModel PeriodStatusTypeModel { get; set; }
    }
}
