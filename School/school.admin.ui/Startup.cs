using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(school.admin.ui.Startup))]
namespace school.admin.ui
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
