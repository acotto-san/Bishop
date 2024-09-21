#language: es
Característica: Dentro de una conversacion se pueden enviar caracteres especiales
    como agente en una conversacion
    quiero poder ver los caracteres especiales que envie el usuario final
    para poder ver el mensaje de forma correcta

    Regla de negocio: Un agente puede ver los caracteres especiales enviados por el usuario final
	
        @tc5650
        Esquema del escenario: Un agente con una conversacion activa recibe un mensaje con caracteres especiales
            Dado que un agente tiene asignada una conversación
            Y el servicio de donde proviene el caso posee <estado modo chat> el modo chat
            Cuando el agente reciba un mensaje con el siguiente texto "<texto con caracteres>"
            Entonces el agente debera ver el siguiente texto "<texto con caracteres>"

            Ejemplos: modo chat habilitado
                | estado modo chat | texto con caracteres |
                | habilitado       | Hola_Hola__          |
                | habilitado       | Hola*Hola**          |

            Ejemplos: modo chat deshabilitado
                | estado modo chat | texto con caracteres |
                | deshabilitado    | Hola_Hola__          |
                | deshabilitado    | Hola*Hola**          |