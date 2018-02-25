using AutoMapper;
using ClientAndProviders.Web.Api.ApiResponse;
using ClientAndProviders.Web.Api.Models;
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

namespace ClientAndProviders.Web.Api.Controllers
{
	[RoutePrefix("api/providerAvailableShifts")]
	public class ProviderAvailableShiftsController : ApiController
    {
		/// <summary>
		/// Gets All ProviderAvailableShifts
		/// </summary>
		/// <returns>All provider available shifts (for every provider)</returns>
		[HttpGet]
		[Route("")]
		public HttpResponseMessage Get()
		{
			ProviderAvailableShiftResponse[] response = null;
			using (var db = new ClientsProvidersDbEntities())
			{
				var providerAvailableShifts = db.ProviderAvailableShifts.ToArray();
				response = Mapper.Map<ProviderAvailableShift[], ProviderAvailableShiftResponse[]>(providerAvailableShifts);

			}
			return Request.CreateResponse(HttpStatusCode.OK, response);
		}

		/// <summary>
		/// Gets all providers available shifts for a given providerId
		/// </summary>
		/// <param name="id">providerId</param>
		/// <returns>an array of providers available shifts</returns>
		[HttpGet]
		public HttpResponseMessage Get(int id)
		{
			ProviderAvailableShiftResponse[] response = null;
			using (var db = new ClientsProvidersDbEntities())
			{
				var providerAvailableShifts = db.ProviderAvailableShifts.Where(x => x.ProviderId == id).ToArray();
				response = Mapper.Map<ProviderAvailableShift[], ProviderAvailableShiftResponse[]>(providerAvailableShifts);				
			}
			return Request.CreateResponse(HttpStatusCode.OK, response);
		}
								
		// PUT: api/ProviderAvailableShifts/5        
		[HttpPut]
		public IHttpActionResult PutProviderAvailableShift(int id, ProviderAvailableShift providerAvailableShift)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			if (id != providerAvailableShift.ProviderId)
			{
				return BadRequest();
			}
			using (var db = new ClientsProvidersDbEntities())
			{
				db.Entry(providerAvailableShift).State = EntityState.Modified;

				try
				{
					db.SaveChanges();
				}
				catch (DbUpdateConcurrencyException)
				{
					if (!ProviderAvailableShiftExists(id))
					{
						return NotFound();
					}
					else
					{
						throw;
					}
				}

				return StatusCode(HttpStatusCode.NoContent);
			}
		}
		private bool ProviderAvailableShiftExists(int id)
		{
			using (var db = new ClientsProvidersDbEntities())
			{
				return db.ProviderAvailableShifts.Count(e => e.ProviderId == id) > 0;
				}
		}
			/*
			// POST: api/ProviderAvailableShifts
			[ResponseType(typeof(ProviderAvailableShift))]
			public IHttpActionResult PostProviderAvailableShift(ProviderAvailableShift providerAvailableShift)
			{
				if (!ModelState.IsValid)
				{
					return BadRequest(ModelState);
				}

				db.ProviderAvailableShifts.Add(providerAvailableShift);

				try
				{
					db.SaveChanges();
				}
				catch (DbUpdateException)
				{
					if (ProviderAvailableShiftExists(providerAvailableShift.ProviderId))
					{
						return Conflict();
					}
					else
					{
						throw;
					}
				}

				return CreatedAtRoute("DefaultApi", new { id = providerAvailableShift.ProviderId }, providerAvailableShift);
			}

			// DELETE: api/ProviderAvailableShifts/5
			[ResponseType(typeof(ProviderAvailableShift))]
			public IHttpActionResult DeleteProviderAvailableShift(int id)
			{
				ProviderAvailableShift providerAvailableShift = db.ProviderAvailableShifts.Find(id);
				if (providerAvailableShift == null)
				{
					return NotFound();
				}

				db.ProviderAvailableShifts.Remove(providerAvailableShift);
				db.SaveChanges();

				return Ok(providerAvailableShift);
			}

			protected override void Dispose(bool disposing)
			{
				if (disposing)
				{
					db.Dispose();
				}
				base.Dispose(disposing);
			}
			*/



		}
}