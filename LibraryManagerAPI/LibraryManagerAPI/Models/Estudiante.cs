using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class Estudiante
    {
        public Estudiante()
        {
            Prestamo = new HashSet<Prestamo>();
        }

        public int IdLector { get; set; }
        public string Ci { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Direccion { get; set; }
        public int IdCarrera { get; set; }
        public int Edad { get; set; }

        public virtual Carrera IdCarreraNavigation { get; set; }
        public virtual ICollection<Prestamo> Prestamo { get; set; }
    }
}
