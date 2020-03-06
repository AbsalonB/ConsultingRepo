using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace CoreAPIClient
{
    [DataContract]
    public class PrestamoEntityModel
    { 
        [DataMember(Name = "IdLector")]
        public int IdLector { get; set; }


        [DataMember(Name = "IdLibro")]
        public int IdLibro { get; set; }
         

        [DataMember(Name = "FechaPrestamo")]
        public DateTime FechaPrestamo { get; set; }

        [DataMember(Name = "FechaDevolucion")]
        public DateTime FechaDevolucion { get; set; }

        [DataMember(Name = "Devuelto")]
        public bool Devuelto { get; set; }
         
    }
}
