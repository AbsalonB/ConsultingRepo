using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class EstudianteView
    {
        public int IdLector { get; set; }
        public string Ci { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public int Edad { get; set; }
        public int IdCarrera { get; set; }
        public string Carrera { get; set; }
    }
}
