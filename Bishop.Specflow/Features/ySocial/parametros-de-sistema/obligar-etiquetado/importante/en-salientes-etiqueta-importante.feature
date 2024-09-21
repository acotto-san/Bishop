#language: es
Característica: obligar el uso de etiqueta importante en salientes

    Regla: la configuracion del etiquetado obligatorio se realiza en Parametros de sistema

        @tc:6206
        Escenario: supervisor visualiza check de etiquetado importante obligatorio en salientes
            Dado un supervisor ingresa en Parametros del Sistema
            Cuando se posiciona en la seccion "Configuraciones para los agentes" de la pestaña "Casos"
            Entonces vera el check "Etiquetado importante al enviar salientes" para habilitar el uso obligatorio de etiqueta importante al realizar un saliente

    Regla: el agente es obligado a etiquetar siempre al realizar un saliente

        @tc:6207
        Esquema del escenario: se obliga aplicar etiqueta importante a un agente que envia un saliente
            Dado en Parametros del Sistema se encuentra habilitado el feature "Etiquetado importante al enviar salientes"
            Cuando el agente intenta enviar un saliente de un servicio de tipo: <tipo de servicio>
            Entonces aparecera el modal para aplicar etiquetas al caso
            Y no permitira efectuar el envio hasta que se aplique una etiqueta importante

            Ejemplos: 
                | tipo de servicio  |
                | whatsapp (normal) |
                | whatsapp (hsm)    |
                | twitter           |
                | mail              |
                | instagram         |
                | messenger         |
                | telegram          |

    Regla: el agente es obligado a etiquetar siempre al realizar un reenvio de mail desde un caso de mail asignado
        
        @tc:6208
        Escenario: Agente es obligado a aplicar etiqueta importante al utilizar el feature "Generar Saliente"
            Dado en Parametros del Sistema se encuentra habilitado el feature "Etiquetado importante al enviar salientes"
            Y un agente posee un caso de mail asignado 
            Cuando utiliza la opcion "Generar Saliente" desde dicho mensaje
            Entonces aparecera el modal para aplicar etiquetas al caso
            Y no permitira efectuar el envio hasta que se aplique una etiqueta importante