using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
using static Boa.Constrictor.Selenium.WebLocator;

namespace Bishop.Screenplay.Pages
{
    public class YFlowLogin : ILoginPage
    {

        public static string Url = "https://yflow-yoizen-qa.ysocial.net/";

        public static IWebLocator UsernameInput => L(
            "Input element for the username of the yFlow user",
            By.Name("username"));

        public static IWebLocator PasswordInput => L(
            "Input element for the password of the yFlow user",
            By.Name("password"));

        public static IWebLocator LoginSubmit => L(
            "Submit for the login form of yFlow",
            By.XPath("//form/button"));
    }
}
