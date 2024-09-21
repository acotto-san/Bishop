using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.Pages.PageInterfaces
{
    public interface ITwitterLoginPage : ILoginPage
    {
        public IWebElement BtnNextToLogin { get;  }

        new void PerformLogin()
        {
            PerformLogin(new Credentials
            {
                Username = "qa_yzn33",
                Password = "asdQWE!23"
            });
        }

        void PerformLogin(Models.ICredentials credentials)
        {
            Navigate();
            UsernameInput.SendKeys(credentials.Username);
            BtnNextToLogin.Click();
            PasswordInput.SendKeys(credentials.Password + Keys.Enter);
        }
    }
}
