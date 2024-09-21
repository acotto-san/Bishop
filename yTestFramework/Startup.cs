using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using yTestFramework.Driver;
using yTestFramework.Extensions;

namespace yTestFramework
{
    public class Startup
    {

        public void ConfigureServices(IServiceCollection services)
        {
            services.UseWebDriverInitializer();
            services.AddScoped<IBrowserDriver, BrowserDriver>();
            services.AddScoped<IDriverFixture, DriverFixture>();

        }
    }
}
