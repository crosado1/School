using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class PayTransactionModel
    {
        public int PayTransactionId { get; set; }

        public StudentPayTransactionModel StudentPayTransactionModel { get; set; }

        public decimal PayAmount { get; set; }

        public DateTime PayDate { get; set; }

        public decimal Remaining { get; set; }

        public string Grade { get; set; }
        public string YearDescription { get; set; }
    }
}
