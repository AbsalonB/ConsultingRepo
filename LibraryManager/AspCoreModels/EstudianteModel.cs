using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;

namespace AspCoreModels
{
    [DataContract]
    public class EstudianteModel
    {
        [DataMember(Name = "idLector")]
        public int IdLector { get; set; }

        [DataMember(Name = "ci")]
        public string CI { get; set; }

        [DataMember(Name = "nombre")]
        public string Nombre { get; set; }

        [DataMember(Name = "apellido")]
        public string Apellido { get; set; }

        [DataMember(Name = "direccion")]
        public string Direccion { get; set; }

        [DataMember(Name = "edad")]
        public int Edad { get; set; }

        [DataMember(Name = "idCarrera")]
        public int IdCarrera { get; set; }

        [DataMember(Name = "carrera")]
        public string Carrera { get; set; } 
    }
}
