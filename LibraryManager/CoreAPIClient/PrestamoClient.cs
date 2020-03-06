using AspCoreModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace CoreAPIClient
{
    public partial class ApiClient
    {
        public async Task<List<PrestamoModel>> GetPrestamos()
        {
            var requestUrl = CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture,
                "PrestamoViews"));
            return await GetAsync<List<PrestamoModel>>(requestUrl);
        }

        public async Task<Message<PrestamoEntityModel>> SavePrestamo(PrestamoEntityModel model)
        {
            var requestUrl = CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture,
                "Prestamoes"));
            return await PostAsync<PrestamoEntityModel>(requestUrl, model);
        }
    }
}
