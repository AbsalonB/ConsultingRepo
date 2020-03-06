using AspCoreModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace CoreAPIClient
{
    public partial class ApiClient
    {
        public async Task<List<EstudianteModel>> GetEstudiantes()
        {
            var requestUrl = CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture,
                "EstudianteViews"));
            return await GetAsync<List<EstudianteModel>>(requestUrl);
        }
    }
}
