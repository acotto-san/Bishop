#language: es
@us:7984
Característica:Obligar cuando agente intenta descartar mensaje y caso no posee etiquetas de un agente

    Regla de negocio: El comportamiento es habilitable por un supervisor
    
        @tc:8782
        Escenario: supervisor habilita el etiquetado obligatorio al descartar caso sin etiquetas 
            Dado se encuentra deshabilitada la funcionalidad de obligar a los agentes a etiquetar al descartar casos sin etiquetas de agentes
            Cuando un supervisor ingresa a parametros de sistema
            Entonces ahi podra habilitar para que el feature aplique globalmente a todos los agentes

    Regla de negocio: La obligacion a etiquetar ocurre cuando el agente intenta descartar un mensaje de un caso sin etiquetas de agente

        @tc:8783
        Esquema del escenario: Agente intenta descartar un mensaje de un caso sin etiquetas del agente y se le obliga a etiquetar para continuar
            Dado que la funcionalidad de obligar etiquetado al descartar esta configurado en "si no tiene etiquetas de agente""
            Y a un agente le asignaron un caso con <cantidad-etiquetas> etiquetas
            Y ninguna etiqueta aplicada por agente
            Cuando intente descartar el mensaje
            Entonces para continuar sera obligado a aplicar una etiqueta normal al caso

            Ejemplos:
                | cantidad-etiquetas |
                | 0                  |
                | 1                  |
        
        @tc:8784
        Escenario: Agente intenta descartar un mensaje y no es obligado a etiquetar porque el caso ya posee etiquetas de un agente
            Dado que la funcionalidad de obligar etiquetado en descarte esta configurado en "si no tiene etiquetas de agente""
            Y a un agente le asignaron un caso con 1 etiqueta provista por un agente
            Cuando intenta descartar el mensaje
            Entonces el mensaje se descartara sin haberle obligado al agente a etiquetar

    Regla de negocio: Si la cola no posee etiquetas entonces no se va a obligar el etiquetado

        @tc:8785
        Escenario: el etiquetado obligatorio no ocurre porque la cola de donde proviene el caso no posee etiquetas
            Dado que la funcionalidad de obligar etiquetado en descarte esta configurado en "si no tiene etiquetas de agente""
            Y a un agente le asignaron un caso con 0 etiquetas provistas por un agente
            Y el caso proviene de una cola que no posee etiquetas
            Cuando intente descartar el mensaje
            Entonces el mensaje se descartara sin haberle obligado al agente a etiquetar