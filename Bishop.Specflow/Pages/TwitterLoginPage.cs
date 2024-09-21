using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using yTestFramework.Driver;

namespace ySpecFlow.Pages
{
    public class TwitterLoginPage : ITwitterLoginPage
    {
        public TwitterLoginPage(IDriverFixture driverFixture)
        {
            Driver = driverFixture.Driver;
            Uri = new Uri(BaseUrl, new Uri(Path, UriKind.Relative));
        }
        public IWebElement UsernameInput => Driver.FindElement(By.Name("text"));

        public IWebElement PasswordInput => Driver.FindElement(By.Name("password"));

        public IWebElement BtnSubmitLogin => Driver.FindElement(By.XPath("//*[contains(text(),'Iniciar sesión')]"));

        public IWebElement BtnNextToLogin => Driver.FindElement(By.XPath("//*[contains(text(),'Siguiente')]"));

        public IWebDriver Driver { get; }

        public Uri BaseUrl => new Uri("https://twitter.com/");

        public Uri Uri { get; }

        public string Path => "i/flow/login";

        public IWebElement Flag => BtnSubmitLogin;


    }
}
