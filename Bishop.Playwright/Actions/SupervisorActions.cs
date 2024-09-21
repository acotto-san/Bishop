using Bishop.Playwright.PageObjects.Supervisor;
using Bishop.Playwright.PageObjects.Supervisor.Configurations;
using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Playwright.Actions
{
    public class SupervisorActions
    {

        private IPage _page;
        public SupervisorActions(IPage page)
        {
            _page = page;
        }
        async public Task LogInWithCredentials(string username, string password)
        {
            SupervisorLoginPage supervisorLoginPage = new SupervisorLoginPage(_page);
            await supervisorLoginPage.LogInWithCredentials(username, password);   
        }
        async public Task CreateAgent(AutomatedAgent agent)
        {
            SupervisorAsidePage supervisorAside = new SupervisorAsidePage(_page);
            await supervisorAside.NavigateToAgentsPage();
            AgentsListPage agentsListPage = new AgentsListPage(_page);
            await agentsListPage.NavigateToAgentCreation();

            AgentDataTab agentData = new AgentDataTab(_page);
            await agentData.FillForm(agent);

            MessagesByServiceTab messageByService = new MessagesByServiceTab(_page);
            await messageByService.NavigateTo();
            await messageByService.FillForm();
            
            IncomingMessagesTab incomingMessagesTab = new IncomingMessagesTab(_page);
            await incomingMessagesTab.NavigateTo();
            await incomingMessagesTab.FillForm();

            OtherPermissionsTab otherPermissionsTab = new OtherPermissionsTab(_page);
            await otherPermissionsTab.NavigateTo();
            await otherPermissionsTab.FillForm();

            await _page.GetByRole(AriaRole.Button, new() { Name = "Aceptar" }).ClickAsync();
        }
        async public Task OpenQueueAssigments(AutomatedAgent agent)
        {
            await _page.Locator("#navConfiguration span").First.ClickAsync();
            await _page.GetByText("Configuración", new() { Exact = true }).ClickAsync();
            await _page.GetByRole(AriaRole.Link, new() { Name = "Asignación por colas" }).ClickAsync();
            int count = await _page.Locator($"xpath=//tr[./td[contains(text(),'{agent.Name} {agent.LastName}')]]//a[@rel='edit']").CountAsync();
            await _page.Locator($"xpath=//tr[./td[contains(text(),'{agent.Name} {agent.LastName}')]]//a[@rel='edit']").ClickAsync();
        }
        async public Task CleanCurrentQueueAssignments()
        {
            var removeIcons = _page.Locator("xpath=//tr//a[@rel='remove']");
            var count = await removeIcons.CountAsync();
            for (int i = count - 1; i >= 0; --i)
                await removeIcons.Nth(i).ClickAsync();
        }
        async public Task FullFillQueue()
        {
            await Task.Delay(1000);
            await _page.Locator("#divTableQueueLevelsContainer a").ClickAsync();
            await _page.GetByRole(AriaRole.Button, new() { Name = "_Cola A" }).ClickAsync();
            await _page.GetByText("Cola irao").Nth(3).ClickAsync();
            await _page.GetByRole(AriaRole.Spinbutton).FillAsync("1");
        }
        async public Task AsignQueueToAgent(AutomatedAgent agent)
        {
            await OpenQueueAssigments(agent);
            await CleanCurrentQueueAssignments();
            await FullFillQueue();
            await _page.GetByLabel("Aceptar", new() { Exact = true }).ClickAsync();
            await _page.Locator("#cboxLoadedContent").GetByLabel("Aceptar").ClickAsync();
        }
    }
}
