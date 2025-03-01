﻿using Bishop.Common;
using Bishop.Common.Actions;
using Bishop.Common.DAL;
using Bishop.Playwright.Actions;
using Microsoft.Playwright;
using Microsoft.Playwright.NUnit;
using System.Diagnostics;
using Yoizen.Social.DomainModel;

namespace Bishop.Playwright.UnitTests
{
    public class AgentLogInTests : PageTest
    {
        private IPlaywright _playwright;
        private IBrowser _browser;
        private IPage _page;
        public Agent _agent = new Agent
        {
            ID = 123,
            UserName = "agyoizen",
            Password = "Yoizen2020!"
        };

        [SetUp]
        public async Task Setup()
        {
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();
            _browser = await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions { Headless = false });
        }


        // Prueba parametrizada para loguear a varios agentes
        [Test]
        [TestCaseSource(nameof(GetAgents))]
        public async Task LogInMultipleAgentsParametrized(Agent agent)
        {
            _page = await _browser.NewPageAsync();
            await LogIn.AsAgent(_page, agent);
            Trace.WriteLine($"Agente {agent.UserName} logueado con éxito");
            await _page.CloseAsync();  // Cierra la página al terminar la prueba para liberar recursos
        }

        // Método que devuelve la lista de agentes para parametrizar la prueba
        public static IEnumerable<Agent> GetAgents()
        {
            return new List<Agent>
            {
                new Agent { ID = 438, UserName = "qagent", Password = "asdQWE!23" },
                new Agent { ID = 439, UserName = "qagent2", Password = "asdQWE!24" },
                new Agent { ID = 440, UserName = "qagent3", Password = "asdQWE!25" }
                // Más agentes
            };
        }

        [TearDown]
        public async Task TearDown()
        {

            await LogOut.AgentByEndpoint(_agent.ID);
            await _browser.CloseAsync();
            _playwright.Dispose();
        }
    }
}
