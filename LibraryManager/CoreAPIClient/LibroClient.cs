using AspCoreModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace CoreAPIClient
{
    public partial  class ApiClient
    {
        public async Task<List<LibrosModel>> GetLibros()
        {
            var requestUrl = CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture,
                "LibroViews"));
            return await GetAsync<List<LibrosModel>>(requestUrl);
        }

        //public async Task<Message<LibrosModel>> SaveUser(UsersModel model)
        //{
        //    var requestUrl = CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture,
        //        "User/SaveUser"));
        //    return await PostAsync<UsersModel>(requestUrl, model);
        //}
    }
}
