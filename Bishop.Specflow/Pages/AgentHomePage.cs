using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ySpecFlow.Pages.PageInterfaces;
using yTestFramework.Driver;

namespace ySpecFlow.Pages
{
    public class AgentHomePage : IAgentHomePage
    {

        private readonly IWebDriver driver;

        public AgentHomePage(IDriverFixture driverFixture) => driver = driverFixture.Driver;



    }
}
