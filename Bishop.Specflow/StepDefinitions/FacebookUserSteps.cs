using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.StepDefinitions
{
    [Binding]
    public class FacebookUserSteps
    {
        private readonly ScenarioContext scenarioContext;
        private readonly IFacebookLoginPage facebookLoginPage;
        private readonly ITwitterLoginPage twitterLoginPage;
        public FacebookUserSteps(ScenarioContext scenarioContext,
                                    IFacebookLoginPage facebookLoginPage)
        {
            this.scenarioContext = scenarioContext;
            this.facebookLoginPage = facebookLoginPage;
        }

        [Given(@"que un usuario de facebook ingresa a la pagina de la empresa")]
        public void GivenQueUnUsuarioDeFacebookIngresaALaPaginaDeLaEmpresa()
        {
            facebookLoginPage.PerformLogin();
        }

        [When(@"le envia un mensaje a dicha cuenta")]
        public void WhenLeEnviaUnMensajeADichaCuenta()
        {
        }

    }
}
