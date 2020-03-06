using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class Carrera
    {
        public Carrera()
        {
            Estudiante = new HashSet<Estudiante>();
        }

        public int IdCarrera { get; set; }
        public string NombreCarrera { get; set; }

        public virtual ICollection<Estudiante> Estudiante { get; set; }
    }
}
