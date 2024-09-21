#language: es
Característica:Obligar cuando agente intenta descartar mensaje y caso no posee etiquetas

    Regla de negocio: El comportamiento es habilitable por un supervisor

        @tc:8799
        Escenario: supervisor habilita el etiquetado obligatorio al descartar caso sin etiquetas 
            Dado se encuentra deshabilitada la funcionalidad de obligar a los agentes a etiquetar al descartar casos sin etiquetas 
            Cuando un supervisor ingresa a parametros de sistema
            Entonces ahi podra habilitar para que el feature aplique globalmente a todos los agentes

    Regla de negocio: Le obligamos a etiquetar cuando el agente intenta descartar un mensaje de un caso sin etiquetas

        @tc:8800
        Escenario: Agente intenta descartar un mensaje de un caso sin etiquetas y se le obliga a etiquetar para continuar
            Dado que la funcionalidad de obligar etiquetado al descartar esta configurado en "si no tiene ninguna etiqueta"
            Y a un agente le asignaron un caso con 0 etiquetas
            Cuando intente descartar el mensaje
            Entonces para continuar sera obligado a aplicar una etiqueta normal al caso

        @tc:8801
        Escenario: Agente intenta descartar un mensaje y no es obligado a etiquetar porque el caso ya posee alguna etiqueta
            Dado que la funcionalidad de obligar etiquetado al descartar esta configurado en "si no tiene ninguna etiqueta"
            Y a un agente le asignaron un caso con 1 etiqueta
            Cuando intenta descartar el mensaje
            Entonces el mensaje se descartara sin haberle obligado al agente a etiquetar