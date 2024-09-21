#language: es
Característica: enviar mensaje proactivo a caso que va a ser finalizado automaticamente por inactividad
    En parametros de sistema se encuentra un feature para cerrar automaticamente los casos con inactividad de parte del usuario.
    Este feature permite configurar un mensaje para enviar X cantidad de minutos antes de ese cierre para incentivar al usuario a continuar su caso-

    Antecedentes:
        Dado la siguiente configuracion en parametros de sistema:
			| funcionalidad                              | configuracion |
			| Minutos para el cierre automatico de casos | 60 minutos    |
        Y dada la siguiente configuracion en un servicio:
            | Acciones sobre casos próximos a ser cerrados por inactividad | configuracion                |
            | Mensaje de respuesta:                                        | "En breve se cierra tu caso" |
            | Cantidad minutos antes del límite:                           | 20 minutos                   |

    Escenario: mensaje se envia a caso que esta por finalizarse automaticamete por inactividad
        Dado que un caso comenzo a acumular inactividad del cliente
        Cuando transcurren 40 minutos
        Entonces se agregara al caso un mensaje saliente con el texto "En breve cierra tu caso"

    Escenario: mensaje no se envia si el caso que acumula tiempo de inactividad se encuentra en yFlow
        Dado que un caso comenzo a acumular inactividad del cliente
        Y el mismo se encontraba en yFlow
        Cuando transcurren 40 minutos
        Entonces no se agregara el mensaje proactivo al caso

    Escenario: mensaje no se envia si el caso que acumula inactividad solo contiene un mensaje HSM
        Dado que un caso comenzo a acumular inactividad del cliente
        Y el caso solo contiene un mensaje HSM
        Cuando transcurren 40 minutos
        Entonces no se agregara el mensaje proactivo al caso        

    #PROBAR SI EL SIG ESCENARIO ES VALIDO
    #Escenario: mensaje no se envia si el caso es iniciado por un agente