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
    
    public partial class PeriodGradeGroup
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PeriodGradeGroup()
        {
            this.PeriodGradeStudents = new HashSet<PeriodGradeStudent>();
        }
    
        public int periodGradeGroupId { get; set; }
        public int periodGradeId { get; set; }
        public string groupDescription { get; set; }
    
        public virtual PeriodGrade PeriodGrade { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PeriodGradeStudent> PeriodGradeStudents { get; set; }
    }
}
