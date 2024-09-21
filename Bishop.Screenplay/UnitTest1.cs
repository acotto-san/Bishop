using Bishop.Screenplay.Pages;
using Bishop.Screenplay.Questions;
using Bishop.Screenplay.Tasks;
using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using Boa.Constrictor.Xunit;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using Xunit.Abstractions;
using static Boa.Constrictor.Selenium.WebLocator;

namespace Bishop.Screenplay
{
    public class UnitTest1
    {
        private IActor Actor;
        private ILogger logger;

        public UnitTest1(ITestOutputHelper output)
        {
            ChromeOptions options = new ChromeOptions();
            //options.AddArgument("headless");                  // Remove this line to "see" the browser run
            options.AddArgument("window-size=1920,1080");     // Use this option with headless mode
            ChromeDriver driver = new ChromeDriver(options);
            logger = new TestOutputLogger(output);

            Actor = new Actor(name: "Andy", logger: logger);
            Actor.Can(BrowseTheWeb.With(driver));
        }

        [Fact]
        public void Test1()
        {
            string title = "Chat";
            IWebLocator loc()  => L("A card that represents a development cardboard",
            By.XPath($"//app-dashboard-flow[p[text()='{title}']]"));
            Actor.AttemptsTo(LogIntoYFlow.WithBrowser());
            Actor.AttemptsTo(Click.On(loc()));
            //Actor.AttemptsTo(ClickOnFlowCard.WithText("Chat"));
            //Actor.AttemptsTo(Click.On(FlowInDevelopmentCard.Title)); 

        }
    }
}