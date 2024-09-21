using OpenQA.Selenium;
using ICredentials = ySpecFlow.Models.ICredentials;

namespace ySpecFlow.BaseInterfaces
{
    public interface ILoginPage : IBasePage
    {
        IWebElement UsernameInput { get; }

        IWebElement PasswordInput { get; }

        IWebElement BtnSubmitLogin { get; }

        void PerformLogin(ICredentials credentials)
        {
            Navigate();
            UsernameInput.SendKeys(credentials.Username);
            PasswordInput.SendKeys(credentials.Password);
            BtnSubmitLogin.Click();
        }

        void PerformLogin() { }

    }
}