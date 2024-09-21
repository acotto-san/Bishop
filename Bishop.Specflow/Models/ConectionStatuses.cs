using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ySpecFlow.Models
{

    public enum ConnectionStatuses
    {
        /// <summary>
        /// Cuando no hay estado establecido
        /// </summary>
        Ninguno = 0,

        /// <summary>
        /// Conectado
        /// </summary>
        Disponible = 1,

        /// <summary>
        /// Trabajando (con mensajes)
        /// </summary>
        Trabajando = 2,

        /// <summary>
        /// Pendiente de pasar a <see cref="Aux"/>
        /// </summary>
        PendienteAuxiliar = 3,

        /// <summary>
        /// Auxiliar
        /// </summary>
        Auxiliar = 4,
    }
}
