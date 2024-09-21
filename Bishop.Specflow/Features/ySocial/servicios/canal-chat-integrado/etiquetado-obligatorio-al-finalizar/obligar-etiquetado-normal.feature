#language: es
Característica: obligar al agente a aplicar una etiqueta normal al momento de finalizar un casode chat integrado
    Como supervisor de ySocial
    Quiero que todos los agentes se vean obligados a agregar una etiqueta normal al caso de chat al momento de finalizarlo
    Para que no haya casos del servicio sin al menos una etiqueta

    Regla: la configuracion del etiquetado obligatorio se realiza en la edicion del servicio de chat integrado

        @tc:5434
        Escenario: supervisor visualiza check de etiquetado obligatorio en un servicio de chat integrado
            Dado un servicio de chat integrado 
            Cuando un supervisor ingresa a la edicion del servicio
            Entonces vera un check para habilitar el uso obligatorio de etiqueta normal

    Regla: el feature no podra estar habilitado al mismo tiempo que el feature "Finalizar automáticamente chats abandonados" 

        @tc:5435
        Escenario: habilitar el uso obligatorio de etiqueta normal deshabilita el feature "Finalizar automáticamente chats abandonados" en servicio de chat integrado
            Dado que un servicio de chat integrado posee habilitado el feature "Finalizar automáticamente chats abandonados"
            Cuando un supervisor habilita el uso obligatorio de etiqueta normal
            Entonces automaticamente se deshabilitara el check del feature "Finalizar automáticamente chats abandonados"

        @tc:5436
        Escenario: check de "Finalizar automáticamente chats abandonados" bloqueado cuando esta habilitado el etiquetado obligatorio en servicio de chat integrado
            Dado que un servicio de chat integrado posee habilitado el uso obligatorio de etiqueta normal
            Cuando un supervisor intenta habilitar el check de "Finalizar automáticamente chats abandonados"
            Entonces el check estara bloqueado
            Y no podra ser activado hasta que se deshabilite el uso obligatorio de etiqueta normal
    
    Regla: el agente es obligado a etiquetar si es que el caso no posee la etiqueta requerida

        @tc:5437
        Escenario: se obliga a agente a aplicar una etiqueta normal
            Dado que un servicio de chat integrado posee habilitado el uso obligatorio de etiqueta normal
            Y un caso del servicio fue asignado a un agente
            Cuando el agente intenta finalizar el caso
            Y el caso no tiene etiquetas
            Entonces el agente se vera obligado a aplicar una etiqueta normal al caso para continuar con la finalizacion
        
        @tc:5438
        Escenario: no se le obliga al agente a etiquetar un caso al tener etiquetas previamente
            Dado que un servicio de chat integrado posee habilitado el uso obligatorio de etiqueta normal
            Y un caso del servicio fue asignado a un agente
            Cuando el agente intenta finalizar el caso
            Y el caso ya posee una etiqueta normal
            Entonces no se le obligara al agente a aplicar una etiqueta para continuar con la finalizacion