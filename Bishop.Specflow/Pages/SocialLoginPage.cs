using OpenQA.Selenium;
//using OpenQA.Selenium.DevTools.V110.Page;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ySpecFlow.Pages.PageInterfaces;
using yTestFramework.Driver;
using ICredentials = ySpecFlow.Models.ICredentials;

namespace ySpecFlow.Pages
{
    internal class SocialLoginPage : ISocialLoginPage
    {

        public SocialLoginPage(IDriverFixture driverFixture)
        {
            Driver = driverFixture.Driver;
            BaseUrl = driverFixture.BaseUrl;
            Uri = new Uri(BaseUrl, new Uri(Path, UriKind.Relative));
        }

        public Uri BaseUrl { get; }

        public Uri Uri { get; }

        public string Path => "Login.aspx";

        public IWebDriver Driver { get; }

        public IWebElement UsernameInput => Driver.FindElement(By.Id("ctl00_contentplaceholderContenido_textboxUser"));

        public IWebElement PasswordInput => Driver.FindElement(By.Id("ctl00_contentplaceholderContenido_textboxPassword"));

        public IWebElement BtnSubmitLogin => Driver.FindElement(By.Id("sumbitLogin"));


        public IWebElement Flag { get => BtnSubmitLogin; }


    }

}
