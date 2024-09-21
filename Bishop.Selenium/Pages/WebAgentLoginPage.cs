using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Selenium.Pages
{
    public class WebAgentLoginPage : BasePage
    {
        public WebAgentLoginPage() : base(Driver)
        {
        }

        public void NavigateToWebAgentLogin()
        {
            NavigateTo("https://qa.ysocial.net/test/agent");
        }
    }
}
