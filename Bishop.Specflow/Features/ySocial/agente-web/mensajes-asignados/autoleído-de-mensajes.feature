#language: es
Característica: autoleido de mensajes 
Como agente
Quiero que si tengo la configuración "marcar automáticamente como leído", al realizar la acción de descartar o responder un msj, se me autolea el siguiente caso
Para evitar tener que leerlo yo y gastar tiempo.


Regla: el agente debe tener la configuración activada para que se le autolean los mensajes que se le asignan.

    @tc:5727
    Esquema del escenario: Los mensajes no son autoleidos
        Dado que un agente tiene la configuracion "Marcar automaticamente como leido" desactivada
        Y no esta configurado en modo chat
        Y tiene dos mensajes asignados 
        Cuando <accion> el mensaje 1
        Entonces deberia aparecer el siguiente mensaje ´Usted tiene un mensaje sin responder´ en su web

        Ejemplos:
            | accion     |
            | responde   |
            | cierra     |
            | descarta   |
            | transfiere |

    @tc:5728
    Esquema del escenario: Los mensajes son autoleidos.
        Dado que un agente tiene la configuracion "Marcar automaticamente como leido" activada
        Y no esta configurado en modo chat
        Y tiene dos mensajes asignados en su web
        Cuando <accion> el mensaje 1
        Entonces deberia abrirse automaticamente el segundo mensaje asignado en su web

        Ejemplos:
            | accion     |
            | responde   |
            | cierra     |
            | descarta   |
            | transfiere |

    @tc:5772
    Esquema del escenario: Los mensajes son autoleidos en modo chat.
        Dado que un agente tiene la configuracion "Marcar automaticamente como leido" activada
        Y tiene dos mensajes asignados en su web
        Y los mensajes provienen de un servicio que posee habilitado el modo chat
        Cuando <accion> el mensaje 1
        Entonces deberia <resultado> automaticamente el segundo mensaje asignado en su web

        Ejemplos:
            | accion     | resultado |
            | responde   | no abrirse|
            | finaliza   | abrirse   |
            | descarta   | abrirse   |
            | transfiere | abrirse   |
            | devuelve   | abrirse   |

    @tc:5739
    Esquema del escenario: Mensajes autoleidos cuando el agente cambia de estado.
        Dado que un agente tiene la configuracion "Marcar automaticamente como leido" activada
        Y su estado es auxiliar
        Y tiene mensajes en cola
        Cuando cambia su estado a disponible
        Entonces deberia abrirse automaticamente el primer mensaje asignado

    @tc:5799
    Esquema del escenario: Mensaje autoleido luego de que un mensaje se autodesasigne
        Dado que un agente se encuentra visualizando con un mensaje de <tipo de servicio>
        Y otro mensaje cualquiera
        Cuando el mensaje 1 se desasigna por <causa>
        Entonces deberia abrirse automaticamente el segundo mensaje asignado

        Ejemplos: 
            | tipo de servicio | causa                                     |
            | chat             | inactividad del servicio                  |
            | modo chat        | devolucion a la cola por timer del agente |
            | modo chat        | descarte por timer del usuario            |

    @tc:5800
    Escenario: Mensaje autoleido luego de que un supervisor lo desasigne
        Dado que un agente tiene la configuracion "Marcar automaticamente como leido" activada
        Y no esta configurado en modo chat
        Y tiene dos mensajes asignados en su web
        Cuando un supervisor desasigna el mensaje 1
        Entonces deberia abrirse automaticamente el segundo mensaje asignado en su web


     