//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ClientAndProviders.Web.Api.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Client
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Client()
        {
            this.ClientShiftAssignments = new HashSet<ClientShiftAssignment>();
            this.ClientSvcCodes = new HashSet<ClientSvcCode>();
        }
    
        public int ClientId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public bool Active { get; set; }
        public string Gender { get; set; }
        public Nullable<System.DateTime> Birthdate { get; set; }
        public string EmailAddr { get; set; }
        public string GenderPreference { get; set; }
        public string ResponsibleParty { get; set; }
        public string ResponsiblePartyContact { get; set; }
        public string Notes { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> LastModifiedDate { get; set; }
        public string LastModifiedBy { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientShiftAssignment> ClientShiftAssignments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientSvcCode> ClientSvcCodes { get; set; }
    }
}
