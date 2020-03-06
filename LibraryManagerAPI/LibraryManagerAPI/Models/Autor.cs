using System;
using System.Collections.Generic;

namespace LibraryManagerAPI.Models
{
    public partial class Autor
    {
        public Autor()
        {
            LibAut = new HashSet<LibAut>();
        }

        public int IdAutor { get; set; }
        public string Nombre { get; set; }
        public int IdNacionalidad { get; set; }

        public virtual Nacionalidad IdNacionalidadNavigation { get; set; }
        public virtual ICollection<LibAut> LibAut { get; set; }
    }
}
