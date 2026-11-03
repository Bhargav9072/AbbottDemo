using System.Web;
using System.Web.Http;
using Dapper;
using EmployeeApi;

namespace EmployeeApi
{
    public class WebApiApplication : HttpApplication
    {
        protected void Application_Start()
        {
            // Maps snake_case columns (first_name) to PascalCase properties (FirstName)
            DefaultTypeMap.MatchNamesWithUnderscores = true;

            GlobalConfiguration.Configure(WebApiConfig.Register);
        }
    }
}
