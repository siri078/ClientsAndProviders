using AutoMapper;
using ClientAndProviders.Web.Api.ApiResponse;
using ClientAndProviders.Web.Api.Models;
using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.ModelBinding;

namespace ClientAndProviders.Web.Api.Controllers
{
	[RoutePrefix("api/providers")]
	public class ProvidersController : ApiController
	{

		[HttpGet]
		[Route("")]
		public HttpResponseMessage Get()
		{
			ProviderResponse[] response = null;
			using (var db = new ClientsProvidersDbEntities())
			{
				var providers = db.Providers.ToArray();
				response = Mapper.Map<Provider[], ProviderResponse[]>(providers);

			}
			return Request.CreateResponse(HttpStatusCode.OK, response);
		}

		/// <summary>
		/// gets a provider for a given providerId
		/// </summary>
		/// <param name="id">providerId</param>
		/// <returns>a provider matching the given providerId</returns>
		[HttpGet]
		public HttpResponseMessage Get(int id)
		{
			ProviderResponse response = null;
			using (var db = new ClientsProvidersDbEntities())
			{
				var provider = db.Providers.Where(x => x.ProviderId == id).FirstOrDefault();
				response = Mapper.Map<Provider, ProviderResponse>(provider);
			}
			return Request.CreateResponse(HttpStatusCode.OK, response);
		}


		/// <summary>
		/// PUT: sends and update to the provider object
		/// </summary>
		/// <param name="id"></param>
		/// <param name="provider"></param>
		/// <returns></returns>
		[HttpPut]
		public HttpResponseMessage Put(int id, Provider provider)
		{
			//quick check to determine if the provider is a valid provider?
			if (id != provider.ProviderId)
			{
				throw new HttpResponseException(HttpStatusCode.NotFound);
			}

			ProviderResponse response = null;
			using (var db = new ClientsProvidersDbEntities())
			{
				response = Mapper.Map<Provider, ProviderResponse>(provider);

				db.Providers.Add(provider);
				try
				{
					db.SaveChanges();
				}
				catch (Exception ex)
				{
					var myError = ex.Message;
				}

				return Request.CreateResponse(HttpStatusCode.OK, response);
			}
		}

		[HttpPost]
		public HttpResponseMessage Post(Provider provider)
		{			
			ProviderResponse[] response = null;
			using (var db = new ClientsProvidersDbEntities())
			{
				var providerRecord = new Provider();
				providerRecord.FirstName = provider.FirstName;
				providerRecord.LastName = provider.LastName;
				providerRecord.Active = provider.Active;

				try
				{
					db.SaveChanges();
				}
				catch (Exception ex)
				{
					string errors = "Could not save provider";
				}

				response = Mapper.Map<Provider, ProviderResponse[]>(provider);
				return Request.CreateResponse(HttpStatusCode.OK, response);
			}
		}


		//// GET: api/Providers/5
		//[ResponseType(typeof(Provider))]
		//public IHttpActionResult GetProvider(int id)
		//{
		//    Provider provider = db.Providers.Find(id);
		//    if (provider == null)
		//    {
		//        return NotFound();
		//    }

		//    return Ok(provider);
		//}

		//// PUT: api/Providers/5
		//[ResponseType(typeof(void))]
		//public IHttpActionResult PutProvider(int id, Provider provider)
		//{
		//    if (id != provider.ProviderId)
		//    {
		//        return BadRequest();
		//    }

		//    db.Entry(provider).State = EntityState.Modified;

		//    try
		//    {
		//        db.SaveChanges();
		//    }
		//    catch (DbUpdateConcurrencyException)
		//    {
		//        if (!ProviderExists(id))
		//        {
		//            return NotFound();
		//        }
		//        else
		//        {
		//            throw;
		//        }
		//    }

		//    return StatusCode(HttpStatusCode.NoContent);
		//}

		//// POST: api/Providers
		//[ResponseType(typeof(Provider))]
		//public IHttpActionResult PostProvider(Provider provider)
		//{

		//    db.Providers.Add(provider);
		//    db.SaveChanges();

		//    return CreatedAtRoute("DefaultApi", new { id = provider.ProviderId }, provider);
		//}

		//// DELETE: api/Providers/5
		//[ResponseType(typeof(Provider))]
		//public IHttpActionResult DeleteProvider(int id)
		//{
		//    Provider provider = db.Providers.Find(id);
		//    if (provider == null)
		//    {
		//        return NotFound();
		//    }

		//    db.Providers.Remove(provider);
		//    db.SaveChanges();

		//    return Ok(provider);
		//}

		//protected override void Dispose(bool disposing)
		//{
		//    if (disposing)
		//    {
		//        db.Dispose();
		//    }
		//    base.Dispose(disposing);
		//}

		//private bool ProviderExists(int id)
		//{
		//    return db.Providers.Count(e => e.ProviderId == id) > 0;
		//}
	}
}