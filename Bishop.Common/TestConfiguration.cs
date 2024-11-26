using Microsoft.Extensions.Configuration;

namespace Bishop.Common
{
    public static class TestConfiguration
    {
        public static IConfigurationRoot Configuration { get; private set; }

        static TestConfiguration()
        {
            Configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("./appsettings.json")
                .Build();
        }

        public static string SocialBaseUrl => Configuration["ApiSettings:SocialBaseUrl"];
        public static string YflowBaseUrl => Configuration["ApiSettings:YflowBaseUrl"];
        public static string AgentsCsv { get
            {
                string path = Configuration["AgentsCsv"];
                if (path != null)
                {
                    return path;
                }
                else
                {
                    throw new Exception();
                }
            } }
    }
    public class TestConfigurationsTests
    {
        [Test]
        public void TestConfigurationShouldGiveTheBaseUrlOfProducts()
        {
            Assert.IsNotNull(TestConfiguration.SocialBaseUrl);
            Assert.IsNotNull(TestConfiguration.YflowBaseUrl);
        }
    }
}
