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
    public class LibroController : Controller
    {
        LibraryManagerAPI libraryManagerAPI = new LibraryManagerAPI();
        private readonly ILogger<LibroController> _logger;

        public LibroController(ILogger<LibroController> logger)
        {
            _logger = logger;
            ApplicationSettings.WebApiUrl = libraryManagerAPI.Initial();
        }
        public async Task<IActionResult> Index()
        {
            var data = await ApiClientFactory.Instance.GetLibros();
            return View(data);
        }
    }
}