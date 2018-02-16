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
using ClientAndProviders.Web.Api.Models;

namespace ClientAndProviders.Web.Api.Controllers
{
    public class ProviderAvailableShiftsController : ApiController
    {
        private ClientsProvidersDbEntities db = new ClientsProvidersDbEntities();

        // GET: api/ProviderAvailableShifts
        public IQueryable<ProviderAvailableShift> GetProviderAvailableShifts()
        {
            return db.ProviderAvailableShifts;
        }

        // GET: api/ProviderAvailableShifts/5
        [ResponseType(typeof(ProviderAvailableShift))]
        public IHttpActionResult GetProviderAvailableShift(int id)
        {
            ProviderAvailableShift providerAvailableShift = db.ProviderAvailableShifts.Find(id);
            if (providerAvailableShift == null)
            {
                return NotFound();
            }

            return Ok(providerAvailableShift);
        }

        // PUT: api/ProviderAvailableShifts/5
        [ResponseType(typeof(void))]
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

        private bool ProviderAvailableShiftExists(int id)
        {
            return db.ProviderAvailableShifts.Count(e => e.ProviderId == id) > 0;
        }
    }
}