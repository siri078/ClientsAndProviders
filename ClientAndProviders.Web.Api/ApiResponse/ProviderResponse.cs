using ClientAndProviders.Web.Api.Models;
using System;

namespace ClientAndProviders.Web.Api.ApiResponse
{
    public class ProviderResponse
    {
        public int ProviderId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public bool Active { get; set; }
        public string Gender { get; set; }
        public DateTime? HireDate { get; set; }
        public string EmailAddr { get; set; }
        public string Notes { get; set; }
        public DateTime? CreateDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? LastModifiedDate { get; set; }
        public string LastModifiedBy { get; set; }

		public ProviderAvailableShift[] ProviderAvailableShifts { get; set; }		
		public ProviderSvcCode[] ProviderSvcCodes { get; set; }

	}
}