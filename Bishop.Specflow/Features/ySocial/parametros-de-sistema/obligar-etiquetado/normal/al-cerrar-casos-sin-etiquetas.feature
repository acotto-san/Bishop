#language: es
Característica: Obligar el etiquetado al cerrar un caso sin etiquetas
	Como supervisor de ySocial
    Quiero que todos los agentes se vean obligados a agregar una etiqueta normal al caso al momento de cerrarlo
    Para que no haya casos cerrados por agente sin etiqueta en el sistema 

    Las etiquetas pueden ser colocadas por un agente, supervisor o sistema (el bot, service level, filtro, acción automática)

    El canal chat se configura directamente en el servicio. 

    Regla: la configuracion del etiquetado obligatorio se realiza en Parametros de sistema

        @tc:6071
        Escenario: supervisor habilita el etiquetado obligatorio al cerrar caso sin etiquetas
            Dado se encuentra deshabilitada la funcionalidad de obligar a los agentes a etiquetar al cerrar casos sin etiquetas
            Cuando un supervisor ingresa a parametros de sistema
            Entonces ahi podra habilitar para que el feature aplique globalmente a todos los agentes

    Regla de negocio: El etiquetado obligatorio aplica a casos asignados
        
        @tc:6072
        Esquema del escenario: Agente es obligado a etiquetar al cerrar un caso asignado sin etiquetas
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "si no tiene ninguna etiqueta"
            Y a un agente le asignaron un caso sin etiquetar
            Cuando intenta cerrar el caso mediante la opcion <accion> 
            Entonces para continuar sera obligado a aplicar una etiqueta normal

            Ejemplos: 
                | accion                      |
                | finalizar (modo chat)       |
                | responder (modo normal)     |
                | descartar                   |
                | responder con plantilla HSM |
            
    Regla de negocio: Se tiene en cuenta los casos que se cierran desde Salientes

        @tc:8795
        Escenario: Agente es obligado a etiquetar al intentar cerrar un caso sin etiquetas desde Salientes
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "si no tiene ninguna etiqueta"
            Cuando el agente intenta cerrar un caso que no posee etiquetas desde Salientes
            Entonces para continuar sera obligado a aplicar una etiqueta normal

    Regla de negocio: Se tiene en cuenta los casos que se cierran desde Buscar Casos
        
        @tc:8796
        Escenario: Agente es obligado a etiquetar al intentar cerrar un caso sin etiquetas desde Buscar Casos
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "si no tiene ninguna etiqueta"
            Cuando el agente intenta cerrar un caso que no posee etiquetas desde Buscar Casos
            Entonces para continuar sera obligado a aplicar una etiqueta normal

    Regla de negocio: En ocaciones se omitira el etiquetado obligatorio

        @tc:6073
        Escenario: Agente queda excento de etiquetar al cerrar caso asignado por tener etiquetas
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "si no tiene ninguna etiqueta"
            Cuando un agente intenta cerrar un caso asignado que posee etiquetas 
            Entonces no sera obligado a etiquetar
        
        @tc:8797
        Escenario: Agente queda excento de etiquetar al cerrar caso desde Salientes por tener etiquetas
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "si no tiene ninguna etiqueta"
            Cuando un agente intenta cerrar un caso que posee etiquetas desde Salientes
            Entonces no sera obligado a etiquetar

        @tc:8798
        Escenario: Agente queda excento de etiquetar al cerrar caso desde Buscar Casos por tener etiquetas
            Dado que la funcionalidad de obligar etiquetado al cerrar esta configurado en "si no tiene ninguna etiqueta"
            Cuando un agente intenta cerrar un caso que posee etiquetas desde Buscar Casos
            Entonces no sera obligado a etiquetar
