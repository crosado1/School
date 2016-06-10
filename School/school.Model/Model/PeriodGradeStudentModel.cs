using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class PeriodGradeStudentModel
    {
        public int PeriodGradeStudentId { get; set; }
        public PeriodGradeGroupModel PeriodGradeGroupModel { get; set; }
        public StudentModel StudentModel { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime? ToDate { get; set; }
    }
}
