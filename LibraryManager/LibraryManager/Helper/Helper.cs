using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace LibraryManager.Helper
{
    public class LibraryManagerAPI
    {
        public string Initial()
        { 
            return "https://localhost:44336/api/";
        }
    }
}
