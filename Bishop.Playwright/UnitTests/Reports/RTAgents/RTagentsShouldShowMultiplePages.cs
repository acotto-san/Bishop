using Bishop.Common;
using Bishop.Common.Actions;
using Bishop.Common.DAL;
using Bishop.Playwright.Actions;
using Bishop.Playwright.Mocks;
using Bishop.Playwright.PageObjects.Supervisor.Reports;
using Microsoft.Playwright;
using Yoizen.Social.DomainModel;

namespace Bishop.Playwright.UnitTests.Reports.RTAgents
{
    public class RTagentsShouldShowMultiplePages
    {

        private IPlaywright _playwright;
        private IBrowser _browser;
        private IPage _page;
        private List<Agent> agents;
        [SetUp]
        public async Task Setup()
        {
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();
            _browser = await _playwright.Chromium.LaunchAsync(
                                        new BrowserTypeLaunchOptions 
                                            {
                                            Headless = false
                                            });

            _page = await _browser.NewPageAsync();
            await MockRTAgentsResponse.LowQuantityRowsPerPage(_page);
            agents = YoizenAgentDAO.GetAListOfAgentsAndCredentialsFromCsv(TestConfiguration.AgentsCsv);
            agents = agents.Take(15).ToList();
        }

        [Test]
        public async Task SupervisorShouldSeeMultiplePagesInRTAgents()
        {
            await LogOut.MultipleAgentsByEndpoint(agents);
            //Dado que un agente esta logueado en RTAgents
            await LogIn.AsSupervisor(_page, YoizenUserDAO.GetQadmin());
            RTAgentsPage rTAgentsPage = new RTAgentsPage(_page);
            await rTAgentsPage.Navigate();


            //Cuando se loguean suficientes agentes como para paginar el reporte
            await MultipleLogin.OfAgents(_browser, agents);

            Thread.Sleep(TimeSpan.FromMinutes(30));

            //Entonces el reporte tendrá un paginado
        }
        [TearDown]
        public async Task TearDown()
        {
            await LogOut.MultipleAgentsByEndpoint(agents);
        }


    }
}
