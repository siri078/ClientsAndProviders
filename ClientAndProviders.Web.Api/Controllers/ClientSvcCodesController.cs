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
    public class ClientSvcCodesController : ApiController
    {
        private ClientsProvidersDbEntities db = new ClientsProvidersDbEntities();

        // GET: api/ClientSvcCodes
        public IQueryable<ClientSvcCode> GetClientSvcCodes()
        {
            return db.ClientSvcCodes;
        }

        // GET: api/ClientSvcCodes/5
        [ResponseType(typeof(ClientSvcCode))]
        public IHttpActionResult GetClientSvcCode(int id)
        {
            ClientSvcCode clientSvcCode = db.ClientSvcCodes.Find(id);
            if (clientSvcCode == null)
            {
                return NotFound();
            }

            return Ok(clientSvcCode);
        }

        // PUT: api/ClientSvcCodes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutClientSvcCode(int id, ClientSvcCode clientSvcCode)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != clientSvcCode.ClientId)
            {
                return BadRequest();
            }

            db.Entry(clientSvcCode).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClientSvcCodeExists(id))
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

        // POST: api/ClientSvcCodes
        [ResponseType(typeof(ClientSvcCode))]
        public IHttpActionResult PostClientSvcCode(ClientSvcCode clientSvcCode)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ClientSvcCodes.Add(clientSvcCode);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ClientSvcCodeExists(clientSvcCode.ClientId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = clientSvcCode.ClientId }, clientSvcCode);
        }

        // DELETE: api/ClientSvcCodes/5
        [ResponseType(typeof(ClientSvcCode))]
        public IHttpActionResult DeleteClientSvcCode(int id)
        {
            ClientSvcCode clientSvcCode = db.ClientSvcCodes.Find(id);
            if (clientSvcCode == null)
            {
                return NotFound();
            }

            db.ClientSvcCodes.Remove(clientSvcCode);
            db.SaveChanges();

            return Ok(clientSvcCode);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ClientSvcCodeExists(int id)
        {
            return db.ClientSvcCodes.Count(e => e.ClientId == id) > 0;
        }
    }
}