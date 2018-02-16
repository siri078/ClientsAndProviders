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
    public class SvcCodesController : ApiController
    {
        private ClientsProvidersDbEntities db = new ClientsProvidersDbEntities();

        // GET: api/SvcCodes
        public IQueryable<SvcCode> GetSvcCodes()
        {
            return db.SvcCodes;
        }

        // GET: api/SvcCodes/5
        [ResponseType(typeof(SvcCode))]
        public IHttpActionResult GetSvcCode(string id)
        {
            SvcCode svcCode = db.SvcCodes.Find(id);
            if (svcCode == null)
            {
                return NotFound();
            }

            return Ok(svcCode);
        }

        // PUT: api/SvcCodes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutSvcCode(string id, SvcCode svcCode)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != svcCode.SvcCodeValue)
            {
                return BadRequest();
            }

            db.Entry(svcCode).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SvcCodeExists(id))
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

        // POST: api/SvcCodes
        [ResponseType(typeof(SvcCode))]
        public IHttpActionResult PostSvcCode(SvcCode svcCode)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.SvcCodes.Add(svcCode);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (SvcCodeExists(svcCode.SvcCodeValue))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = svcCode.SvcCodeValue }, svcCode);
        }

        // DELETE: api/SvcCodes/5
        [ResponseType(typeof(SvcCode))]
        public IHttpActionResult DeleteSvcCode(string id)
        {
            SvcCode svcCode = db.SvcCodes.Find(id);
            if (svcCode == null)
            {
                return NotFound();
            }

            db.SvcCodes.Remove(svcCode);
            db.SaveChanges();

            return Ok(svcCode);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool SvcCodeExists(string id)
        {
            return db.SvcCodes.Count(e => e.SvcCodeValue == id) > 0;
        }
    }
}