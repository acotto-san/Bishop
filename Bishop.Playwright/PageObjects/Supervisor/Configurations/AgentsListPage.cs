using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.PageObjects.Supervisor.Configurations
{
    public class AgentsListPage : BasePage
    {
        public AgentsListPage(IPage page) : base(page)
        {
        }

        async public Task NavigateToAgentCreation()
        {
            await _page.GetByLabel("Nuevo", new() { Exact = true }).ClickAsync();
        }
    }
}
