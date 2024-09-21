#language: es
Característica: obligar al agente a aplicar una etiqueta importante al momento de finalizar un caso de chat
    Como supervisor de ySocial
    Quiero que todos los agentes se vean obligados a agregar una etiqueta importante al caso de chat al momento de finalizarlo
    Para que no haya casos del servicio sin etiqueta importante

    Regla: la configuracion del etiquetado obligatorio se realiza en la edicion del servicio pero depende del uso obligatorio de etiqueta normal
        
        @tc:5152
        Escenario: supervisor visualiza el check de uso obligatorio de etiqueta importante
            Dado que un servicio de chat posee habilitado el uso obligatorio de etiqueta normal
            Cuando un supervisor ingresa a la edicion del servicio
            Entonces vera un check para habilitar el uso obligatorio de etiqueta importante
        
        @tc:5153
        Escenario: supervisor no visualiza el check de uso obligatorio de etiqueta importante debido a que el de etiqueta normal esta deshabilitado
            Dado que un servicio de chat no posee habilitado el uso obligatorio de etiqueta normal
            Cuando un supervisor ingresa a la edicion del servicio
            Entonces no vera un check para habilitar el uso obligatorio de etiqueta importante
    
    Regla: el agente es obligado a etiquetar si el caso no posee la etiqueta requerida

        @tc:5154
        Escenario: se obliga el etiquetado importante de un caso sin etiquetas
            Dado que se encuentra habilitado el feature "Etiquetado importante obligatorio al cerrar" con la opcion "Si no tiene etiqueta"
            Y un caso del servicio fue asignado a un agente
            Y el caso no tiene etiquetas
            Cuando el agente intenta finalizar el caso
            Entonces el agente se vera obligado a aplicar una etiqueta normal y una etiqueta importante al caso para continuar con la finalizacion

        @tc:5158
        Escenario: se obliga el etiquetado importante de un caso con etiqueta normal
            Dado que se encuentra habilitado el feature "Etiquetado importante obligatorio al cerrar" con la opcion "Si no tiene etiqueta"
            Y un caso del servicio fue asignado a un agente
            Y el caso tiene una etiqueta normal
            Cuando el agente intenta finalizar el caso
            Entonces el agente se vera obligado a aplicar una etiqueta importante al caso para continuar con la finalizacion

        @tc:5159
        Escenario: no se obliga el etiquetado importante de un caso que ya posee etiqueta importante
            Dado que se encuentra habilitado el feature "Etiquetado importante obligatorio al cerrar" con la opcion "Si no tiene etiqueta"
            Y un caso del servicio fue asignado a un agente
            Y el caso tiene una etiqueta importante
            Cuando el agente intenta finalizar el caso
            Entonces no se le obligara al agente a aplicar una etiqueta para continuar con la finalizacion

        @tc:6062
        Escenario: Se le obliga al agente a etiquetar un caso de chat que tuvo una etiqueta importante y luego fue quitada
            Dado que se encuentra habilitado el feature "Etiquetado importante obligatorio al cerrar" con la opcion "Si no tiene etiqueta"
            Y dado un caso de chat que tuvo etiqueta importante que luego le fue quitada
            Y el caso le es asignado a un agente
            Cuando el agente intenta finalizar el caso
            Entonces el agente se vera obligado a aplicar una etiqueta importante al caso para continuar con la finalizacion

    Regla: el agente no es obligado a etiquetar en ningún caso

            @tc:
            Escenario: no se obliga el etiquetado de un caso sin etiqueta importante
                Dado que se encuentra habilitado el feature "Etiquetado importante obligatorio al cerrar" con la opcion "No se obliga"
                Y un caso del servicio fue asignado a un agente
                Y el caso no tiene etiqueta importante
                Cuando el agente intenta finalizar el caso
                Entonces no se le obligara al agente a aplicar una etiqueta para continuar con la finalizacion

            @tc:
            Escenario: no se obliga el etiquetado de un caso con etiqueta importante previa
                Dado que se encuentra habilitado el feature "Etiquetado importante obligatorio al cerrar" con la opcion "No se obliga"
                Y un caso del servicio fue asignado a un agente
                Y el caso tiene etiqueta importante
                Cuando el agente intenta finalizar el caso
                Entonces no se le obligara al agente a aplicar una etiqueta para continuar con la finalizacion

    Regla: el agente es obligado a etiquetar cuando el caso no tiene una etiqueta de un agente colocada

        @tc:
        Escenario: se obliga a etiquetar un caso con etiqueta importante que no fue colocada por agente
        Dado que se encuentra habilitado el feature "Etiquetado importante obligatorio al cierre" con la opcion "Si no tiene etiqueta de agente"
        Y ingresa un caso con etiqueta importante colocada por <agente>
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
        Y ingresa un caso con etiqueta importante colocada por agente A
        Cuando agente B intenta cerrar el caso
        Entonces debera no aparecer el modal para aplicar etiquetas
   
        