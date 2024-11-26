using Bishop.Common.Actions;
using Bishop.Common.Stubs;
using Bishop.Playwright.Actions;
using Microsoft.Playwright;
using System;
using TechTalk.SpecFlow;
using Yoizen.Social.DomainModel;

namespace Bishop.Specflow.StepDefinitions
{
    [Binding]
    public class MandatoryAgentTagginWhenCloseCaseSteps
    {
        private IBrowser _browser;
        private IPage _page;
        private IPlaywright _playwright;

        public Agent agent = new Agent
        {
            ID = 123,
            UserName = "agyoizen",
            Password = "Yoizen2020!"
        };

        [BeforeScenario]
        public async Task Setup()
        {
            // Inicializar Playwright y lanzar el navegador
            _playwright = await Microsoft.Playwright.Playwright.CreateAsync();
            _browser = await _playwright.Chromium.LaunchAsync(new BrowserTypeLaunchOptions { Headless = false });
            _page = await _browser.NewPageAsync();
        }

        [AfterScenario]
        public async Task Teardown()
        {
            // Esperar antes de cerrar el navegador
            Thread.Sleep(TimeSpan.FromSeconds(320));
            await LogOut.AgentByEndpoint(agent.ID);
            await _browser.CloseAsync();
            _playwright?.Dispose();
        }
        [Given(@"que la funcionalidad de etiquetado obligatorio al cerrar casos sin etiquetas de agentes está deshabilitada")]
        public void GivenQueLaFuncionalidadDeEtiquetadoObligatorioAlCerrarCasosSinEtiquetasDeAgentesEstaDeshabilitada()
        {
            throw new PendingStepException();
        }

        [When(@"un supervisor accede a los parámetros de sistema")]
        public void WhenUnSupervisorAccedeALosParametrosDeSistema()
        {
            throw new PendingStepException();
        }

        [Then(@"podrá habilitar la opción para que aplique globalmente a todos los agentes")]
        public void ThenPodraHabilitarLaOpcionParaQueApliqueGlobalmenteATodosLosAgentes()
        {
            throw new PendingStepException();
        }

        [Given(@"que la funcionalidad de etiquetado obligatorio al cerrar está configurada en ""([^""]*)""")]
        public async Task GivenQueLaFuncionalidadDeEtiquetadoObligatorioAlCerrarEstaConfiguradaEn(string p0)
        {
            await _page.RouteAsync("**/services/configuration/systemsettings", route =>
            {
                route.FulfillAsync(new RouteFulfillOptions
                {
                    Status = 200,
                    Body = SystemSettingsStubResponse.MandatoryAgentTaggingWhenClosingCase(),
                    ContentType = "application/json"
                });
            });
            // Loguear al agente antes de cada escenario
            await LogIn.AsAgent(_page, agent);
        }

        [Given(@"a un agente se le asigna un caso con etiquetas, pero ninguna proporcionada por un agente")]
        public void GivenAUnAgenteSeLeAsignaUnCasoConEtiquetasPeroNingunaProporcionadaPorUnAgente()
        {
            throw new PendingStepException();
        }

        [When(@"el agente intenta cerrar el caso mediante finalizar \(modo chat\)")]
        public void WhenElAgenteIntentaCerrarElCasoMedianteFinalizarModoChat()
        {
            throw new PendingStepException();
        }

        [Then(@"deberá aplicar al menos una etiqueta normal para continuar")]
        public void ThenDeberaAplicarAlMenosUnaEtiquetaNormalParaContinuar()
        {
            throw new PendingStepException();
        }

        [When(@"el agente intenta cerrar un caso desde ""([^""]*)"" con etiquetas, pero ninguna proporcionada por un agente")]
        public void WhenElAgenteIntentaCerrarUnCasoDesdeConEtiquetasPeroNingunaProporcionadaPorUnAgente(string salientes)
        {
            throw new PendingStepException();
        }

        [Then(@"deberá aplicar al menos una etiqueta para continuar")]
        public void ThenDeberaAplicarAlMenosUnaEtiquetaParaContinuar()
        {
            throw new PendingStepException();
        }

        [When(@"un agente intenta cerrar un caso asignado que posee una etiqueta proporcionada por el agente")]
        public void WhenUnAgenteIntentaCerrarUnCasoAsignadoQuePoseeUnaEtiquetaProporcionadaPorElAgente()
        {
            throw new PendingStepException();
        }

        [Then(@"no estará obligado a etiquetar")]
        public void ThenNoEstaraObligadoAEtiquetar()
        {
        }

        [When(@"un agente intenta cerrar un caso desde ""([^""]*)"" que posee una etiqueta proporcionada por el agente")]
        public void WhenUnAgenteIntentaCerrarUnCasoDesdeQuePoseeUnaEtiquetaProporcionadaPorElAgente(string moduloAgente)
        {
           
        }

        [Given(@"a un agente se le asigna un caso con etiquetas, pero ninguna proporcionada por el agente")]
        public void GivenAUnAgenteSeLeAsignaUnCasoConEtiquetasPeroNingunaProporcionadaPorElAgente()
        {
            throw new PendingStepException();
        }

        [Given(@"la cola de donde proviene el caso no tiene etiquetas asignadas")]
        public void GivenLaColaDeDondeProvieneElCasoNoTieneEtiquetasAsignadas()
        {
            throw new PendingStepException();
        }
    }
}
