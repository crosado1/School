using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace school.Model.Response
{
    public class ServiceResponseWithResultset<T> : ServiceResponse where T : class
    {
        public ServiceResponseWithResultset()
        {
            Data = new List<T>();
        }

        public List<T> Data { get; set; }
        public int TotalRecords { get; set; }
    }
}
