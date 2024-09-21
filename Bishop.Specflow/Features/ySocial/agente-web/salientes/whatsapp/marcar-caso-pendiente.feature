#language: es
Característica: marcar un caso como pendiente
    Como agente 
    Quiero que al hacer un saliente lo pueda marcar como pendiente
    Para poder tener un seguimiendo del caso desde la seccion de pendientes

    Regla: la visubilidad del boton de marcar como pendiente dependera del permiso del agente de marcar casos como pendientes
        Esquema del escenario: agente marca como pendiente un caso generado desde salientes
            Dado que un agente redacta un mensaje saliente de whatsapp de tipo <@tipoDeMensaje> 
            Y que el agente posee habilitado el permiso de casos pendientes
            Cuando marca el caso como pendiente
            Y envia el mensaje
            Entonces en su modulo de "mensajes pendiente" debera de poder ver el caso

            Ejemplos:
                | <@tipoDeMensaje> |
                | norma            |
                | hsm              |

        Esquema del escenario: agente no visualiza boton para marcar caso como pendiente
            Dado que un agente redacta un mensaje saliente de whatsapp de tipo <@tipoDeMensaje> 
            Y que el agente no posee habilitado el permiso de casos pendientes
            Cuando ingresa termina de redactar el mensaje
            Entonces no vera en pantalla el boton para marcar el caso como pendiente

            Ejemplos:
                | <@tipoDeMensaje> |
                | norma            |
                | hsm              |