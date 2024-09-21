#language: es
Característica: Obligar etiquetado en la primer interaccion cuando el caso posee 0 etiquetas
    Este es un comportamiento que se aplica bajo la interaccion de un mensaje asignado, 
    dependiendo de la accion que se vaya a realizar (finalizar/responder/descartar/enviarHSM)
    se va a tener en cuenta o no si el caso posee mensajes previos. Este feature parece no aplicar


    Regla de negocio: El comportamiento es habilitable por un supervisor

        @tc:8802
        Escenario: supervisor habilita el etiquetado obligatorio al iniciar caso sin etiquetas 
            Dado se encuentra deshabilitada la funcionalidad de obligar a los agentes a etiquetar al gestionar el inicio de casos sin etiquetas 
            Cuando un supervisor ingresa a parametros de sistema
            Entonces ahi podra habilitar para que el feature aplique globalmente a todos los agentes

    Regla de negocio: Accion "finalizar" de modo chat obliga a etiquetar si es la primer finalizacion del caso

        @tc:8803
        Escenario: Agentes es obligado a etiquetar al realizar la primera finalizacion de modo chat 
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y un agente recibio la asignacion de un caso que aun no fue gestionado por un agente
            Cuando el agente responde el mensaje y finaliza la atencion del mensaje asignado
            Entonces para continuar sera obligado a aplicar una etiqueta normal

        @tc:8804
        Esquema del escenario: Agente es obligado a aplicar etiqueta normal en la primer finalizacion del caso a pesar de tener salientes
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y un agente recibio la asignacion de un caso que aun no fue gestionado por un agente
            Y el caso posee mensajes salientes de <entidad>
            Cuando el agente responde el mensaje y finaliza la atencion del mensaje asignado
            Entonces para continuar sera obligado a aplicar una etiqueta normal

            Ejemplos:
                | entidad                 |
                | bot                     |
                | supervisor              |
                | sistema (SL-Filtro-Etc) |

    Regla de negocio: Accion "Responder" de modo normal obliga a etiquetar si se responde el primer mensaje del caso

        @tc:8805
        Escenario: Agente es obligado a etiquetar al responder el primer mensaje entrante
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y un agente recibio la asignacion del primer mensaje entrante de un caso
            Cuando intenta responder en modo normal el mensaje asignado
            Entonces para continuar sera obligado a etiquetar

        @tc:8806
        Esquema del escenario: Agente no es obligado a etiquetar al responder el primer mensaje de un caso que posee salien tes
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y un agente recibio la asignacion del primer mensaje del caso 
            Y el caso posee mensajes salientes de <entidad>
            Cuando intenta responder en modo normal el mensaje asignado
            Entonces la respuesta sera enviada y el agente no sera obligado a etiquetar

            Ejemplos:
                | entidad                 |
                | bot                     |
                | sistema (SL-Filtro-Etc) |

    Regla de negocio: Accion "Descartar" obliga a etiquetar si se esta descartando el primer mensaje del caso
        
        @tc:8807
        Escenario: Agente es obligado a etiquetar al descartar el primer mensaje entrante 
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y un agente recibio la asignacion del primer mensaje entrante de un caso
            Cuando intenta descartar el mensaje asignado
            Entonces para continuar sera obligado a etiquetar

        @tc:8808
        Esquema del escenario: Agente no es obligado a etiquetar al descartar el primer mensaje entrante del caso
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y un agente recibio la asignacion del primer mensaje del caso 
            Y el caso posee mensajes salientes de <entidad>
            Cuando intenta descartar el mensaje asignado
            Entonces el mensaje sera descartado y no sera obligado a etiquetar

            Ejemplos:
                | entidad                 |
                | bot                     |
                | sistema (SL-Filtro-Etc) |

    Regla de negocio: Accion "Responder con plantilla HSM" obliga a etiquetar si se esta respondiendo el primer mensaje del caso

        @tc:8809
        Escenario: Agente es obligado a etiquetar al responder con un HSM el primer mensaje del caso
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y un agente recibio la asignacion del primer mensaje entrante de un caso
            Cuando intenta responder con una plantilla HSM
            Entonces para continuar sera obligado a aplicar una etiqueta normal

        @tc:8810
        Esquema del escenario: Al responder con un HSM el agente no es obligado a etiquetar si el caso posee mensajes salientes
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y un agente recibio la asignacion del primer mensaje del caso 
            Y el caso posee mensajes salientes de <entidad>
            Cuando intenta responder con una plantilla HSM
            Entonces el HSM sera enviado y no se le obligara a etiquetar    

            Ejemplos:
                | entidad                 |
                | bot                     |
                | supervisor              |
                | sistema (SL-Filtro-Etc) |

    Regla de negocio: Razones comunes por las cuales puede que se omita el obligarle a etiquetar
        
        @tc:8811
        Esquema del escenario: Agente intenta cerrar el caso al ejecutar la accion y no se le obliga a etiquetar
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y a un agente le asignaron un caso compuesto solo del mensaje entrante
            Cuando intenta <accion> y cerrar caso
            Entonces no sera obligado a etiquetar

            Ejemplos: 
                | accion                      |
                | finalizar (modo chat)       |
                | responder (modo normal)     |
                | descartar                   |
                | responder con plantilla HSM |

        @tc:8812
        Esquema del escenario: Agente no es obligado a etiquetar al inicio porque el caso posee etiquetas
            Dado que la funcionalidad de obligar etiquetado al inicio esta configurado en "si no tiene ninguna etiqueta"
            Y a un agente le asignaron un caso compuesto solo del mensaje entrante
            Y el caso posee una etiqueta 
            Cuando intenta <accion> 
            Entonces no sera obligado a etiquetar

            Ejemplos: 
                | accion                      |
                | finalizar (modo chat)       |
                | responder (modo normal)     |
                | descartar                   |
                | responder con plantilla HSM |