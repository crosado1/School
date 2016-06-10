using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class StudentPayConfigurationModel
    {
        public int PeriodGradeStudentTranTypeConfigurationId { get; set; }
        public PeriodGradeStudentModel PeriodGradeStudentModel { get; set; }
        public int TransactionTypeId { get; set; }
        public decimal PayConfiguration { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public int RunScheduleId { get; set; }
    }
}
