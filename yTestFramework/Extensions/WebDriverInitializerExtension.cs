using Microsoft.Extensions.DependencyInjection;
using yTestFramework.Settings;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using yTestFramework.Driver;
using System.Reflection;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace yTestFramework.Extensions
{
    public static class WebDriverInitializerExtension
    {

        public static IServiceCollection UseWebDriverInitializer(
            this IServiceCollection services)
        {
            services.AddSingleton(ReadConfig());
            
            return services;
        }

        public static TestSettings ReadConfig()
        {
            var configFile = File
                        .ReadAllText(Path.GetDirectoryName(
                        Assembly.GetExecutingAssembly().Location)
                        + "/appsettings.json");

            var jsonSerializeOptions = new JsonSerializerOptions()
            {
                PropertyNameCaseInsensitive = true
            };

            jsonSerializeOptions.Converters.Add(new JsonStringEnumConverter());



            var testSettings = JsonSerializer.Deserialize<TestSettings>(configFile, jsonSerializeOptions);

            return testSettings;
        }

    }
}
