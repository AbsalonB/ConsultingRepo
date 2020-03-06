using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class Nacionalidad
    {
        public Nacionalidad()
        {
            Autor = new HashSet<Autor>();
        }

        public int IdNacionalidad { get; set; }
        public string NombreNacionalidad { get; set; }

        public virtual ICollection<Autor> Autor { get; set; }
    }
}
