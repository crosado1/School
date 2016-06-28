using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Enumerator
{
    public class Enum
    {
        public enum ServiceResponses
        {
            Success,
            Failure,
        }
        public enum UserRoles
        {
            Admin = 1,
            Teacher =2,
            User=3
        }

        public enum PeriodStatusTypes
        {
            InConfigurationStep=1,
            ConfigurationCompleted=2,
            ActivePeriod=3,
            PeriodCompleted=4
        }
    }
}
