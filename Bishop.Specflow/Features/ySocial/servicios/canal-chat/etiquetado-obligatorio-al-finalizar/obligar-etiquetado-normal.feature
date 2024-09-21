#language: es
Característica: Obligar al agente a aplicar una etiqueta normal al momento de finalizar un caso de chat
    Como supervisor de ySocial
    Quiero que todos los agentes se vean obligados a agregar una etiqueta normal al caso de chat al momento de finalizarlo
    Para que no haya casos del servicio sin al menos una etiqueta

    Regla: la configuracion del etiquetado obligatorio se realiza en la edicion del servicio
        
        @tc:5146
        Escenario: supervisor visualiza check de etiquetado obligatorio
            Dado un servicio de chat 
            Cuando un supervisor ingresa a la edicion del servicio
            Entonces vera un check para habilitar el uso obligatorio de etiqueta normal

    #Regla: el feature no podra estar habilitado al mismo tiempo que el feature "Finalizar automáticamente chats abandonados" 
    # Se deja comentada esta regla ya que no aplica. Al agregarse el feature de la us 7959, los checks ya no son excluyentes.
        #@tc:5147
        #Escenario: habilitar el uso obligatorio de etiqueta normal deshabilita el feature "Finalizar automáticamente chats abandonados"
        #    Dado que un servicio de chat posee habilitado el feature "Finalizar automáticamente chats abandonados"
        #    Cuando un supervisor habilita el uso obligatorio de etiqueta normal
        #    Entonces automaticamente se deshabilitara el check del feature "Finalizar automáticamente chats abandonados"

    #    @tc:5148
    #    Escenario: check de "Finalizar automáticamente chats abandonados" bloqueado cuando esta habilitado el etiquetado obligatorio
    #        Dado que un servicio de chat posee habilitado el uso obligatorio de etiqueta normal
    #        Cuando un supervisor intenta habilitar el check de "Finalizar automáticamente chats abandonados"
    #        Entonces el check estara bloqueado
    #        Y no podra ser activado hasta que se deshabilite el uso obligatorio de etiqueta normal
    #
    Regla: el agente es obligado a etiquetar si es que el caso no posee la etiqueta requerida

        @tc:5149
        Escenario: se obliga a agente a aplicar una etiqueta normal
            Dado que se encuentra habilitado el feature "Etiquetado obligatorio al cerrar" con la opcion "Si no tiene etiqueta"
            Y un caso del servicio fue asignado a un agente
            Y el caso no tiene etiquetas
            Cuando el agente intenta finalizar el caso
            Entonces el agente se vera obligado a aplicar una etiqueta normal al caso para continuar con la finalizacion
        
        @tc:5151
        Escenario: no se le obliga al agente a etiquetar un caso al tener etiquetas previamente
            Dado que se encuentra habilitado el feature "Etiquetado obligatorio al cerrar" con la opcion "Si no tiene etiqueta"
            Y un caso del servicio fue asignado a un agente
            Y el caso ya posee una etiqueta normal
            Cuando el agente intenta finalizar el caso
            Entonces no se le obligara al agente a aplicar una etiqueta para continuar con la finalizacion

        @tc:6063
        Escenario: Se le obliga al agente a etiquetar un caso de chat que tuvo una etiqueta y luego fue quitada
            Dado que se encuentra habilitado el feature "Etiquetado obligatorio al cerrar" con la opcion "Si no tiene etiqueta"
            Y dado un caso de chat que tuvo etiqueta que luego le fue quitada
            Y el caso le es asignado a un agente
            Cuando el agente intenta finalizar el caso
            Entonces el agente se vera obligado a aplicar una etiqueta normal al caso para continuar con la finalizacion

    Regla: el agente no es obligado a etiquetar en ningún caso

            @tc:
            Escenario: no se obliga el etiquetado de un caso sin etiqueta normal
                Dado que se encuentra habilitado el feature "Etiquetado obligatorio al cerrar" con la opcion "No se obliga"
                Y un caso del servicio fue asignado a un agente
                Y el caso no tiene etiqueta 
                Cuando el agente intenta finalizar el caso
                Entonces no se le obligara al agente a aplicar una etiqueta para continuar con la finalizacion

            @tc:
            Escenario: no se obliga el etiquetado de un caso con etiqueta previa
                Dado que se encuentra habilitado el feature "Etiquetado obligatorio al cerrar" con la opcion "No se obliga"
                Y un caso del servicio fue asignado a un agente
                Y el caso tiene etiqueta 
                Cuando el agente intenta finalizar el caso
                Entonces no se le obligara al agente a aplicar una etiqueta para continuar con la finalizacion

    Regla: el agente es obligado a etiquetar cuando el caso no tiene una etiqueta de un agente colocada

        @tc:
        Escenario: se obliga a etiquetar un caso con etiqueta que no fue colocada por agente
        Dado que se encuentra habilitado el feature "Etiquetado obligatorio al cierre" con la opcion "Si no tiene etiqueta de agente"
        Y ingresa un caso con etiqueta colocada por <agente>
        Cuando el agente intenta cerrar el caso
        Entonces debera aparecer el modal para aplicar etiquetas

        Ejemplos: 
            | agente        |
            | un supervisor | 
            | sistema       |

        #falta confirmar que el supervisor sea diferente al agente, o por ser "humano" se considera como etiqueta de agente

    @tc:
    Escenario: no se obliga a etiquetar un caso con etiqueta previa de agente
        Dado que se encuentra habilitado el feature "Etiquetado obligatorio al cierre" con la opcion "Si no tiene etiqueta de agente"
        Y ingresa un caso con etiqueta colocada por agente A
        Cuando agente B intenta cerrar el caso
        Entonces debera no aparecer el modal para aplicar etiquetas
