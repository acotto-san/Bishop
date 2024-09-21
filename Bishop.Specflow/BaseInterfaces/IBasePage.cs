using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using yTestFramework.Settings;

namespace ySpecFlow.BaseInterfaces
{
    public interface IBasePage
    {

        IWebDriver Driver { get; }
        Uri BaseUrl { get; }
        Uri Uri { get; }
        string Path { get; }

        public IWebElement Flag { get; }
        bool IsDisplayed()
        {
            return Flag.Displayed;
        }

        void Navigate()
        {
            Driver.Navigate().GoToUrl(Uri);
        }
    }
}
