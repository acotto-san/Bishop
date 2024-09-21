using Bishop.Selenium.Pages;

namespace Bishop.Selenium
{
    public class Tests
    {
        YFlowDashboard yFlowDashboard;
        YFlowLoginPage yFlowLoginPage;

        [SetUp]
        public void Setup()
        {
            yFlowLoginPage = new YFlowLoginPage();
            yFlowLoginPage.NavigateToYFlowLogin();
            yFlowLoginPage.Login();
            yFlowDashboard = new YFlowDashboard();

        }

        [Test]
        public void OpenProyect()
        {
            yFlowDashboard.OpenProyectNamed("Generic");
        }

        [Test]
        public void PublishProyect()
        {
            YFlowCard card = YFlowCard.Named("6840");
            card.ClickInDropdownOption("descargar");
            yFlowDashboard.ConfirmModal();
        }


        [TearDown]
        public void TearDown()
        {
            BasePage.CloseBrowser();
        }
    }
}