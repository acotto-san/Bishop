using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace ySpecFlow.Features.ySocial.supervisor.seccion_supervisor.ajustes.carga_masiva_perfiles
{
    [Binding]
    public class cargaMasivaDePerfilesSteps
    {

        #region given

        #region usuario perfil

            [Given(@"el usuario con el id de RRSS (.*) que ya posee un perfil en ySocial")]
            public void GivenElUsuarioConElIdDeRRSSQueYaPoseeUnPerfilEnYSocial(string p0)
            {
                throw new PendingStepException();
            }
            
            [Given(@"el usuario con el id de RRSS (.*) que posee los siguientes datos en su perfil:")]
            public void GivenElUsuarioConElIdDeRRSSQuePoseeLosSiguientesDatosEnSuPerfil(string p0, Table table)
            {
                throw new PendingStepException();
            }

            [Given(@"el usuario con el id de RRSS (.*) que posee los siguientes campos extendidos en su perfil:")]
            public void GivenElUsuarioConElIdDeRRSSQuePoseeLosSiguientesCamposExtendidosEnSuPerfil(int p0, Table table)
            {
                throw new PendingStepException();
            }


        [Given(@"el usuario con el id de RRSS (.*) nunca se contacto con ySocial")]
            public void GivenElUsuarioConElIdDeRRSSNuncaSeContactoConYSocial(string p0)
            {
                throw new PendingStepException();
            }

            [Given(@"los siguientes perfiles que poseen en sus campos:")]
            public void GivenLosSiguientesPerfilesQuePoseenEnSusCampos(Table table)
            {
                throw new PendingStepException();
            }

            [Given(@"que nunca se contactaron con ySocial los siguientes usuarios:")]
            public void GivenQueNuncaSeContactaronConYSocialLosSiguientesUsuarios(Table table)
            {
                throw new PendingStepException();
            }

        #endregion


        [Given(@"un csv para carga masiva de perfiles que posee el siguiente registro:")]
            public void GivenUnCsvParaCargaMasivaDePerfilesQuePoseeElSiguienteRegistro(string multilineText)
            {
                throw new PendingStepException();
            }

            [Given(@"un csv para carga masiva de perfiles que posee los siguientes registros:")]
            public void GivenUnCsvParaCargaMasivaDePerfilesQuePoseeLosSiguientesRegistros(string multilineText)
            {
                throw new PendingStepException();
            }




        #endregion





        #region when
        [When(@"un supervisor utiliza el csv para una carga masiva de perfiles con datos de negocio")]
        public void WhenUnSupervisorUtilizaElCsvParaUnaCargaMasivaDePerfilesConDatosDeNegocio()
        {
            throw new PendingStepException();
        }

        [When(@"un supervisor utiliza el csv para una carga masiva de perfiles con campos extendidos")]
        public void WhenUnSupervisorUtilizaElCsvParaUnaCargaMasivaDePerfilesConCamposExtendidos()
        {
            throw new PendingStepException();
        }

        [When(@"un supervisor utiliza el csv para una carga masiva de perfiles")]
        public void WhenUnSupervisorUtilizaElCsvParaUnaCargaMasivaDePerfiles()
        {
            throw new PendingStepException();
        }




        #endregion





        #region then


            #region datos de negocio
            [Then(@"al ubicar en ySocial al perfil mediante su id se vera que no posee datos de negocio")]
            public void ThenAlUbicarEnYSocialAlPerfilMedianteSuIdSeVeraQueNoPoseeDatosDeNegocio()
            {
                throw new PendingStepException();
            }

            [Then(@"al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes datos de negocio:")]
            public void ThenAlUbicarEnYSocialAlPerfilMedianteSuIdSeVeraQuePoseeLosSiguientesDatosDeNegocio(Table table)
            {
                throw new PendingStepException();
            }

            [Then(@"al ubicar en ySocial al perfil mediante su id se vera que sus datos de negocio permanecen con los mismos valores")]
            public void ThenAlUbicarEnYSocialAlPerfilMedianteSuIdSeVeraQueSusDatosDeNegocioPermanecenConLosMismosValores()
            {
                throw new PendingStepException();
            }
            #endregion

            #region campos extendidos
            [Then(@"al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes campos extendidos:")]
            public void ThenAlUbicarEnYSocialAlPerfilMedianteSuIdSeVeraQuePoseeLosSiguientesCamposExtendidos(Table table)
            {
                throw new PendingStepException();
            }

            [Then(@"al ubicar en ySocial al perfil mediante su id se vera que posee los siguientes campos basicos")]
            public void ThenAlUbicarEnYSocialAlPerfilMedianteSuIdSeVeraQuePoseeLosSiguientesCamposBasicos(Table table)
            {
                throw new PendingStepException();
            }


        #endregion


        #region resultados tarea
        [Then(@"el registro en cuestion sera ignorado")]
            public void ThenElRegistroEnCuestionSeraIgnorado()
            {
                throw new PendingStepException();
            }

            #endregion

            #region perfil

            [Then(@"no se le aplicaran cambios a los datos del perfil")]
            public void ThenNoSeLeAplicaranCambiosALosDatosDelPerfil()
            {
                throw new PendingStepException();
            }


            [Then(@"no se debera ver creado un perfil al buscarlo por el id")]
            public void ThenNoSeDeberaVerCreadoUnPerfilAlBuscarloPorElId()
            {
                throw new PendingStepException();
            }

            [Then(@"los campos basicos del perfil deben continuar teniendo los mismos valores")]
            public void ThenLosCamposBasicosDelPerfilDebenContinuarTeniendoLosMismosValores()
            {
                throw new PendingStepException();
            }

            [Then(@"al ubicar en ySocial al perfil mediante su id se vera que sus campos basicos continuan teniendo los mismos valores")]
            public void ThenAlUbicarEnYSocialAlPerfilMedianteSuIdSeVeraQueSusCamposBasicosContinuanTeniendoLosMismosValores()
            {
                throw new PendingStepException();
            }

            [Then(@"al ubicar en ySocial al perfil mediante su id se vera que sus campos extendidos continuan teniendo los mismos valores")]
            public void ThenAlUbicarEnYSocialAlPerfilMedianteSuIdSeVeraQueSusCamposExtendidosContinuanTeniendoLosMismosValores()
            {
                throw new PendingStepException();
            }


        [Then(@"al ubicar en ySocial los perfiles mediante su id se encontraran con los siguientes campos basicos:")]
            public void ThenAlUbicarEnYSocialLosPerfilesMedianteSuIdSeEncontraranConLosSiguientesCamposBasicos(Table table)
            {
                throw new PendingStepException();
            }

            [Then(@"en ySocial se encontraran creados los nuevos perfiles al buscarlos por su id:")]
            public void ThenEnYSocialSeEncontraranCreadosLosNuevosPerfilesAlBuscarlosPorSuId(Table table)
            {
                throw new PendingStepException();
            }


        #endregion

        #endregion
    }
}
