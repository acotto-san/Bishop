using OpenQA.Selenium;
using ySpecFlow.BaseInterfaces;
using ySpecFlow.Models;

namespace ySpecFlow.Pages.PageInterfaces
{
    public interface ISocialLoginPage : ILoginPage
    {
        new void PerformLogin()
        {
            PerformLogin(new Credentials
            {
                Username = "QAdmin",
                Password = "asdQWE!23"
            });
        }
    }
}