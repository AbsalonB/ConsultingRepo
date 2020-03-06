using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using LibraryManager.Factory;
using LibraryManager.Helper;
using LibraryManager.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace LibraryManager.Controllers
{
    public class EstudianteController : Controller
    {
        LibraryManagerAPI libraryManagerAPI = new LibraryManagerAPI();
        private readonly ILogger<EstudianteController> _logger;
        public EstudianteController(ILogger<EstudianteController> logger)
        {
            _logger = logger;
            ApplicationSettings.WebApiUrl = libraryManagerAPI.Initial();
        }
        public async Task<IActionResult> Index()
        {
            var dataEstudiantes = await ApiClientFactory.Instance.GetEstudiantes();
            return View(dataEstudiantes);  
        }
    }
}