using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using yTestFramework.Driver;

namespace ySpecFlow.Pages
{
    public class FacebookLoginPage : IFacebookLoginPage
    {
        public FacebookLoginPage(IDriverFixture driverFixture)
        {
            Driver = driverFixture.Driver;
            Uri = new Uri(BaseUrl, new Uri(Path, UriKind.Relative));
        }

        public IWebElement UsernameInput => Driver.FindElement(By.Id("email"));

        public IWebElement PasswordInput => Driver.FindElement(By.Id("pass"));

        public IWebElement BtnSubmitLogin => Driver.FindElement(By.Id("loginbutton"));

        public IWebDriver Driver { get; }

        public Uri BaseUrl => new Uri("https://www.facebook.com/"); 

        public Uri Uri { get; }

        public string Path => "login";

        public IWebElement Flag => BtnSubmitLogin;
    }
}
