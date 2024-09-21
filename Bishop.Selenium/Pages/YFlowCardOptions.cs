using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Selenium.Pages
{
    public class YFlowCardOptions : BasePage
    {
        private string _dropdown = "//app-dashboard-flow//div[@class=\"dropdown-menu show\"]";
        private string _optionButton = "//button[contains(@class,\"dropdown-item\")][translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') =\"{0}\"]";

        public YFlowCardOptions() : base(Driver)
        {
        }

        public void ClickInOptionNamed(string name)
        {
            IWebElement dropdownElement = Find(_dropdown);
            string xpathOption = string.Format(_optionButton, name);
            dropdownElement.FindElement(By.XPath(xpathOption)).Click();
        }

    }
}
