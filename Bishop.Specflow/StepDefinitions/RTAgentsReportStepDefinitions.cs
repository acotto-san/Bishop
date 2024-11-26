using Bishop.Common;
using Bishop.Common.Actions;
using Bishop.Common.DAL;
using Bishop.Playwright.Actions;
using Microsoft.Playwright;
using System;
using TechTalk.SpecFlow;
using Yoizen.Social.DomainModel;

namespace Bishop.Specflow.StepDefinitions
{
    [Binding]
    public class RTAgentsReportStepDefinitions
    {
        private IPlaywright _playwright;
        private IBrowser _browser;
        private IPage _page;

        // Lista de agentes para el test
        public List<Agent> _agents;
        private readonly ScenarioContext _scenarioContext;

        public RTAgentsReportStepDefinitions(ScenarioContext scenarioContext)
        {
            _scenarioContext = scenarioContext;
        }

        [Before]
        public async Task SetUp()
        {
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();
            _browser = await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions { Headless = false });
            string csvPath = TestConfiguration.AgentsCsv;
            _agents = YoizenAgentDAO.GetAListOfAgentsAndCredentialsFromCsv(csvPath).Take(5).ToList() ;
            _agents.Add(new Agent
            {
                ID=317,
                UserName="qagent",
                Password="asdQWE!23QWE"
            });

            _scenarioContext["Agents"] = _agents;
        }


        [Given(@"que hay agentes conectados en ySocial")]
        public async Task GivenQueHayAgentesConectadosEnYSocial()
        {
            _scenarioContext.TryGetValue("Agents", out List<Agent> agents);
            await MultipleLogin.OfAgents(_browser, agents);
            Thread.Sleep(TimeSpan.FromMinutes(5));
        }

        [When(@"un supervisor ingrese al reporte Tiempo Real de Agentes")]
        public void WhenUnSupervisorIngreseAlReporteTiempoRealDeAgentes()
        {
            throw new PendingStepException();
        }

        [Then(@"encontrará a esos agentes en la tabla del reporte")]
        public void ThenEncontraraAEsosAgentesEnLaTablaDelReporte()
        {
            throw new PendingStepException();
        }

        [AfterScenario]
        public async Task AfterScenario()
        {
            if (_scenarioContext.TryGetValue("Agents", out List<Agent> agents))
            {
                foreach (var agent in agents)
                {
                    await LogOut.AgentByEndpoint(agent);
                }
            }
            else
            {
                // Manejar el caso donde "Agents" no está presente en el ScenarioContext
            }
        }
    }
}
