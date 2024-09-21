using FluentAssertions.Common;
using Microsoft.Extensions.DependencyInjection;
using SolidToken.SpecFlow.DependencyInjection;
using yTestFramework.Driver;
using yTestFramework.Extensions;

namespace ySpecFlow
{
    public static class Startup
    {

        [ScenarioDependencies]
        public static IServiceCollection CreateServices()
        {

            var services = new ServiceCollection();
            services.UseWebDriverInitializer();
            services.AddScoped<IBrowserDriver, BrowserDriver>();
            services.AddScoped<IDriverFixture, DriverFixture>();

            services.AddScoped<IAgentLoginPage, AgentLoginPage>();
            services.AddScoped<IAgentHomePage, AgentHomePage>();
            services.AddScoped<IAgentHeaderComponentPage, AgentHeaderPageComponent>();
            services.AddScoped<ISocialLoginPage, SocialLoginPage>();
            services.AddScoped<IFacebookLoginPage, FacebookLoginPage>();
            services.AddScoped<ITwitterLoginPage,TwitterLoginPage>();
            services.AddScoped<IVipProfileListPage, VipProfileListPage>();
            services.AddScoped<IBlockedProfileListPage, BlockedProfileListPage>();


            return services;
        }
    }
}
