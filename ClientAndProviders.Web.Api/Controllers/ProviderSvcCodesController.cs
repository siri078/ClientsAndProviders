using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using AutoMapper;
using ClientAndProviders.Web.Api.ApiResponse;
using ClientAndProviders.Web.Api.Models;

namespace ClientAndProviders.Web.Api.Controllers
{
	[RoutePrefix("api/providerSvcCodes")]
	public class ProviderSvcCodesController : ApiController
    {
        private ClientsProvidersDbEntities db = new ClientsProvidersDbEntities();

		/// <summary>
		/// Gets all svc codes for all providers
		/// </summary>
		/// <returns></returns>
		[HttpGet]
		[Route("")]
		public HttpResponseMessage Get()
		{
			ProviderSvcCodesResponse[] response = null;
			using (var db = new ClientsProvidersDbEntities())
			{
				var providerSvcCodes = db.ProviderSvcCodes.ToArray();
				response = Mapper.Map<ProviderSvcCode[], ProviderSvcCodesResponse[]>(providerSvcCodes);

			}
			return Request.CreateResponse(HttpStatusCode.OK, response);
		}

		/// <summary>
		/// Gets all provider svcCodes for a given providerId
		/// </summary>
		/// <param name="id">providerId</param>
		/// <returns>an array of provider svcCodes</returns>
		[HttpGet]
		public HttpResponseMessage Get(int id)
		{
			ProviderSvcCodesResponse[] response = null;
			using (var db = new ClientsProvidersDbEntities())
			{
				var providerSvcCodes = db.ProviderSvcCodes.Where(x => x.ProviderId == id).ToArray();
				response = Mapper.Map<ProviderSvcCode[], ProviderSvcCodesResponse[]>(providerSvcCodes);
			}
			return Request.CreateResponse(HttpStatusCode.OK, response);
		}		

        private bool ProviderSvcCodeExists(int id)
        {
            return db.ProviderSvcCodes.Count(e => e.ProviderId == id) > 0;
        }
    }
}