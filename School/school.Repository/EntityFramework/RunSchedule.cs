//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace school.Repository.EntityFramework
{
    using System;
    using System.Collections.Generic;
    
    public partial class RunSchedule
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RunSchedule()
        {
            this.PeriodGradeStudentTranTypeConfigurations = new HashSet<PeriodGradeStudentTranTypeConfiguration>();
        }
    
        public int runScheduleId { get; set; }
        public string runScheduleDescription { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PeriodGradeStudentTranTypeConfiguration> PeriodGradeStudentTranTypeConfigurations { get; set; }
    }
}
