using Boa.Constrictor.Selenium;
using OpenQA.Selenium;

namespace Bishop.Screenplay.Pages
{
    public interface ILoginPage
    {
        public static string Url;

        public static IWebLocator UsernameInput;

        public static IWebLocator PasswordInput;

        public static IWebLocator LoginSubmit;
    }
}