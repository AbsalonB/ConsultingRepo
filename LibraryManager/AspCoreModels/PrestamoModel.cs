using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace AspCoreModels
{
    [DataContract]
    public class PrestamoModel
    {
        [DataMember(Name = "idPrestamo")]
        public int IdPrestamo { get; set; }

        [DataMember(Name = "idLector")]
        public int IdLector { get; set; }

        [DataMember(Name = "estudiante")]
        public string Estudiante { get; set; }

        [DataMember(Name = "fechaPrestamo")]
        public DateTime FechaPrestamo { get; set; }

        [DataMember(Name = "fechaDevolucion")]
        public DateTime FechaDevolucion { get; set; }

        [DataMember(Name = "devuelto")]
        public bool Devuelto { get; set; }

        [DataMember(Name = "idLibro")]
        public int IdLibro { get; set; }

        [DataMember(Name = "titulo")]
        public string Titulo { get; set; }

        [DataMember(Name = "idEditorial")]
        public int IdEditorial { get; set; }

        [DataMember(Name = "editorial")]
        public string Editorial { get; set; } 
    }
}
