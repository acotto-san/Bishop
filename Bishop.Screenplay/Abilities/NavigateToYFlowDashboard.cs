using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Screenplay.Abilities
{
    internal class NavigateToYFlowDashboard
    {
        public static NavigateToYFlowDashboard WithCredentials(string username, string password)
        {
            return new NavigateToYFlowDashboard(username, password);
        }

        private NavigateToYFlowDashboard(string username, string password)
        {
            Username = username;
            Password = password;
        }

        public string Username { get; }
        public string Password { get; }

        public void Navigate(IActor actor)
        {
            var driver = actor.Using<BrowseTheWeb>().WebDriver;
            driver.Navigate().GoToUrl("https://your-dashboard-url.com");
            // Add login steps here
            driver.FindElement(By.Id("username")).SendKeys(Username);
            driver.FindElement(By.Id("password")).SendKeys(Password);
            driver.FindElement(By.Id("login-button")).Click();
        }
    }
}
