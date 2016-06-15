using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Model
{
    public class TransactionTypeModel
    {
        public int TransactionTypeId { get; set; }
        public string TransactionTypeDescription { get; set; }

        public bool MarkOfDefault { get; set; }

        public int RunScheduleId { get; set; }
    }
}
