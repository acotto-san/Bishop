#language: es
Característica: obligar al agente a aplicar una etiqueta importante al momento de finalizar un caso de chat integrado
    Como supervisor de ySocial
    Quiero que todos los agentes se vean obligados a agregar una etiqueta importante al caso de chat integrado al momento de finalizarlo
    Para que no haya casos del servicio sin etiqueta importante

    Regla: la configuracion del etiquetado obligatorio se realiza en la edicion del servicio pero depende del uso obligatorio de etiqueta normal
        @tc:5439
        Escenario: supervisor visualiza el check de uso obligatorio de etiqueta importante en un servicio de chat integrado
            Dado que un servicio de chat integrado posee habilitado el uso obligatorio de etiqueta normal
            Cuando un supervisor ingresa a la edicion del servicio
            Entonces vera un check para habilitar el uso obligatorio de etiqueta importante
        
        @tc:5440
        Escenario: supervisor no visualiza el check de uso obligatorio de etiqueta importante en un servicio de chat integrado debido a que el de etiqueta normal esta deshabilitado
            Dado que un servicio de chat integrado no posee habilitado el uso obligatorio de etiqueta normal
            Cuando un supervisor ingresa a la edicion del servicio
            Entonces no vera un check para habilitar el uso obligatorio de etiqueta importante
    
    Regla: el agente es obligado a etiquetar si el caso no posee la etiqueta requerida

        @tc:5441
        Escenario: se obliga el etiquetado importante de un caso de chat integrado sin etiquetas 
            Dado que un servicio de chat integrado posee habilitado el uso obligatorio de etiqueta importante
            Y un caso del servicio fue asignado a un agente
            Y el caso no tiene etiquetas
            Cuando el agente intenta finalizar el caso
            Entonces el agente se vera obligado a aplicar una etiqueta normal y una etiqueta importante al caso para continuar con la finalizacion

        @tc:5442
        Escenario: se obliga el etiquetado importante de un caso de chat integrado con etiqueta normal 
            Dado que un servicio de chat integrado posee habilitado el uso obligatorio de etiqueta importante
            Y un caso del servicio fue asignado a un agente
            Y el caso tiene una etiqueta normal
            Cuando el agente intenta finalizar el caso
            Entonces el agente se vera obligado a aplicar una etiqueta importante al caso para continuar con la finalizacion

        @tc:5443
        Escenario: no se obliga el etiquetado importante de un caso de chat integrado que ya posee etiqueta importante
            Dado que un servicio de chat integrado posee habilitado el uso obligatorio de etiqueta importante
            Y un caso del servicio fue asignado a un agente
            Y el caso tiene una etiqueta normal
            Y tiene una etiqueta importante
            Cuando el agente intenta finalizar el caso
            Entonces no se le obligara al agente a aplicar una etiqueta para continuar con la finalizacion
        