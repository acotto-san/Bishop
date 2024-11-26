#language: es
Característica: Obligar al agente a aplicar una etiqueta importante al momento de finalizar un caso
	Como supervisor de ySocial
    Quiero que todos los agentes se vean obligados a agregar una etiqueta importante al caso al momento de cerrarlo
    Para que no haya casos cerrados por agente sin etiqueta importante en el sistema 
    
    Las etiquetas pueden ser colocadas por un agente, supervisor o sistema (el bot, service level, filtro, acción automática)

    El canal chat se configura directamente en el servicio.

    Regla: la configuracion del etiquetado obligatorio se realiza en Parametros de sistema

        @tc:6076
        Escenario: supervisor visualiza el check de uso obligatorio de etiqueta importante
            Dado un supervisor ingresa en Parametros del Sistema
            Cuando se posiciona en la seccion "Configuraciones para los agentes" de la pestaña "Casos"
            Entonces vera el check "Etiquetado importante" para habilitar el uso obligatorio de etiqueta importante al cerrar

        @tc:6077
        Escenario: supervisor no visualiza el check de uso obligatorio de etiqueta importante debido a que el de etiqueta normal esta deshabilitado
            Dado en Parametros del Sistema se encuentra deshabilitado el feature "Etiquetado obligatorio al cierre"
            Cuando un supervisor ingresa en Parametros del Sistema
            Y se posiciona en la seccion "Configuraciones para los agentes" de la pestaña "Casos"
            Entonces no vera el check "Etiquetado importante" para habilitar el uso obligatorio de etiqueta importante al cerrar
    
    Regla: el agente es obligado a etiquetar si el caso no posee la etiqueta requerida

        @tc:6078
        Esquema del escenario: se obliga el etiquetado importante de un caso sin etiqueta importante
            Dado que se encuentra habilitado el feature "Etiquetado importante" con la opcion "Si no tiene ninguna etiqueta"
            Y a un agente se le asigna un caso con las siguientes propiedades:
                | tiene etiquetas normales | tiene etiqueta importante | config del servicio          |
                | <posee etiquetas>        | no                        | modo chat:<estado modo chat> |
            Cuando el agente intenta cerrar el caso mediante la accion <accion>
            Entonces aparecera el modal para aplicar etiquetas al caso
            Y no permitira efectuar el cierre hasta que se aplique una etiqueta importante

            Ejemplos: modo chat habilitado
                | posee etiquetas | estado modo chat | accion             |
                | no              | on               | finalizar y cerrar |
                | si              | on               | finalizar y cerrar |
                | no              | on               | descartar y cerrar |
                | si              | on               | descartar y cerrar |

            Ejemplos: modo chat deshabilitado
                | posee etiquetas | estado modo chat | accion    |
                | no              | off              | responder |
                | si              | off              | responder |
                | no              | off              | descartar |
                | si              | off              | decartar  |

        @tc:6079
        Esquema del escenario: no se obliga el etiquetado importante de un caso que ya posee etiqueta importante
            Dado que se encuentra habilitado el feature "Etiquetado importante" con la opcion "Si no tiene ninguna etiqueta"            
            Y a un agente se le asigna un caso con las siguientes propiedades:
                | tiene etiquetas normales | tiene etiqueta importante | config del servicio          |
                | si                       | si                        | modo chat:<estado modo chat> |
            Cuando el agente intenta cerrar el caso mediante la accion <accion>
            Entonces no se le obligara al agente a aplicar una etiqueta importante para efectuar el cierre del caso


            Ejemplos: modo chat habilitado
               | estado modo chat | accion    |
               | on               | finalizar y cerrar|
               | on               | descartar y cerrar|

            Ejemplos: modo chat deshabilitado
                | estado modo chat | accion    |
                | off              | responder |
                | off              | descartar |

        @tc:6080
        Escenario: Se le obliga al agente a etiquetar un caso que tuvo una etiqueta importante y luego fue quitada
            Dado que el etiquetado importante al cerrar se encuentra habilitado
            Y a un agente se le asigna un caso que tuvo una etiqueta importante que luego le fue quitada
            Cuando el agente intenta cerrar el caso
            Entonces aparecera el modal para aplicar etiquetas al caso
            Y no permitira efectuar el cierre hasta que se aplique una etiqueta importante

    Regla: el agente no es obligado a etiquetar en ninguna condición

          @tc:
          Esquema del escenario: no se obliga el etiquetado importante de un caso sin etiqueta importante
            Dado que se encuentra habilitado el feature "Etiquetado importante al cierre" con la opcion "No se obliga"
            Y a un agente se le asigna un caso con las siguientes propiedades:
                | tiene etiquetas normales | tiene etiqueta importante | config del servicio          |
                | si                       | no                        | modo chat:<estado modo chat> |
            Cuando el agente intenta cerrar el caso mediante la accion <accion>
            Entonces no aparecera el modal para aplicar etiquetas al caso

                Ejemplos: 
                       | estado modo chat | accion             |
                       | on               | finalizar y cerrar |
                       | on               | descartar y cerrar |
                       | off              | responder          |
                       | off              | decartar           |

        @tc:
        Escenario: no se obliga el etiquetado importante de un caso con etiqueta previa
            Dado que se encuentra habilitado el feature "Etiquetado obligatorio al cierre" con la opcion "No se obliga"
            Y a un agente se le asigna un caso con las siguientes propiedades:
                    | tiene etiquetas normales | tiene etiqueta importante | etiquetado por | config del servicio          |
                    | si                       | si                        | <agente>       | modo chat:<estado modo chat> |
            Cuando el agente intenta cerrar el caso mediante la accion <accion>
            Entonces no debera aparecer el modal para aplicar etiquetas

               Ejemplos: modo chat habilitado
                    | agente      | estado modo chat | accion             |
                    | supervisor  | on               | finalizar y cerrar |
                    | otro agente | on               | finalizar y cerrar |
                    | sistema     | on               | finalizar y cerrar |
                    | supervisor  | on               | descartar y cerrar |
                    | otro agente | on               | descartar y cerrar |
                    | sistema     | on               | descartar y cerrar |

               Ejemplos: modo chat deshabilitado
                   | agente      | estado modo chat | accion    |
                   | supervisor  | off              | responder |
                   | otro agente | off              | responder |
                   | sistema     | off              | responder |
                   | supervisor  | off              | descartar |
                   | otro agente | off              | descartar |
                   | sistema     | off              | descartar |