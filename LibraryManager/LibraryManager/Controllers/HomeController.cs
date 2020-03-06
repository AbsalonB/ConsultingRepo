using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using LibraryManager.Models;
using LibraryManager.Helper;
using LibraryManager.Utility;
using LibraryManager.Factory;

namespace LibraryManager.Controllers
{
    public class HomeController : Controller
    {
        LibraryManagerAPI libraryManagerAPI = new LibraryManagerAPI();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
            ApplicationSettings.WebApiUrl = libraryManagerAPI.Initial();
        }

        public async Task<IActionResult> Index()
        {
            var data = await ApiClientFactory.Instance.GetLibros();
            return View(data);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
