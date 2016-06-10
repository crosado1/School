using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace school.Model.Response
{
    public class ServiceResponse
    {        
        public school.Model.Enumerator.Enum.ServiceResponses Response { get; set; }        
        public string Reason { get; set; }
    }
}
