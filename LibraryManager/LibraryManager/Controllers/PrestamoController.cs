using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AspCoreModels;
using CoreAPIClient;
using LibraryManager.Factory;
using LibraryManager.Helper;
using LibraryManager.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Logging;

namespace LibraryManager.Controllers
{
    public class PrestamoController : Controller
    {
        LibraryManagerAPI libraryManagerAPI = new LibraryManagerAPI();
        private readonly ILogger<PrestamoController> _logger;
        List<AspCoreModels.EstudianteModel> dataEstudiantes;
        List<AspCoreModels.LibrosModel> dataLibros;
        public PrestamoController(ILogger<PrestamoController> logger)
        {
            _logger = logger;
            ApplicationSettings.WebApiUrl = libraryManagerAPI.Initial();
        }
        public async Task<IActionResult>  Index()
        {
            var data = await ApiClientFactory.Instance.GetPrestamos();
         
            return View(data);
        }

        // GET: Alumno/Create
        public async Task<IActionResult> Create()
        {
            dataEstudiantes = await ApiClientFactory.Instance.GetEstudiantes();
            dataLibros = await ApiClientFactory.Instance.GetLibros();
            ViewData["IdLector"] = new SelectList(dataEstudiantes, "IdLector", "Nombre");
            ViewData["IdLibro"] = new SelectList(dataLibros, "IdLibro", "Titulo");
            return View();
        }

        // POST: Alumno/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(PrestamoModel prestamo)
        {
            if (ModelState.IsValid)
            {
                var prestamoEntity = new PrestamoEntityModel()
                {  
                    IdLector=prestamo.IdLector,
                    IdLibro=prestamo.IdLibro,
                    FechaDevolucion=prestamo.FechaDevolucion,
                    FechaPrestamo=prestamo.FechaPrestamo,
                    Devuelto=prestamo.Devuelto
                };

                //var response = await ApiClientFactory.Instance.SavePrestamo(prestamoEntity);
                return RedirectToAction(nameof(Index));
            } 
            return View();
        }
    }
}