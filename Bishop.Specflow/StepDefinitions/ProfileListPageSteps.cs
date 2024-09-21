using TechTalk.SpecFlow.Assist;

namespace ySpecFlow.StepDefinitions
{
    [Binding]
    public class ProfileListPageSteps
    {
        private readonly ScenarioContext scenarioContext;
        private readonly IVipProfileListPage vipProfileListPage;
        private readonly IBlockedProfileListPage blockedProfileListPage;
        private readonly ISocialLoginPage socialLoginPage;

        public ProfileListPageSteps(ScenarioContext scenarioContext,
                                    IVipProfileListPage vipProfileListPage,
                                    IBlockedProfileListPage blockedProfileListPage,
                                    ISocialLoginPage socialLoginPage)
        {
            this.scenarioContext = scenarioContext;
            this.vipProfileListPage = vipProfileListPage;
            this.blockedProfileListPage = blockedProfileListPage;
            this.socialLoginPage = socialLoginPage;
        }

        [Given(@"que soy un supervisor visualizando la lista de perfiles (.*)")]
        public void GivenQueSoyUnSupervisorVisualizandoLaListaDePerfilesListaDePerfilesNoContactar(string profileListName)
        {
            //supervisor intenta logueo
            try
            {
                socialLoginPage.PerformLogin();
            }
            catch
            {
                throw new PendingStepException();
            }

            //se identifica cual lista sera la trabajada
            var profileList = (IProfileListPage)(profileListName switch
            {
                "Lista de Perfiles VIP" => vipProfileListPage,
                "Lista de Perfiles Bloqueados" => blockedProfileListPage,
                _ => throw new Exception("Invalid profile list name."),
            });


            //guarda en el context scenario la pagina a trabajar
            if (profileList != null)
            {
                profileList.Navigate();
                scenarioContext.Set(profileList);
            }


        }

        [Given(@"que el siguiente perfil de usuario se encuentra en la lista")]
        public void GivenQueElSiguientePerfilDeUsuarioSeEncuentraEnLaLista(Table table)
        {
            ISocialUserProfile socialUserProfile = table.CreateInstance<SocialUserProfile>();
            scenarioContext.Set(socialUserProfile);

        }

        [When(@"intento eliminar el perfil de la lista")]
        public void WhenIntentoEliminarElPerfilDeLaLista()
        {
            IProfileListPage profileList = scenarioContext.Get<IProfileListPage>();
            ISocialUserProfile socialUserProfile = scenarioContext.Get<ISocialUserProfile>();
            profileList.DeleteElementOnListByName(socialUserProfile);
        }

        [When(@"intento eliminar un perfil de la lista")]
        public void WhenIntentoEliminarUnPerfilDeLaLista()
        {
            IProfileListPage profileList = scenarioContext.Get<IProfileListPage>();
            profileList.DeleteFirstElementOnList();
        }


        [Then(@"el perfil no se va a encontrar mas en la misma")]
        public void ThenElPerfilNoSeVaAEncontrarMasEnLaMisma()
        {
            Console.WriteLine("asd");
        }

    }
}
