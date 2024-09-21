using Boa.Constrictor.Selenium;
using OpenQA.Selenium;
using static Boa.Constrictor.Selenium.WebLocator;
namespace Bishop.Screenplay.Pages
{
    public class FlowInDevelopmentCard
    {
        public static IWebLocator WholeCardByItsTitle(string title)
        {
            return L(
            "A card that represents a development cardboard",
            By.XPath($"//app-dashboard-flow[p[text()='{title}']]"));

            
        }
        public static IWebLocator Title => L(
            "A card that represents a development cardboard",
            By.XPath("//app-dashboard-flow//p"));
    }
}