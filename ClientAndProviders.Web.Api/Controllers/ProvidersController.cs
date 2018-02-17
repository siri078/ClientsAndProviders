﻿using AutoMapper;
using ClientAndProviders.Web.Api.ApiResponse;
using ClientAndProviders.Web.Api.Models;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

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

		public HttpResponseMessage Get(int id)
		{
			ProviderResponse[] response = null;
			using (var db = new ClientsProvidersDbEntities())
			{
				var provider = db.Providers.Find(id);
				response = Mapper.Map<Provider, ProviderResponse[]>(provider);

			}
			return Request.CreateResponse(HttpStatusCode.OK, response);
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