using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(ClientAndProviders.Web.Api.Startup))]

namespace ClientAndProviders.Web.Api
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
