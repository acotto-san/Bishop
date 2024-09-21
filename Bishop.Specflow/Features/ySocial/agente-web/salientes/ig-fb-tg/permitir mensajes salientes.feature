#language: es
Característica: permitir mensajes salientes 
    Como agente
    Quiero cargar saliente para los demás canales mientras el canal lo permita, 
    es decir mientras esté la ventana activa del canal, se debe permitir el envio 
    de mensajes saliente sobre un caso cerrado.

    Se agregan los canales de telegram, messenger e instagram.
    Messenger e instagram tienen la misma ventana de 24hs como WhatsApp.

    Regla: cuando un agente logra enviar el mensaje saliente este crea un nuevo caso
        
        @tc:5998
        Esquema del escenario: agente crea un nuevo caso con un mensaje saliente 
            Dado que un agente redacta un mensaje de <tipo de canal> desde salientes 
            Cuando envia el mensaje
            Entonces se crea un nuevo mensaje para el caso
    
            Ejemplos:
            | tipo de canal         |
            | twitter privado v 1.1 |
            | twitter publico v 1.1 |
            | twitter privado v 2   |
            | twitter publico v 2   |
            | ig                    |
            | messenger             |
            | fb                    |

    Regla: si el usuario tiene un caso abierto no se puede crear un nuevo caso
        
        @tc:5999
        Esquema del escenario: usuario tiene un caso abierto con un servicio
            Dado que un usuario <tipo de canal>  tiene un caso abierto con un servicio de un agente
            Cuando un agente selecciona el servicio desde salientes
            Y le escribe a ese usuario
            Entonces no podra crear un caso nuevo enviandole un mensaje normal

            Ejemplos:
            | tipo de canal |
            | twitter v 1.1 |
            | twitter v 2   |
            | ig            |
            | messenger     |
            | fb            |

        @tc:6000
        Escenario: usuario tiene caso abierto con un servicio y agente crea un nuevo caso desde servicio en donde no hay un caso abierto
            Dado que un usuario tiene un caso abierto con el servicio "QA - Cat´s clothes - Instagram"
            Y tiene un caso cerrado con el servicio "QA - Itchy&Scratchy Instagram"
            Y la ultima interaccion con el servicio "QA - Itchy&Scratchy Instagram" fue a las 13hs
            Cuando un agente selecciona el servicio "QA - Itchy&Scratchy Instagram" desde salientes a las 17hs
            Y escribe al ig de ese usuario 
            Entonces podra crear un caso nuevo enviandole un mensaje saliente

    Regla: se puede acceder a la redaccion del mensaje si la interaccion entre el servicio y el usuario fue dentro de las ultimas 24hs, en Ig y FB messenger.
        
        @tc:6001
        Esquema del escenario: agente intenta redactar un mensaje saliente normal dentro de la ventana de 24hs desde la ultima interaccion del usuario
            Dado que un usuario se contacto el dia de hoy a las 13hs con el servicio <tipo de canal>
            Y el ultimo caso del usuario se cerro
            Cuando un agente selecciona el mismo servicio desde salientes a las 17hs
            Y escribe un mensaje a ese mismo usuario
            Entonces podra crear un caso nuevo enviandole un mensaje normal

            Ejemplos:
            | tipo de canal | 
            | ig            | 
            | messenger     | 
            | fb            |

        @tc:6002
        Escenario: agente intenta redactar un mensaje saliente normal desde un servicio que no tuvo comunicacion con el usuario
            Dado que un usuario se contacto el dia de hoy a las 13hs con el servicio "QA - Itchy&Scratchy Messenger"
            Y el ultimo caso del usuario se cerro
            Y el usuario nunca se contacto con el servicio "QA - Mundorata"
            Cuando un agente selecciona el servicio "QA - Mundorata" desde salientes a las 17hs
            Y le escribe al usuario
            Entonces no podra crear un caso nuevo enviandole un mensaje saliente

        @tc:6003
        Esquema del escenario: usuario final responde un mensaje enviado desde salientes 
            Dado que un agente envio un mensaje normal de <tipo de canal> desde salientes
            Y el mensaje inicio el caso 12123
            Cuando el usuario final responde
            Y el mensaje ingrese al sistema
            Entonces el mismo se debe encontrar en el caso 12123
            
            Ejemplos:
            | tipo de canal | 
            | ig            | 
            | messenger     | 
            | fb            |
                
    Regla: si el usuario se contacto hace mas de 24hs no se crea un nuevo caso 
        
        @tc:6004
        Esquema del escenario: agente busca a un usuario que se contacto hace mas de 24hs
            Dado el ultimo contacto de un usuario con un servicio de <tipo de servicio> fue el dia de ayer a las 13hs
            Y el caso en cuestion se encuentra cerrado
            Cuando un agente selecciona desde salientes el mismo servicio el día de hoy a las 17hs
            Y busca al usuario 
            Entonces no podra crear un caso nuevo enviandole un mensaje 
            Y aparecera una alerta que dira que pasaron las 24hs de ventana
            
            Ejemplos:
            | tipo de servicio |
            | instagram        |
            | messenger        |
            | telegram         |
            | whatsapp         |

    Regla: si el usuario nunca se contacto, no se podra mandar saliente, excepto en twitter
        
        @tc:6005
        Escenario: agente envia saliente de twitter a un usuario que nunca se contacto
            Dado que un agente redacta un mensaje saliente de twitter 
            Cuando busca al usuario "Romi"
            Entonces le debe aparecer el cartel: "Desde aquí se puede redactar un tweet y enviarlo a un usuario que nunca se haya contactado con el sistema"
            Y debe poder enviar un mensaje publico y privado

        @tc:6006
        Esquema del escenario: agente intenta realizar saliente desde servicio que no tuvo contacto con usuario
            Dado un agente que selecciono en mensajes salientes un servicio de tipo <tipo de servicio>
            Y dado que el usuario "Jeremy" se contacto con un servicio de ySocial pero no con el seleccionado por el agente
            Cuando el agente busca al usuario para realizar el saliente
            Entonces se le informara que el usuario nunca se ha contactado
            Y no se le habilitara el formulario para realizar el saliente

            Ejemplos: 
                | tipo de servicio |
                | messenger        |
                | instragram       |
                | telegram         |
    
    Regla: cuando usuario mande un mensaje de respuesta se debe agrupar al nuevo caso
        
        @tc:6007
        Escenario: usuario responde el mensaje enviado desde salientes
            Dado que un agente genero el caso "32402" al enviar un mensaje normal desde salientes
            Cuando el usuario final responda dicho mensaje
            Entonces el entrante del usuario debe aparecer en la plataforma dentro del caso "32402"

    Regla: se muestran las opciones de todos los tipos de salientes, a pesar de no tener servicios activos en todos los canales
        
        @tc:6008
        Escenario: se muestra la opcion de saliente de Instagram a pesar de no poseer servicios activos en ese canal
            Dado que el agente tiene habilitada todos los canales para enviar salientes en su configuracion
            Y que en el ambiente no hay un servicio de instagram activo
            Cuando un agente ingresa al modulo de salientes de instagram
            Entonces no debe poder ver ningun servicio a utilizar
            Y no debe poder enviar mensajes

    Regla: los servicios a utilizar dependen de las restricciones en la configuracion de salientes del agente
        
        @tc:6009
        Escenario: solo se muestran los servicios restringidos en la configuracion del agente cuando se envian mensajes salientes 
            Dado que un agente posee 12 servicios de FB Messenger
            Y tiene configurado en mensajes salientes una restriccion de los servicios de QA - Itchy&Scratchy Messenger y QA - Mundorata
            Cuando un agente ingresa al modulo de salientes de FB Messenger
            Entonces debe de poder ver solo los servicios de QA - Itchy&Scratchy Messenger y QA - Mundorata a utilizar

    Regla: un agente puede tener cambiar a un estado auxiliar cuando envia salientes. 
        
        @tc:6011
        Escenario: agente envia saliente y limpia el formulario
        Dado que un agente tiene en su configuracion cambiar a un motivo auxiliar al mandar saliente
        Cuando redacta un saliente 
        Y selecciona enviar formulario y limpiar
        Entonces debe seguir en estado auxiliar
        Y debe tener el formulario limpio para seguir mandando salientes

        @tc:6012
        Escenario: agente envia y vuelve al estado previo
        Dado que un agente tiene en su configuracion cambiar a un motivo auxiliar al mandar saliente
        Cuando redacta un saliente 
        Y selecciona enviar y volver al estado previo
        Entonces debe enviarse el saliente
        Y volver al estado previo

        @tc:6013
        Escenario: agente cierra y vuelve al estado previo
        Dado que un agente tiene en su configuracion cambiar a un motivo auxiliar al mandar saliente
        Cuando redacta un saliente 
        Y selecciona cerrar y volver al estado previo
        Entonces debe salir del formulario sin enviar el mensaje
        Y volver al estado previo

    Regla: Al buscar un usuario para enviar un mensaje saliente la busqueda debe aceptar nombres con espacio

        @tc:7666
        Esquema del escenario: Agente busca a un usuario para enviar mensaje saliente
	        Dado un agente enviando un mensaje saliente de <Red> al usuario "Pipo Pepe"
	        Cuando termine de redactar el mensaje 
	        Entonces debera enviar el mensaje correctamente

        Ejemplos:
        | Red       |
        | Instagram |
        | Facebook  |
        | Telegram  |