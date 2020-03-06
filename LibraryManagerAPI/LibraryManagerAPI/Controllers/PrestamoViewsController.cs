using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using LibraryManagerAPI.Models;

namespace LibraryManagerAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrestamoViewsController : ControllerBase
    {
        private readonly BIBLIOTECAContext _context;

        public PrestamoViewsController(BIBLIOTECAContext context)
        {
            _context = context;
        }

        // GET: api/PrestamoViews
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PrestamoView>>> GetPrestamoView()
        {
            return await _context.PrestamoView.ToListAsync();
        }

        // GET: api/PrestamoViews/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PrestamoView>> GetPrestamoView(int id)
        {
            var prestamoView = await _context.PrestamoView.FindAsync(id);

            if (prestamoView == null)
            {
                return NotFound();
            }

            return prestamoView;
        }

        // PUT: api/PrestamoViews/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPrestamoView(int id, PrestamoView prestamoView)
        {
            if (id != prestamoView.IdPrestamo)
            {
                return BadRequest();
            }

            _context.Entry(prestamoView).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PrestamoViewExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/PrestamoViews
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<PrestamoView>> PostPrestamoView(PrestamoView prestamoView)
        {
            _context.PrestamoView.Add(prestamoView);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPrestamoView", new { id = prestamoView.IdPrestamo }, prestamoView);
        }

        // DELETE: api/PrestamoViews/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PrestamoView>> DeletePrestamoView(int id)
        {
            var prestamoView = await _context.PrestamoView.FindAsync(id);
            if (prestamoView == null)
            {
                return NotFound();
            }

            _context.PrestamoView.Remove(prestamoView);
            await _context.SaveChangesAsync();

            return prestamoView;
        }

        private bool PrestamoViewExists(int id)
        {
            return _context.PrestamoView.Any(e => e.IdPrestamo == id);
        }
    }
}
