using System.Text.Json;
using Bishop.Playwright.Actions;
using Microsoft.Playwright;
using Microsoft.Playwright.NUnit;
using Bishop.Common.Stubs;
using Bishop.Common.DAL;
using Yoizen.Social.DomainModel;

namespace Bishop.Playwright.UnitTests
{
    [Parallelizable(ParallelScope.Self)]
    [TestFixture]
    public class InterceptTest : PageTest
    {
        private IBrowser _browser;
        private IPage _page;
        private IPlaywright _playwright;
        private SupervisorActions _supervisorActions;

        [SetUp]
        public async Task Setup()
        {
            // Inicializar Playwright y lanzar el navegador
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();
            _browser = await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions { Headless = false });
            _page = await _browser.NewPageAsync();
            _supervisorActions = new SupervisorActions(_page);
        }

        [TearDown]
        public async Task Teardown()
        {
            Thread.Sleep(TimeSpan.FromSeconds(500));

            //Cerrar el navegador después de la prueba
            await _browser.CloseAsync();
            _playwright?.Dispose();
        }


        [Test]
        public async Task RTAgentsTest()
        {
            SupervisorActions supervisorActions = new SupervisorActions(_page);
            User supervisor = YoizenUserDAO.GetQadmin();
            await supervisorActions.LogInWithCredentials(supervisor.UserName,supervisor.Password);
            // Interceptar la solicitud a un endpoint específico y modificar el cuerpo de la respuesta
            await _page.RouteAsync("**/RTAgents.aspx/RetrieveData", async route =>
            {

                //// Obtener el cuerpo de la solicitud enviada por el browser
                var postData = route.Request.PostData;

                //// Deserializar el JSON del cuerpo de la solicitud
                var document = JsonDocument.Parse(postData);
                var root = document.RootElement;

                //// Extraer el valor de "pageNumber" si está presente
                var pageNumber = root.GetProperty("pageNumber").GetInt32();

                // Modificar el cuerpo de la respuesta
                var modifiedBody = JsonSerializer.Serialize(RetrieveDataStubResponse.GeneratePage(pageNumber, 3));
                // Completar la solicitud con la respuesta modificada
                await route.FulfillAsync(new RouteFulfillOptions
                {
                    Status = 200,
                    Body = modifiedBody,
                    ContentType = "application/json"
                });
            });

        }
        [Test]
        public async Task ShouldInterceptAndModifyApiResponseV2()
        {
            await _supervisorActions.LogInWithCredentials("qadmin", "asdQWE!23!\"#");
        }



    }
}
