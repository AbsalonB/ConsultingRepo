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
    public class LibroViewsController : ControllerBase
    {
        private readonly BIBLIOTECAContext _context;

        public LibroViewsController(BIBLIOTECAContext context)
        {
            _context = context;
        }

        // GET: api/LibroViews
        [HttpGet]
        public async Task<ActionResult<IEnumerable<LibroView>>> GetLibroView()
        {
            return await _context.LibroView.ToListAsync();
        }

        // GET: api/LibroViews/5
        [HttpGet("{id}")]
        public async Task<ActionResult<LibroView>> GetLibroView(int id)
        {
            var libroView = await _context.LibroView.FindAsync(id);

            if (libroView == null)
            {
                return NotFound();
            }

            return libroView;
        }

        // PUT: api/LibroViews/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutLibroView(int id, LibroView libroView)
        {
            if (id != libroView.IdLibro)
            {
                return BadRequest();
            }

            _context.Entry(libroView).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LibroViewExists(id))
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

        // POST: api/LibroViews
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<LibroView>> PostLibroView(LibroView libroView)
        {
            _context.LibroView.Add(libroView);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetLibroView", new { id = libroView.IdLibro }, libroView);
        }

        // DELETE: api/LibroViews/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<LibroView>> DeleteLibroView(int id)
        {
            var libroView = await _context.LibroView.FindAsync(id);
            if (libroView == null)
            {
                return NotFound();
            }

            _context.LibroView.Remove(libroView);
            await _context.SaveChangesAsync();

            return libroView;
        }

        private bool LibroViewExists(int id)
        {
            return _context.LibroView.Any(e => e.IdLibro == id);
        }
    }
}
