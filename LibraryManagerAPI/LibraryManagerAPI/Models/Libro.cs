using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class Libro
    {
        public Libro()
        {
            LibAut = new HashSet<LibAut>();
            Prestamo = new HashSet<Prestamo>();
        }

        public int IdLibro { get; set; }
        public string Titulo { get; set; }
        public int IdEditorial { get; set; }
        public int IdArea { get; set; }

        public virtual Area IdAreaNavigation { get; set; }
        public virtual Editorial IdEditorialNavigation { get; set; }
        public virtual ICollection<LibAut> LibAut { get; set; }
        public virtual ICollection<Prestamo> Prestamo { get; set; }
    }
}
