#language: es 
@us:6539
Característica: Ejecucion de las acciones automaticas
	Como administrador puedo configurar acciones automaticas
	Para ejecutar diferentes acciones luego del vencimiento de un tiempo

	Regla de negocio: Dentro de "responder automaticamente" y "notificar al canal chat" se puede usar el comodin @@POSMSGCOLA@@

		@tc:8599
		Escenario: Mensaje vence el timer y se envia mensaje con el comodin de posicion en cola
			Dado un mensaje que vencio su timer así que se ejecutara la accion mensaje saliente
			Cuando se reemplace el comodin @@POSMSGCOLA@@ 
			Y el mensaje esta posicionado en la pos nro 5
			Entonces se reemplaza por 5

		@tc:8600
		Escenario: Mensaje VIM vence el timer y se envia mensaje con el comodin de posicion en cola
			Dado un mensaje que vencio su timer así que se ejecutara la accion mensaje saliente
			Y el mensaje es el único VIM por lo tanto el proximo a atenderse
			Cuando se reemplace el comodin @@POSMSGCOLA@@ 
			Y el mensaje esta posicionado en la pos nro 5
			Entonces se reemplaza por 5

		@tc:8601
		Escenario: Mensaje reservado vence el timer y se envia mensaje con el comodin de posicion en cola
			Dado un mensaje que vencio su timer así que se ejecutara la accion mensaje saliente
			Y la cola tiene un VIM
			Y el mensaje es el único RESERVADO por lo tanto el segundo en asignarse
			Cuando se reemplace el comodin @@POSMSGCOLA@@ 
			Y el mensaje esta posicionado en la pos nro 5
			Entonces se reemplaza por 5

	Regla de negocio: Dentro de "responder automaticamente" y "notificar al canal chat" se puede usar el comodin @@EWT@@

		@tc:8602
		Escenario: Entrante vence el timer y se envia mensaje con el comodin de EWT
			Dado un mensaje que vencio su timer así que se ejecutara la accion mensaje saliente
			Y la cola donde se encuentra el mensaje posee 120 segundos de EWT
			Cuando se reemplace el comodin @@EWT@@ 
			Entonces se reemplaza por "00:02:00"
		
		@tc:8603
		Escenario: Se responde al usuario con el texto alternativo 1 del comodin
			Dado un mensaje que vencio su timer así que se ejecutara la accion mensaje saliente
			Y dado que no hay agentes disponibles en la cola
			Cuando el sistema intente utilizar el comodin @@EWT@@
			Entonces se desviara a utilizar el mensaje alternativo 1

		@tc:8604
		Escenario: Se responde al usuario con el texto alternativo 2 del comodin
			Dado un mensaje vencio su timer así que se ejecutara la accion mensaje saliente
			Y la cola no posee un valor de EWT
			Cuando el sistema intente utilizar el comodin @@EWT@@
			Entonces se desviara a utilizar el mensaje alternativo 2

	Regla de negocio: El vencimiento del timer ejecuta una accion
		
		@tc:8605
		Escenario: Se ejecuta la accion configurada
			Dado que en acciones automaticas tiene configurado como accion <opciones>
			Y que hay un mensaje encolado
			Cuando venza el timer
			Entonces se debera <opciones>

			Ejemplos:
				| opciones                   |
				| Mover a cola               |
				| Responder automaticamente  |
				| Notificar al canal de chat |
				| Etiquetar                  |

		@tc:8606
		Escenario: se ejecuta la accion configurada en una segunda cola
			Dado un mensaje el cual fue respondido por una accion automatica en Cola A
			Cuando sea transferido a una Cola B con acciones automaticas
			Entonces dicho mensaje podra ser alcanzado por el vencimiento de acciones automaticas de Cola B

	Regla de negocio: Se puede configurar que la accion automática se ejecute al mismo tiempo que el encolamiento
		
		@tc:8615
		Escenario: La accion automatica se ejecuta apenas se encola el mensaje
			Dado que la Cola A tiene configurada la primer accion automatica en 0 segundos
			Cuando un mensaje se encole dicha cola
			Entonces la accion debe ocurrir en el mismo instante que es encolado

	Regla de negocio: El timer se inicia cuando se encola un mensaje
		
		@tc:8607
		Escenario: Empieza a correr el timer al encolarse el mensaje
			Dada una cola que posee habilitado acciones automaticas
			Cuando un mensaje se encole
			Entonces el timer de acciones automaticas comenzara a correr para dicho mensaje

		@tc:8608
		Escenario: Empieza a correr el timer nuevamente al mensaje ser movido de cola
			Dado un mensaje que posee un timer de acciones automaticas de Cola A ya contabilizando
			Cuando el mensaje sea transferido a una Cola B
			Entonces entonces el mensaje dejara de contar tiempo para el timer de Cola A
			Y comenzara a contabilizar el timer de Cola B

		@tc:8614
		Escenario: Al transferirse el mensaje de cola por acciones automaticas empieza a correr el timer de la siguiente cola
			Dado que Cola A y Cola B tienen timers configurados
			Y que un mensaje esta en Cola A con su timer corriendo
			Cuando se agote el timer 
			Y sea transferido a la Cola B por acción automática
			Entonces el timer de Cola B habrá comenzado a correr

	Regla de negocio: El timer se puede detener si el mensaje deja de estar en la cola

		@tc:8609
		Escenario: El timer se detiene por la asignacion de un mensaje
			Dado un mensaje que posee el timer de acciones automaticas contabilizando
			Cuando sea asignado a un agente
			Entonces se detendra el timer

		@tc:8610
		Escenario: Mensaje es agrupado por otro y el nuevo inicia su propio timer
			Dado un mensaje que posee el timer de acciones automaticas contabilizando
			Cuando es agrupado por un nuevo mensaje entrante
			Entonces se detiene el timer del mensaje 1
			E inicia el timer del mensaje 2

		@tc:8611
		Escenario: El timer se detiene al descartar el mensaje
			Dado un mensaje que posee el timer de acciones automaticas contabilizando
			Cuando es descartado de la cola
			Entonces se detiene el timer

	Regla de negocio: Una acción puede terminar con el temporizador nro 2
		
		@tc:8612
		Escenario: Mensaje cambia de cola y ya no es alcanzado por la accion automatica de la primer cola
			Dado Un usuario envia mensaje 
			E inicia el timer en la COLA A
			Cuando el supervisor mueve el mensaje a la COLA B
			Entonces no se deben realizar acciones posteriores para ese mensaje en la COLA A

		@tc:8613
		Escenario: Acciones automaticas no se ejecutan si se descarta el mensaje antes de vencer el timer
			Cuando Un usuario envia un mensaje
			Y se encola 
			Cuando el supervisor descarte el mensaje
			Entonces no deberia realizar acciones posteriores que hayan configuradas en la cola
