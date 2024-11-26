using Microsoft.Playwright.NUnit;
using Microsoft.Playwright;
using static System.Net.Mime.MediaTypeNames;
using Bishop.Playwright.Actions;
using Bishop.Playwright.PageObjects.Supervisor;

namespace Bishop.Playwright.UnitTests
{
    [Parallelizable(ParallelScope.Self)]
    [TestFixture]
    public class CreateAgent : PageTest
    {
        private IBrowser _browser;
        private IPage _page;
        private IPage _page2;
        private IPlaywright _playwright;

        [SetUp]
        public async Task Setup()
        {
            // Inicializar Playwright y lanzar el navegador
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();
            _browser = await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions { Headless = false });
            _page = await _browser.NewPageAsync();

        }
        [Test]
        public async Task CreateAgentTest()
        {
            SupervisorActions supervisor = new SupervisorActions(_page);
            await supervisor.LogInWithCredentials("qadmin","asdQWE!23!\"#");
            AutomatedAgent agent = new AutomatedAgent
            {
                Name = "QA",
                LastName = "Tester",
            };
            List<AutomatedAgent> automatedAgents = GetAgents(2);
            foreach (AutomatedAgent autAgent in automatedAgents)
            {
                await supervisor.CreateAgent(autAgent);
                await supervisor.AsignQueueToAgent(autAgent);
            }


        }

        [Test]
        public async Task POMTest()
        {
            SupervisorLoginPage loginPage = new SupervisorLoginPage(_page);
            await loginPage.LogInWithCredentials("qadmin", "asdQWE!23!\"#");
        }

        public AutomatedAgent GenerateAutomatedAgent(string lastNameEnding)
        {
            return new AutomatedAgent { Name = "Pepe", LastName = $"automated{lastNameEnding}" };
        }

        public List<AutomatedAgent> GetAgents(int quantity)
        {
            List<AutomatedAgent> list = new List<AutomatedAgent>();
            for (int i = 0; i < quantity; i++)
            {
                list.Add(GenerateAutomatedAgent(i.ToString()));
            }
            return list;
        }
    }
}


public class AutomatedAgent
{
    public string Name { get; set; }
    public string LastName { get; set; }
    public string UserName { get { return Name + LastName; } }

    public string ToString()
    {
        return $"{Name} {LastName}";
    }
}

