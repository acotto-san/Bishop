using Bishop.Playwright.PageObjects.WebAgent;
using Microsoft.Playwright;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Yoizen.Social.DomainModel;
using Bishop.Playwright.PageObjects.Supervisor;
using Bishop.Common.Actions;

namespace Bishop.Playwright.Actions
{
    public static class LogIn
    {
        public static async Task AsAgent(IPage page, Agent agent )
        {
            WebAgentLogin agentLogin = new WebAgentLogin(page);
            await agentLogin.LogInWithCredentials(agent.UserName, agent.Password);
        }

        public static async Task AsSupervisor(IPage page, User supervisor)
        {
            SupervisorLoginPage supervisorLogin = new SupervisorLoginPage(page);
            await supervisorLogin.LogInWithCredentials(supervisor.UserName, supervisor.Password);
        }
    }
}
