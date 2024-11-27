using Bishop.Common.Actions;
using Bishop.Common.Stubs;
using Bishop.Playwright.Actions;
using Microsoft.Playwright;
using Yoizen.Social.DomainModel;

namespace Bishop.Playwright.UnitTests
{
    public class MandatoryTaggingWhenCloseCase
    {
        private IBrowser _browser;
        private IPage _page;
        private IPlaywright _playwright;

        public Agent agent = new Agent
        {
            ID = 123,
            UserName = "agyoizen",
            Password = "Yoizen2020!"
        };

        [SetUp]
        public async Task Setup()
        {
            // Inicializar Playwright y lanzar el navegador
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();
            _browser = await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions { Headless = false });
            _page = await _browser.NewPageAsync();
        }

        [TearDown]
        public async Task Teardown()
        {
            Thread.Sleep(TimeSpan.FromMinutes(15));
            await LogOut.AgentByEndpoint(agent.ID);
            //Cerrar el navegador después de la prueba
            await _browser.CloseAsync();
            _playwright?.Dispose();
        }

        [Test]
        public async Task StubMandatoryAgentTagOnClosingCase()
        {
            await _page.RouteAsync("**/services/configuration/systemsettings", route =>
            {
                route.FulfillAsync(new RouteFulfillOptions
                {
                    Status = 200,
                    Body = SystemSettingsStubResponse.MandatoryAgentTaggingWhenClosingCase(),
                    ContentType = "application/json"
                });
            });
            await LogIn.AsAgent(_page,agent);
        }
        [Test]
        public async Task ForcedToTagWhenFinishingAndClosingCase()
        {
            //Esquema del escenario: Agente es obligado a etiquetar al cerrar un caso asignado sin etiquetas
            //Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "si no tiene ninguna etiqueta"
            bool keepStubingNext = true, keepStubingCase = true;
            await _page.RouteAsync("**/services/configuration/systemsettings", route =>
            {
                route.FulfillAsync(new RouteFulfillOptions
                {
                    Status = 200,
                    Body = SystemSettingsStubResponse.MandatoryTaggingWhenClosingCase(),
                    ContentType = "application/json"
                });
            });

            await _page.RouteAsync("**/next?*", (route) =>
            {
                if (keepStubingNext)
                {
                    route.FulfillAsync(new RouteFulfillOptions
                    {
                        Status = 200,
                        Body = NextStubResponse.GetOneMessage(),
                        ContentType = "application/json"
                    });
                    keepStubingNext = !keepStubingNext;
                }
                else
                {
                    route.ContinueAsync();
                }

            });

            await _page.RouteAsync("**/case?*", route =>
            {
                route.FulfillAsync(new RouteFulfillOptions
                {
                    Status = 200,
                    Body = CaseStubResponse.GetOneMessage(),
                    ContentType = "application/json"
                });
            });

            await _page.RouteAsync("**/markasread?id=2000010941&agentId=438", route =>
            {

                route.FulfillAsync(new RouteFulfillOptions
                {
                    Status = 200,
                    Body = MarkAsReadStubResponse.GetOne(),
                    ContentType = "application/json"
                });
            });

            await _page.RouteAsync("**/searchcases?*", route =>
            {

                route.FulfillAsync(new RouteFulfillOptions
                {
                    Status = 200,
                    Body = SearchCasesStubResponse.GetOneMessage(),
                    ContentType = "application/json"
                });
            });

            //Y a un agente le asignaron un caso sin etiquetar
            await LogIn.AsAgent(_page,agent);

            //Cuando intenta cerrar el caso mediante la opcion finalizar
            //Entonces para continuar sera obligado a aplicar una etiqueta normal
        }
    }
}
