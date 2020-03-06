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
    public class AutorController : Controller
    {
        LibraryManagerAPI libraryManagerAPI = new LibraryManagerAPI();
        private readonly ILogger<AutorController> _logger;
        public AutorController(ILogger<AutorController> logger)
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