using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Bishop.Playwright.Helpers.RTAgentsPageMock;

namespace Bishop.Playwright.PageObjects.Supervisor.Configurations
{
    public class AgentDataTab : BasePage
    {
        public AgentDataTab(IPage page) : base(page)
        {
        }

        async public Task FillForm(AutomatedAgent agent)
        {
            await _page.Locator("#ctl00_contentplaceholderContenido_textboxFirstName").ClickAsync();
            await _page.Locator("#ctl00_contentplaceholderContenido_textboxFirstName").FillAsync(agent.Name);
            await _page.Locator("#ctl00_contentplaceholderContenido_textboxLastName").ClickAsync();
            await _page.Locator("#ctl00_contentplaceholderContenido_textboxLastName").FillAsync(agent.LastName);
            await _page.Locator("#ctl00_contentplaceholderContenido_textboxLastName").PressAsync("Tab");
            await _page.Locator("#ctl00_contentplaceholderContenido_textboxUsername").ClickAsync();
            await _page.Locator("#ctl00_contentplaceholderContenido_textboxUsername").FillAsync(agent.UserName);
            await _page.Locator("#textboxEmail").ClickAsync();
            await _page.Locator("#textboxEmail").FillAsync($"sacostaottonelli+{agent.UserName}@yoizen.com");
            await _page.Locator("#textboxPassword").ClickAsync();
            await _page.Locator("#textboxPassword").FillAsync("pruebaPass123!23");
            await _page.Locator("#textboxPasswordConf").ClickAsync();
            await _page.Locator("#textboxPasswordConf").FillAsync("pruebaPass123!23");
        }
    }
}
