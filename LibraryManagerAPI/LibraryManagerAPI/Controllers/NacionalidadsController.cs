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
    public class NacionalidadsController : ControllerBase
    {
        private readonly BIBLIOTECAContext _context;

        public NacionalidadsController(BIBLIOTECAContext context)
        {
            _context = context;
        }

        // GET: api/Nacionalidads
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Nacionalidad>>> GetNacionalidad()
        { 
                return await _context.Nacionalidad.ToListAsync();  
        }

        // GET: api/Nacionalidads/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Nacionalidad>> GetNacionalidad(int id)
        {
            var nacionalidad = await _context.Nacionalidad.FindAsync(id);

            if (nacionalidad == null)
            {
                return NotFound();
            }

            return nacionalidad;
        }

        // PUT: api/Nacionalidads/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutNacionalidad(int id, Nacionalidad nacionalidad)
        {
            if (id != nacionalidad.IdNacionalidad)
            {
                return BadRequest();
            }

            _context.Entry(nacionalidad).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!NacionalidadExists(id))
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

        // POST: api/Nacionalidads
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for
        // more details see https://aka.ms/RazorPagesCRUD.
        [HttpPost]
        public async Task<ActionResult<Nacionalidad>> PostNacionalidad(Nacionalidad nacionalidad)
        {
            _context.Nacionalidad.Add(nacionalidad);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetNacionalidad", new { id = nacionalidad.IdNacionalidad }, nacionalidad);
        }

        // DELETE: api/Nacionalidads/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Nacionalidad>> DeleteNacionalidad(int id)
        {
            var nacionalidad = await _context.Nacionalidad.FindAsync(id);
            if (nacionalidad == null)
            {
                return NotFound();
            }

            _context.Nacionalidad.Remove(nacionalidad);
            await _context.SaveChangesAsync();

            return nacionalidad;
        }

        private bool NacionalidadExists(int id)
        {
            return _context.Nacionalidad.Any(e => e.IdNacionalidad == id);
        }
    }
}
