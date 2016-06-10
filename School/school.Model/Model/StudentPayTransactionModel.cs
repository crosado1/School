using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class StudentPayTransactionModel
    {
        public int StudentPayTransactionId { get; set; }

        public StudentPayConfigurationModel StudentPayConfigurationModel { get; set; }

        public DateTime TransactionDate { get; set; }

        public string StudentPayTransactionDescription { get; set; }


    }
}
