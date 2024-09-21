#language: es
Característica: Notificación Visual de caso nuevo
	Como agente
	Quiero recibir una alerta visual (efecto de parpadeo al boton) al momento de recibir un msj nuevo y ese mensaje sea un caso nuevo
	Para darse cuenta facilmente si tengo que darle prioridad.
    
    Exploratorio:
    - Verificar la alerta visual cuando la web no este activa / en segundo plano / completamente tapada.

    Regla: Cuando un caso no fue leido por el agente deberia activarse la notificacion visual.

        @tc:5766
	    Esquema del escenario: Notificacion visual en cada vista de la web del agente
		    Dado un agente que se encuentra en estado disponible
            Y tiene apagada la configuracion de autoleido de mensajes
            Y se encuentra en <vista de la web>
		    Cuando recibe un mensaje de un caso nuevo
		    Entonces el boton de ese mensaje deberia parpadear.
    
            Ejemplos:
                | vista de la web                    |
                | mensajes salientes                 |
                | buscar casos                       |
                | una conversacion seleccionada      |
                | mensajes asignados - casilla vacia |


        @tc:5767
	    Escenario: Mensaje nuevo de caso derivado por yFlow.
		    Dado un usuario que es derivado a un operador por un flujo de yFlow
		    Cuando el agente recibe el mensaje derivado por el bot
		    Entonces el boton de ese mensaje deberia parpadear.

	    @tc:5768
	    Escenario: Mensaje nuevo de usuario con casos previamente cerrados.
		    Dado un agente que se encuentra en estado disponible
            Y tiene uno o mas mensajes asignados
		    Y cierra un caso 
		    Cuando recibe un mensaje de ese mismo usuario
		    Y se crea un caso nuevo
		    Entonces el boton de ese mensaje deberia parpadear. 

        @tc:5769
        Escenario: Segundo mensaje de un caso encolado.
            Dado que un usuario escribe un mensaje iniciando el caso 1023 
            Y el caso queda encolado sin asignarse
            Y el usuario escribe un nuevo mensaje que agrupa el mensaje previamente encolado
            Cuando el agente recibe la asignacion del caso
            Entonces el boton del caso deberia parpadear.
    
        @tc:5770
        Esquema del escenario: Segundo mensaje de un caso respondido por sistema.
            Dado un usuario que escribe generando el caso 1023 
            Y el mensaje es respondido automaticamente por <configuracion por sistema>
            Cuando el mensaje es asignado a un agente
            Entonces el boton del caso 1023 no deberia parpadear.

            Ejemplos:
                | configuracion por sistema |
                | filtro                    |
                | SL                        | 

    Regla de negocio: Los mensajes que ya fueron visualizados por un agente deben alertar 

        @tc:5771  
        Escenario: Un agente se reloguea y se activa la alerta visual de mensajes no leidos
            Dado que un agente tiene mensajes sin responder
            Y se desloguea
            Cuando se reloguea
            Entonces los mensajes que tenia previamente deberian parpadear 

        @tc:5787
        Escenario: Un agente recibe un caso que fue leido y se activa la alerta visual de mensajes no leidos
            Dado que al agente poochie se le asigna un mensaje que inicia un caso
            Y el agente <accion de retorno> al mensaje
            Cuando a otro agente se le asigna el caso
            Entonces el boton del caso deberia parpadear

            Ejemplos: 
                | accion de retorno  |
                | devuelve a la cola |
                | transfiere de cola |

        @tc:5788
        Escenario: Un agente recibe un caso que tuvo un descarte como accion del primer mensaje y se activa la alerta visual de mensajes no leidos
            Dado que al agente poochie se le asigna un mensaje que inicia un caso
            Y el agente descarta el mensaje
            Cuando el usuario escribe un segundo mensaje del caso
            Y este es asignado a un nuevo agente
            Entonces el boton del caso deberia parpadear

        @tc:5792
        Escenario: Un agente recibe un caso que fue transferido y respondido por otro agente
            Dado que al agente poochie se le asigna un mensaje que inicia un caso
            Y el agente transfiere el mensaje a otra cola
            Y incluye un mensaje para el usuario al transferir
            Cuando a otro agente se le asigna el caso
            Entonces el boton del caso no deberia parpadear


