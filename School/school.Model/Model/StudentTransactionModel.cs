using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class StudentTransactionModel
    {
        public string PeriodYear { get; set; }
        public decimal PayConfiguration { get; set; }
        public Nullable<decimal> TotalAmount { get; set; }
        public string StudentPayTransactionDescription { get; set; }
        public int PeriodGradeStudentId { get; set; }
        public string RunScheduleDescription { get; set; }
        public Nullable<decimal> Restante { get; set; }
        public string PayTransactionStatusTypeDescription { get; set; }
        public string TransactionTypeDescription { get; set; }
    }
}
