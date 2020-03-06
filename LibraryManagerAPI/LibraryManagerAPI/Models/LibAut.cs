using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class LibAut
    {
        public int IdLibAut { get; set; }
        public int IdAutor { get; set; }
        public int IdLibro { get; set; }

        public virtual Autor IdAutorNavigation { get; set; }
        public virtual Libro IdLibroNavigation { get; set; }
    }
}
