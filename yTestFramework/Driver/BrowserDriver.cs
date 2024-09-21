using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using WebDriverManager.DriverConfigs.Impl;
using WebDriverManager;
using OpenQA.Selenium.Firefox;

namespace yTestFramework.Driver
{


    public class BrowserDriver : IBrowserDriver
    {

        public IWebDriver GetChromeDriver()
        {
            ChromeOptions options = new ChromeOptions();
            options.AddArgument("--disable-notifications");
            options.AddArgument("--suppress-message-center-popups");
            new DriverManager().SetUpDriver(new ChromeConfig());
            return new ChromeDriver(options);
        }

        public IWebDriver GetFirefoxDriver()
        {
            new DriverManager().SetUpDriver(new FirefoxConfig());
            return new FirefoxDriver();
        }
    }

    public enum BrowserType
    {
        Chrome,
        Firefox
    }
}
