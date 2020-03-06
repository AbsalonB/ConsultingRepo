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
    public class EstudianteViewsController : ControllerBase
    {
        private readonly BIBLIOTECAContext _context;

        public EstudianteViewsController(BIBLIOTECAContext context)
        {
            _context = context;
        }

        // GET: api/EstudianteViews
        [HttpGet]
        public async Task<ActionResult<IEnumerable<EstudianteView>>> GetEstudianteView()
        {
            return await _context.EstudianteView.ToListAsync();
        }

        // GET: api/EstudianteViews/5
        [HttpGet("{id}")]
        public async Task<ActionResult<EstudianteView>> GetEstudianteView(int id)
        {
            var estudianteView = await _context.EstudianteView.FindAsync(id);

            if (estudianteView == null)
            {
                return NotFound();
            }

            return estudianteView;
        }

        // PUT: api/EstudianteViews/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutEstudianteView(int id, EstudianteView estudianteView)
        {
            if (id != estudianteView.IdLector)
            {
                return BadRequest();
            }

            _context.Entry(estudianteView).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!EstudianteViewExists(id))
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

        // POST: api/EstudianteViews
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<EstudianteView>> PostEstudianteView(EstudianteView estudianteView)
        {
            _context.EstudianteView.Add(estudianteView);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEstudianteView", new { id = estudianteView.IdLector }, estudianteView);
        }

        // DELETE: api/EstudianteViews/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<EstudianteView>> DeleteEstudianteView(int id)
        {
            var estudianteView = await _context.EstudianteView.FindAsync(id);
            if (estudianteView == null)
            {
                return NotFound();
            }

            _context.EstudianteView.Remove(estudianteView);
            await _context.SaveChangesAsync();

            return estudianteView;
        }

        private bool EstudianteViewExists(int id)
        {
            return _context.EstudianteView.Any(e => e.IdLector == id);
        }
    }
}
