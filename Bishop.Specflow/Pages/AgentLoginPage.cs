using OpenQA.Selenium;
using ySpecFlow.Models;
using ySpecFlow.Pages.PageInterfaces;
using yTestFramework.Driver;
using yTestFramework.Settings;
using ICredentials = ySpecFlow.Models.ICredentials;

namespace ySpecFlow.Pages
{
    public class AgentLoginPage : IAgentLoginPage
    {

        public AgentLoginPage(IDriverFixture driverFixture)
        {
            Driver = driverFixture.Driver;
            BaseUrl = driverFixture.BaseUrl;
            Uri = new Uri(BaseUrl, new Uri(Path, UriKind.Relative));
        }

        public IWebDriver Driver { get; }

        public Uri BaseUrl { get; }

        public Uri Uri { get; }

        public string Path { get => "agent/#/login"; }
        public IWebElement UsernameInput => Driver.FindElement(By.XPath("//*[@name='username']"));
        public IWebElement PasswordInput => Driver.FindElement(By.XPath("//*[@name='password']"));
        public IWebElement BtnSubmitLogin => Driver.FindElement(
            By.XPath("//*[@name='login.form']/descendant::button"));

        public IPerson? Agent { get; set; }


        public IWebElement Flag => UsernameInput;

        public void Navigate()
        {
            Driver.Navigate().GoToUrl(Uri);
        }

        public bool IsDisplayed()
        {
            return BtnSubmitLogin.Displayed;
        }


    }

}
