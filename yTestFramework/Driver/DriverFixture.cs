using OpenQA.Selenium.Chrome;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebDriverManager.DriverConfigs.Impl;
using WebDriverManager;
using OpenQA.Selenium;
using yTestFramework.Settings;

namespace yTestFramework.Driver
{


    public class DriverFixture : IDriverFixture, IDisposable
    {

        IWebDriver driver;
        private readonly TestSettings testSettings;
        private readonly IBrowserDriver browserDriver;

        public Uri BaseUrl => testSettings.ApplicationUrl;

        public DriverFixture(TestSettings testSettings, IBrowserDriver browserDriver)
        {
            this.testSettings = testSettings;
            this.browserDriver = browserDriver;
            driver = GetWebDriver();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(testSettings.TimeoutInterval);

        }

        public IWebDriver Driver => driver;


        private IWebDriver GetWebDriver()
        {

            return testSettings.BrowserType switch
            {
                BrowserType.Chrome => browserDriver.GetChromeDriver(),
                BrowserType.Firefox => browserDriver.GetFirefoxDriver(),
                _ => browserDriver.GetChromeDriver()
            };
        }

        public void Dispose()
        {
            driver.Quit();
        }
    }
}
