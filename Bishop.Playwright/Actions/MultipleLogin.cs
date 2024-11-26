using Bishop.Common.Actions;
using Bishop.Common.DAL;
using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Yoizen.Social.DomainModel;
using Yoizen.Social.DomainModel.Reports.RealTime;

namespace Bishop.Playwright.Actions
{
    public class MultipleLogin
    {
        async public static Task OfAgents(IBrowser browser, List<Agent> agentsList = null)
        {
            List<Agent> agentsToBeLogged = agentsList ??= YoizenAgentDAO.GetAListOfTestAgents();
            
            List<IPage> pages = new List<IPage>();
            foreach (Agent agent in agentsToBeLogged)
            {
                IPage page = await browser.NewPageAsync();
                await LogIn.AsAgent(page, agent);
                pages.Add(page);
            }
        }
    }
}
