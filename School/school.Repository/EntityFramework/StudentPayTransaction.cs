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
    
    public partial class StudentPayTransaction
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public StudentPayTransaction()
        {
            this.PayTransactions = new HashSet<PayTransaction>();
            this.StudentPayTransactionStatus = new HashSet<StudentPayTransactionStatu>();
        }
    
        public int studentPayTransactionId { get; set; }
        public int periodGradeStudentTranTypeConfigurationId { get; set; }
        public System.DateTime transactionDate { get; set; }
        public string studentPayTransactionDescription { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PayTransaction> PayTransactions { get; set; }
        public virtual PeriodGradeStudentTranTypeConfiguration PeriodGradeStudentTranTypeConfiguration { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentPayTransactionStatu> StudentPayTransactionStatus { get; set; }
    }
}
