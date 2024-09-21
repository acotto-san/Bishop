#language: es
@us:7984
Característica: Obligar el etiquetado al cerrar un caso sin etiquetas de un agente


    Regla: la configuracion del etiquetado obligatorio se realiza en Parametros de sistema

        @tc:8774
        Escenario: supervisor habilita el etiquetado obligatorio al cerrar caso sin etiquetas de agentes
            Dado se encuentra deshabilitada la funcionalidad de obligar a los agentes a etiquetar al cerrar casos sin etiquetas de agentes
            Cuando un supervisor ingresa a parametros de sistema
            Entonces ahi podra habilitar para que el feature aplique globalmente a todos los agentes

    Regla de negocio: El etiquetado obligatorio aplica a casos asignados
        
        @tc:8775
        Esquema del escenario: Agente es obligado a etiquetar al cerrar un caso asignado sin etiquetas de agente
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "sin etiquetas de agente"
            Y a un agente le asignaron un caso con etiquetas pero ninguna provista por un agente
            Cuando intenta <accion> 
            Entonces para continuar sera obligado a aplicar una etiqueta normal

            Ejemplos: 
                | accion                      |
                | finalizar (modo chat)       |
                | responder (modo normal)     |
                | descartar                   |
                | responder con plantilla HSM |
            
    Regla de negocio: Se tiene en cuenta los casos que se cierran desde Salientes

        @tc:8776
        Escenario: Agente es obligado a etiquetar al intentar cerrar desde Salientes un caso sin etiquetas de agente
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "sin etiquetas de agente"
            Cuando el agente desde Salientes intenta cerrar un caso con etiquetas pero ninguna provista por agente
            Entonces para continuar sera obligado a aplicar una etiqueta normal

    Regla de negocio: Se tiene en cuenta los casos que se cierran desde Buscar Casos
        
        @tc:8777
        Escenario: Agente es obligado a etiquetar al intentar cerrar desde Buscar Casos un caso sin etiquetas de agente
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "sin etiquetas de agente"
            Cuando el agente desde Buscar Casos intenta cerrar un caso con etiquetas pero ninguna provista por agente
            Entonces para continuar sera obligado a aplicar una etiqueta normal

    Regla de negocio: En ocaciones se omitira el etiquetado obligatorio

        @tc:8778
        Escenario: Agente queda excento de etiquetar al cerrar caso asignado por tener etiquetas de agente
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "sin etiquetas de agente"
            Cuando un agente intenta cerrar un caso asignado que posee una etiqueta provista por un agente
            Entonces no sera obligado a etiquetar
        
        @tc:8779
        Escenario: Agente queda excento de etiquetar al cerrar caso desde Salientes por tener etiquetas de agente
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "sin etiquetas de agente"
            Cuando un agente intenta cerrar desde Salientes un caso que posee una etiqueta provista por un agente
            Entonces no sera obligado a etiquetar

        @tc:8780
        Escenario: Agente queda excento de etiquetar al cerrar caso desde Buscar Casos por tener etiquetas de agente
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "sin etiquetas de agente"
            Cuando un agente intenta cerrar desde Buscar Casos un caso que posee una etiqueta provista por un agente
            Entonces no sera obligado a etiquetar

        @tc:8781
        Escenario: Agente queda excento de etiquetar al cerrar caso asignado por no haber etiquetas disponibles
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "sin etiquetas de agente"
            Y a un agente le asignaron un caso con etiquetas pero ninguna provista por un agente
            Y la cola de donde proviene el caso no posee etiquetas asignadas
            Cuando el agente intenta cerrar el caso
            Entonces no sera obligado a etiquetar                                                                                                                                                                                                                                                     