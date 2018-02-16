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
    public class ProviderSvcCodesController : ApiController
    {
        private ClientsProvidersDbEntities db = new ClientsProvidersDbEntities();

        // GET: api/ProviderSvcCodes
        public IQueryable<ProviderSvcCode> GetProviderSvcCodes()
        {
            return db.ProviderSvcCodes;
        }

        // GET: api/ProviderSvcCodes/5
        [ResponseType(typeof(ProviderSvcCode))]
        public IHttpActionResult GetProviderSvcCode(int id)
        {
            ProviderSvcCode providerSvcCode = db.ProviderSvcCodes.Find(id);
            if (providerSvcCode == null)
            {
                return NotFound();
            }

            return Ok(providerSvcCode);
        }

        // PUT: api/ProviderSvcCodes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProviderSvcCode(int id, ProviderSvcCode providerSvcCode)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != providerSvcCode.ProviderId)
            {
                return BadRequest();
            }

            db.Entry(providerSvcCode).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProviderSvcCodeExists(id))
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

        // POST: api/ProviderSvcCodes
        [ResponseType(typeof(ProviderSvcCode))]
        public IHttpActionResult PostProviderSvcCode(ProviderSvcCode providerSvcCode)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ProviderSvcCodes.Add(providerSvcCode);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ProviderSvcCodeExists(providerSvcCode.ProviderId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = providerSvcCode.ProviderId }, providerSvcCode);
        }

        // DELETE: api/ProviderSvcCodes/5
        [ResponseType(typeof(ProviderSvcCode))]
        public IHttpActionResult DeleteProviderSvcCode(int id)
        {
            ProviderSvcCode providerSvcCode = db.ProviderSvcCodes.Find(id);
            if (providerSvcCode == null)
            {
                return NotFound();
            }

            db.ProviderSvcCodes.Remove(providerSvcCode);
            db.SaveChanges();

            return Ok(providerSvcCode);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProviderSvcCodeExists(int id)
        {
            return db.ProviderSvcCodes.Count(e => e.ProviderId == id) > 0;
        }
    }
}