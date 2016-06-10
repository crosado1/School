using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(school.ui.Startup))]
namespace school.ui
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
