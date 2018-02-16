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
    public class WorkShiftsController : ApiController
    {
        private ClientsProvidersDbEntities db = new ClientsProvidersDbEntities();

        // GET: api/WorkShifts
        public IQueryable<WorkShift> GetWorkShifts()
        {
            return db.WorkShifts;
        }

        // GET: api/WorkShifts/5
        [ResponseType(typeof(WorkShift))]
        public IHttpActionResult GetWorkShift(string id)
        {
            WorkShift workShift = db.WorkShifts.Find(id);
            if (workShift == null)
            {
                return NotFound();
            }

            return Ok(workShift);
        }

        // PUT: api/WorkShifts/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutWorkShift(string id, WorkShift workShift)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != workShift.Shift)
            {
                return BadRequest();
            }

            db.Entry(workShift).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!WorkShiftExists(id))
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

        // POST: api/WorkShifts
        [ResponseType(typeof(WorkShift))]
        public IHttpActionResult PostWorkShift(WorkShift workShift)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.WorkShifts.Add(workShift);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (WorkShiftExists(workShift.Shift))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = workShift.Shift }, workShift);
        }

        // DELETE: api/WorkShifts/5
        [ResponseType(typeof(WorkShift))]
        public IHttpActionResult DeleteWorkShift(string id)
        {
            WorkShift workShift = db.WorkShifts.Find(id);
            if (workShift == null)
            {
                return NotFound();
            }

            db.WorkShifts.Remove(workShift);
            db.SaveChanges();

            return Ok(workShift);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool WorkShiftExists(string id)
        {
            return db.WorkShifts.Count(e => e.Shift == id) > 0;
        }
    }
}