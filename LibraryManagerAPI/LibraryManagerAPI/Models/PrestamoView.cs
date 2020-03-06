using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class PrestamoView
    {
        public int IdPrestamo { get; set; }
        public int IdLector { get; set; }
        public string Estudiante { get; set; }
        public DateTime FechaPrestamo { get; set; }
        public DateTime FechaDevolucion { get; set; }
        public bool Devuelto { get; set; }
        public int IdLibro { get; set; }
        public string Titulo { get; set; }
        public int IdEditorial { get; set; }
        public string Editorial { get; set; }
    }
}
