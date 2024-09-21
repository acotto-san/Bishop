using OpenQA.Selenium;
using ySpecFlow.BaseInterfaces;
using ySpecFlow.Models;

namespace ySpecFlow.Pages.PageInterfaces
{
    public interface IAgentLoginPage : ILoginPage
    {
        new void PerformLogin()
        {
            PerformLogin(new Credentials
            {
                Username = "pyacoli",
                Password = "asdQWE!23"
            });
        }
        IPerson Agent { get; set; }
    }
}