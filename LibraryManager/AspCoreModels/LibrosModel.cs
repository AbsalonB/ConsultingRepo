using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace AspCoreModels
{
    [DataContract]
    public class LibrosModel
    {
        [DataMember(Name = "idLibro")]
        public int IdLibro { get; set; }

        [DataMember(Name = "titulo")]
        public string Titulo { get; set; }

        [DataMember(Name = "idEditorial")]
        public int IdEditorial { get; set; }

        [DataMember(Name = "editorial")]
        public string Editorial { get; set; }

        [DataMember(Name = "idArea")]
        public int IdArea { get; set; }

        [DataMember(Name = "area")]
        public string Area { get; set; }
    }
}
