#language: es
@us:7984
Característica: Obligar etiquetado en la primer interaccion cuando el caso no posee etiquetas de agente
    Este es un comportamiento que se aplica bajo la interaccion de un mensaje asignado, 
    dependiendo de la accion que se vaya a realizar (finalizar/responder/descartar/enviarHSM)
    se va a tener en cuenta o no si el caso posee mensajes previos. Este feature parece no aplicar

    Regla de negocio: El comportamiento es habilitable por un supervisor

        @tc:8786
        Escenario: supervisor habilita el etiquetado obligatorio al iniciar casos sin etiquetas de un agente
            Dado se encuentra deshabilitado obligar a los agentes a etiquetar al gestionar el inicio de casos sin etiquetas de agentes
            Cuando un supervisor ingresa a parametros de sistema
            Entonces ahi podra habilitar para que el feature aplique globalmente a todos los agentes

    Regla de negocio: Accion "finalizar" de modo chat obliga a etiquetar si es la primer finalizacion del caso

        @tc:8787
        Escenario: Agente es obligado a etiquetar al realizar la primera finalizacion de modo chat de caso sin etiquetas de agente
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene etiquetas de agente"
            Y un agente recibio la asignacion de un caso que aun no fue gestionado por un agente
            Y el caso tiene etiquetas pero ninguna puesta por un agente
            Cuando el agente responde el mensaje y finaliza la atencion del mensaje asignado
            Entonces para continuar sera obligado a aplicar una etiqueta normal


    Regla de negocio: Accion "Responder" de modo normal obliga a etiquetar si se responde el primer mensaje del caso sin etiquetas de agente

        @tc:8788
        Escenario: Agente es obligado a etiquetar al responder el primer mensaje entrante al no tener etiquetas del agente
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene etiquetas de agente"
            Y un agente recibio la asignacion del primer mensaje entrante de un caso
            Y el caso tiene etiquetas pero ninguna puesta por un agente
            Cuando intenta responder en modo normal el mensaje asignado
            Entonces para continuar sera obligado a aplicar una etiqueta normal

    Regla de negocio: Accion "Descartar" obliga a etiquetar si se esta descartando el primer mensaje del caso sin etiquetas de agente
        
        @tc:8789
        Escenario: Agente es obligado a etiquetar al descartar el primer mensaje entrante al no tener etiquetas del agente
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene etiquetas de agente"
            Y un agente recibio la asignacion del primer mensaje entrante de un caso
            Y el caso tiene etiquetas pero ninguna puesta por un agente
            Cuando intenta descartar el mensaje asignado
            Entonces para continuar sera obligado a aplicar una etiqueta normal

    Regla de negocio: Accion "Responder con plantilla HSM" obliga a etiquetar si se esta respondiendo el primer mensaje del caso  sin etiquetas de agente

        @tc:8790
        Escenario: Agente es obligado a etiquetar al responder con un HSM el primer mensaje del caso sin etiquetas de agent
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene etiquetas de agente"
            Y un agente recibio la asignacion del primer mensaje entrante de un caso
            Y el caso tiene etiquetas pero ninguna puesta por un agente
            Cuando intenta responder con una plantilla HSM
            Entonces para continuar sera obligado a aplicar una etiqueta normal

    Regla de negocio: Razones comunes por las cuales puede que se omita el obligarle a etiquetar
        
        @tc:8791
        Esquema del escenario: Agente intenta cerrar el caso al ejecutar la accion y no se le obliga a etiquetar
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene etiquetas de agente"
            Y a un agente le asignaron un caso compuesto solo del mensaje entrante
            Cuando intenta <accion> y cerrar caso
            Entonces no sera obligado a etiquetar

            Ejemplos: 
                | accion                      |
                | finalizar (modo chat)       |
                | responder (modo normal)     |
                | descartar                   |
                | responder con plantilla HSM |

        @tc:8792
        Esquema del escenario: Agente no es obligado a etiquetar al inicio porque el caso posee etiqueta de un agente
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene etiquetas de agente"
            Y a un agente le asignaron un caso compuesto solo del mensaje entrante
            Y el caso posee una etiqueta de un agente
            Cuando intenta <accion> 
            Entonces no sera obligado a etiquetar

            Ejemplos: 
                | accion                      |
                | finalizar (modo chat)       |
                | responder (modo normal)     |
                | descartar                   |
                | responder con plantilla HSM |

        @tc:8793
        Escenario: Agente no es obligado a etiquetar al inicio por no haber etiquetas en la cola
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene etiquetas de agente"
            Y a un agente le asignaron un caso compuesto solo del mensaje entrante
            Y la cola de donde proviene el caso no posee etiquetas asociadas
            Cuando intenta <accion> 
            Entonces no sera obligado a etiquetar

            Ejemplos: 
                | accion                      |
                | finalizar (modo chat)       |
                | responder (modo normal)     |
                | descartar                   |
                | responder con plantilla HSM |
