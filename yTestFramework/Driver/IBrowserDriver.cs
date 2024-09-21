using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace yTestFramework.Driver
{
    public interface IBrowserDriver
    {
        IWebDriver GetChromeDriver();

        IWebDriver GetFirefoxDriver();
    }
}
