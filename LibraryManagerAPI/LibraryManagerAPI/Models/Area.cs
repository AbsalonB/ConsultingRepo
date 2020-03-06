using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class Area
    {
        public Area()
        {
            Libro = new HashSet<Libro>();
        }

        public int IdArea { get; set; }
        public string NombreArea { get; set; }

        public virtual ICollection<Libro> Libro { get; set; }
    }
}
