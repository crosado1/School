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
    
    public partial class Period
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Period()
        {
            this.PeriodGrades = new HashSet<PeriodGrade>();
            this.PeriodStatus = new HashSet<PeriodStatu>();
        }
    
        public int periodId { get; set; }
        public string yearFrom { get; set; }
        public string yearTo { get; set; }
        public Nullable<bool> active { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PeriodGrade> PeriodGrades { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PeriodStatu> PeriodStatus { get; set; }
    }
}
