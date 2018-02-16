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
    public class ClientShiftAssignmentsController : ApiController
    {
        private ClientsProvidersDbEntities db = new ClientsProvidersDbEntities();

        // GET: api/ClientShiftAssignments
        public IQueryable<ClientShiftAssignment> GetClientShiftAssignments()
        {
            return db.ClientShiftAssignments;
        }

        // GET: api/ClientShiftAssignments/5
        [ResponseType(typeof(ClientShiftAssignment))]
        public IHttpActionResult GetClientShiftAssignment(int id)
        {
            ClientShiftAssignment clientShiftAssignment = db.ClientShiftAssignments.Find(id);
            if (clientShiftAssignment == null)
            {
                return NotFound();
            }

            return Ok(clientShiftAssignment);
        }

        // PUT: api/ClientShiftAssignments/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutClientShiftAssignment(int id, ClientShiftAssignment clientShiftAssignment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != clientShiftAssignment.ClientId)
            {
                return BadRequest();
            }

            db.Entry(clientShiftAssignment).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ClientShiftAssignmentExists(id))
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

        // POST: api/ClientShiftAssignments
        [ResponseType(typeof(ClientShiftAssignment))]
        public IHttpActionResult PostClientShiftAssignment(ClientShiftAssignment clientShiftAssignment)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ClientShiftAssignments.Add(clientShiftAssignment);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ClientShiftAssignmentExists(clientShiftAssignment.ClientId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = clientShiftAssignment.ClientId }, clientShiftAssignment);
        }

        // DELETE: api/ClientShiftAssignments/5
        [ResponseType(typeof(ClientShiftAssignment))]
        public IHttpActionResult DeleteClientShiftAssignment(int id)
        {
            ClientShiftAssignment clientShiftAssignment = db.ClientShiftAssignments.Find(id);
            if (clientShiftAssignment == null)
            {
                return NotFound();
            }

            db.ClientShiftAssignments.Remove(clientShiftAssignment);
            db.SaveChanges();

            return Ok(clientShiftAssignment);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ClientShiftAssignmentExists(int id)
        {
            return db.ClientShiftAssignments.Count(e => e.ClientId == id) > 0;
        }
    }
}