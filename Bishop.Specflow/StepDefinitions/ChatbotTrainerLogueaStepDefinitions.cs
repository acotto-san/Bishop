using Bishop.Screenplay.Pages;
using Bishop.Screenplay.Tasks;
using Boa.Constrictor.Screenplay;
using Boa.Constrictor.Selenium;
using OpenQA.Selenium.Chrome;

namespace Bishop.Specflow.StepDefinitions
{
    [Binding]
    public class ChatbotTrainerLogueaStepDefinitions
    {
        //este steps def implementa boa constrictor
        IActor Actor;
        [Given(@"que Charly es un chatbot trainer con cuenta activa")]
        public void GivenQueCharlyEsUnChatbotTrainerConCuentaActiva()
        {
            ChromeOptions options = new ChromeOptions();
            //options.AddArgument("headless");                  // Remove this line to "see" the browser run
            options.AddArgument("window-size=1920,1080");     // Use this option with headless mode
            ChromeDriver driver = new ChromeDriver(options);

            Actor = new Actor(name: "Andy", logger: new ConsoleLogger());
            Actor.Can(BrowseTheWeb.With(driver));
        }

        [When(@"intenta loguear con credenciales válidas")]
        public void WhenIntentaLoguearConCredencialesValidas()
        {
            Actor.AttemptsTo(LogIntoYFlow.WithBrowser());
        }

        [Then(@"ingresara al dashboard de yFlow")]
        public void ThenIngresaraAlDashboardDeYFlow()
        {
            Actor.AskingFor(Existence.Of(YFlowDashboard.DashboardComponent));

        }
    }
}
