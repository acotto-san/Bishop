#language: es
Característica: crear un nuevo caso mandando un saliente con mensaje normal
    Como agente 
    Quiero crear un nuevo caso de whatsapp con un mensaje normal
    Para poder crear casos cuando no tengo HSM

    Hay clientes que no disponinen de mensajes HSM, y quieren aprovechar el estar dentro de la ventana de 24hs desde la ultima interaccion del usuario para crear un nuevo caso enviando un mensaje normal.
    Para eso se agrega la posibilidad de crear un nuevo caso con un mensaje normal. Si la ultima interaccion fue hace mas de 24hs entonces no debe de estar presente la opcion.

    Regla: se puede acceder a la redaccion del mensaje si la interaccion entre el servicio y el usuario fue dentro de las ultimas 24hs
        
        Escenario: agente intenta redactar un mensaje saliente normal dentro de la ventana de 24hs desde la ultima interaccion del usuario
            Dado que un usuario se contacto el dia de hoy a las 13hs con el servicio "whatsapp 2014"
            Y el ultimo caso del usuario se cerro
            Cuando un agente selecciona el servicio "whatsapp 2014" desde salientes a las 17hs
            Y escribe el telefono del usuario
            Entonces podra crear un caso nuevo enviandole un mensaje normal

        Escenario:  agente no logra crear caso desde un servicio a pesar de que usuario final tiene una ventana abierta con otro servicio
            Dado que un usuario final se encuentra dentro de la ventana de 24hs del servicio de Whatsapp A
            Y que no se encuentra dentro de la 24hs del servicio de Whatsapp B
            Cuando un agente selecciona el servicio de Whatsapp A
            Y escribe el telefono del usuario
            Entonces no podra crear un caso nuevo enviandole un mensaje normal
    
    Regla: cuando un agente logra enviar el mensaje saliente de tipo normal este crea un nuevo caso
        
        Escenario: agente crea un nuevo caso con un mensaje saliente normal
            Dado que un agente redacta un mensaje normal desde salientes de whatsapp
            Cuando envia el mensaje
            Entonces se crea un nuevo mensaje para el caso

        Escenario: usuario final responde un mensaje normal de whatsapp enviado desde salientes 
            Dado que un agente envio un mensaje normal de whatsapp desde salientes
            Y el mensaje inicio el caso 12123
            Cuando el usuario final responde
            Y el mensaje ingrese al sistema
            Entonces el mismo se debe encontrar en el caso 12123
                
    Regla: si el usuario se contacto hace mas de 24hs no se crear un nuevo caso con mensaje normal
        
        Escenario: agente busca a un usuario que se contacto hace mas de 24hs
        este escenario esta cubierto en @tc:6004
            Dado que un usuario se contacto el dia de ayer a las 13hs con el servicio "whatsapp 2014"
            Y el ultimo caso del usuario se cerro
            Cuando un agente selecciona el servicio "whatsapp 2014" desde salientes el día de hoy a las 17hs
            Y escribe el telefono del usuario
            Entonces no podra crear un caso nuevo enviandole un mensaje normal

    Regla: si el usuario tiene un caso abierto no se puede crear un nuevo caso
        
        Escenario: usuario tiene un caso abierto con un servicio
            Dado que un usuario tiene un caso abierto con la linea "whatsapp 2014"
            Cuando un agente selecciona el servicio desde salientes
            Y escribe el telefono del usuario
            Entonces no podra crear un caso nuevo enviandole un mensaje normal

        Escenario: usuario tiene caso abierto con un servicio y agente crea un nuevo caso desde servicio en donde no hay un caso abierto
            Dado que un usuario tiene un caso abierto con la linea "whatsapp 2014"
            Y tiene un caso cerrado con el servicio "whatsapp 5930"
            Y la ultima interaccion con el servicio "whatsapp 5930" fue a las 13hs
            Cuando un agente selecciona el servicio "whatsapp 5930" desde salientes a las 17hs
            Y escribe el telefono del usuario
            Entonces podra crear un caso nuevo enviandole un mensaje normal

    Regla: cuando usuario mande un mensaje de respuesta se debe agrupar al nuevo caso
        
        Escenario: usuario responde el mensaje enviado desde salientes
            Dado que un agente genero el caso "32402" al enviar un mensaje normal desde salientes
            Cuando el usuario final responda dicho mensaje
            Entonces el entrante del usuario debe aparecer en la plataforma dentro del caso "32402"

    Regla: algunos ambientes no van a tener la opcion de enviar HSM  
        
        Escenario: se muestra el servicio de whatsapp en salientes a pesar de no tener habilitada plantillas
            Dado que el servicio "whatsapp 5930" tiene deshabilitada la opcion <@opcionDeServicio>
            Cuando un agente ingresa al modulo de salientes de whatsapp
            Entonces debe de poder ver de todas formas la linea "whatsapp 5930"

            Ejemplos:
                | @opcionDeServicio                                   |
                | Permitir uso de Plantillas de Mensaje               |
                | Permitir a los agentes enviar Plantillas de Mensaje |
        
        Escenario: se muestra el servicio de whatsapp en salientes a pesar de que ninguna plantilla tiene permiso para agentes
            Dado que el servicio "whatsapp 5930" tiene habilitados los permisos "Permitir uso de Plantillas de Mensaje" y "Permitir a los agentes enviar Plantillas de Mensaje"
            Pero ninguna de sus plantillas posee permiso de uso en agente
            Cuando un agente ingresa al modulo de salientes de whatsapp
            Entonces debe de poder ver de todas formas la linea "whatsapp 5930"