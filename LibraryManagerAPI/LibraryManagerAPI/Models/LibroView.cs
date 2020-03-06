using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class LibroView
    {
        public int IdLibro { get; set; }
        public string Titulo { get; set; }
        public int IdEditorial { get; set; }
        public string Editorial { get; set; }
        public int IdArea { get; set; }
        public string Area { get; set; }
    }
}
