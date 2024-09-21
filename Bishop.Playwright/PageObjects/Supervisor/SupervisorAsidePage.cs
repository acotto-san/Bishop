using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace Bishop.Playwright.PageObjects.Supervisor
{
    public class SupervisorAsidePage
    {

        private readonly IPage _page;

        public SupervisorAsidePage(IPage page)
        {
            _page = page;
        }

        ILocator _configurationIcon => _page.Locator("#navConfiguration span");
        ILocator _configurationLink => _page.GetByText("Configuración", new() { Exact = true });
        ILocator _agentsLink => _page.GetByRole(AriaRole.Link, new() { Name = "Agentes", Exact = true });

        async public Task OpenConfigurationMenu()
        {
            await _configurationIcon.First.ClickAsync();
            await _configurationLink.ClickAsync();
        }

        async public Task NavigateToAgentsPage()
        {
            await OpenConfigurationMenu();
            await _agentsLink.ClickAsync();
        }
    }
}
