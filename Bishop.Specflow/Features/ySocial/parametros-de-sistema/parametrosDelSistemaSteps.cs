using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.Features.ySocial.parametros_de_sistema
{
    [Binding]
    public class parametrosDelSistemaSteps
    {

        #region given

        [Given(@"datos que en Parametros del Sistema de ySocial se encuentran configurados los siguientes ""([^""]*)""")]
        public void GivenDatosQueEnParametrosDelSistemaDeYSocialSeEncuentranConfiguradosLosSiguientes(string p0, Table table)
        {
            throw new PendingStepException();
        }

        #endregion

        #region when
        #endregion

        #region then
        #endregion


    }
}
