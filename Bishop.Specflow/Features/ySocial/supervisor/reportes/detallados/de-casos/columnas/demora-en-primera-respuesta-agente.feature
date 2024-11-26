#language:es
Característica: Saber cuanto tiempo tardó el agente en responder el primer mensaje asignado

	Regla de negocio: Si la primer respuesta es el primer mensaje encolado se le extrae la diferencia entre la fecha de asignación y la fecha que el agente envia un mensaje saliente

		@tc:9752
		Escenario: Agente responde en modo normal el primer mensaje encolado
			Dado que a un agente le asignan el primer mensaje encolado del caso a las 12:51:17
			Cuando procede a responderlo a las 12:52:46 y se le desasigna
			Entonces la metrica dira la distancia entre la asignacion y la respuesta: 00:01:28

		@tc:9753
		Escenario: Agente agrega mensaje en modo chat al primer mensaje encolado
			Dado que a un agente le asignan el primer mensaje encolado del caso a las 12:31:06
			Cuando procede a agregar un mensaje saliente a las 12:31:18
			Y lo finaliza a las 12:50:00
			Entonces la metrica dira la distancia entre la asignacion y la respuesta: 00:00:12

		@tc:9754
		Escenario: El caso inicio por un saliente y la primer respuesta del agente cuenta
			Dado que un agente inicia un caso enviando un saliente a las 13:06:11
			Y el usuario final envia un mensaje que se le asigna al agente a las 13:08:58
			Cuando el agente responde a las 13:09:26
			Entonces la metrica dira la distancia entre la asignacion y la respuesta: 00:00:28

		@tc:9755
		Escenario: Metrica no funciona en chat
			Dado que un agente recibe un caso de chat
			Cuando responde por primera vez
			Entonces la metrica dira -sin datos-

	Regla de negocio: La metrica se computa a pesar de que el caso ya tenga mensajes salientes

		@tc:9756
		Escenario: El agente responde a un caso que tiene mensajes salientes del Bot
			Dado que a un agente le asignan a las 15:13:53 un caso que ya tiene respuestas de Bot
			Cuando el agente lo responde a las 15:19:31
			Entonces la metrica dira la distancia entre la asignacion y la respuesta: 00:05:38

		@tc:9757
		Escenario: El agente responde a un caso que tiene mensajes salientes del Supervisor
			Dado que a un agente le asignan a las 15:23:51 un caso que ya tiene respuestas de un supervisor
			Cuando el agente lo responde a las 15:24:05
			Entonces la metrica dira la distancia entre la asignacion y la respuesta: 00:00:14			

		@tc:9758
		Escenario: El agente responde a un caso que tiene mensajes salientes del sistema (SL/Filtro)
			Dado que a un agente le asignan a las 08:40:00 un caso que ya tiene respuestas de un Filtro
			Cuando el agente lo responde a las 08:40:30
			Entonces la metrica dira la distancia entre la asignacion y la respuesta: 00:00:30	

	Regla de negocio: El caso que se esta respondiendo puede haber tenido un agrupamiento

		@tc:9759
		Escenario: El agente esta respondiendo a un mensaje que agrupo a otro en la cola
            Dado que un mensaje esta en la cola y es agrupado por un nuevo entrante del caso a las 11:00:00
			Y al agente se le asigna el segundo mensaje a las 12:00:00
            Cuando el agente procede a responder el mensaje 12:10:00
			Entonces la metrica dira la distancia entre la asignacion y la respuesta: 00:10:00	

		@tc:9760
		Escenario: El agente esta respondiendo a un mensaje que agrupo a otro en su pantalla
            Dado que a un agente le asignaron el primer mensaje encolado del caso y luego se agrupo otro
                | asignacion 1er mensaje al agente | agrupamiento mensaje 2 en el agente |
                | 12:42:53                         | 12:46:34                            |
            Cuando el agente procede a responder el mensaje a las 12:48:03 (responde el 2 porque es el que esta en pantalla)
            Entonces la metrica dira la distancia entre la última asignación y la respuesta: 00:01:28

	Regla de negocio: El caso que se esta respondiendo puede haber tenido un descarte 

		@tc:9761
		Escenario: El agente esta respondiendo a un mensaje que le sigue a uno que descartó el mismo
			Dado que a un agente le asignaron el primer mensaje encolado del caso a las 11:20:00 y lo descartó
			Y el usuario envía un nuevo mensaje que le es asignado al agente a las 11:25:00
            Cuando el agente procede a responder el mensaje a las 11:30:00
			Entonces la metrica dira la distancia entre la ultima asignacion y la respuesta 00:05:00

		@tc:9762	
		Escenario:	El agente esta respondiendo a un mensaje que le sigue uno que descartó OTRO AGENTE
			Dado que un agente recibe la asignacion del primer mensaje encolado del caso y lo descarta a las 12:30:00
			Y a un segundo agente se le asigna el siguiente mensaje entrante a las 12:35:00
            Cuando el agente procede a responder el mensaje a las 11:40:00
			Entonces la metrica dira la distancia entre la asignacion del segundo mensaje al agente 2 y la respuesta 00:05:00

		@tc:9763
		Escenario: Se descarta mensaje que tuvo asignacion y el caso se cierra
			Dado que a un agente le asignaron el primer mensaje encolado del caso a las 11:20:00 y lo descartó
			Cuando el caso se cierra sin nuevos mensajes entrantes
			Entonces la metrica dira -sin datos-

	Regla de negocio: El caso que se esta respondiendo puede ya haber tenido una asignación previa

		@tc:9764
		Escenario: Agente responde a un caso que estuvo asignado a otro agente y se lo desasignaron (supervisor o timer)
			Dado que un agente tiene asignado el primer mensaje encolado de un caso que aún no tiene respuestas de agente
			Y el mensaje volvio a la cola por inactividad de agente y se asigno a otro agente
				| hora de retorno a la cola | hora asignacion agente 2 |
				| 10:20:00                  | 10:22:00                 |
            Cuando el agente procede a responder el mensaje a las 11:30:00
			Entonces la metrica dira la distancia entre la asignacion al agente 2 y la respuesta: 00:08:00

		@tc:9766
		Escenario: Agente responde a un caso que estuvo asignado a otro agente y lo transfirieron
			Dado que un agente transfiere a una cola el primer mensaje del caso encolado que no posee respuestas de agente
			Y en la segunda cola fue asignado a un agente a las 16:13:38
            Cuando el agente procede a responder el mensaje a las 16:13:49
			Entonces la metrica dira la distancia entre la asignacion al agente 2 y la respuesta: 00:00:11

    Regla de negocio: La primera respuesta de un caso puede no ser un mensaje normal de un agente

		@tc:9767
		Escenario: Agente agrega un mensaje de transferencia informandole al usuario que lo envia a otra cola

		@tc:9768
		Escenario: Agente genera la primer respuesta del caso con una plantilla HSM

		@tc:9769
		Escenario: Agente genera saliente a un caso que no tuvo asignacion
			Dado que un mensaje es el primero encolarse del caso 
			Y el mensaje es descartado en la cola sin haber tenido respuestas
			Cuando el agente genera una respuesta para el caso desde Buscar Casos
			Entonces la metrica dira -sin datos-

		@tc:9770
		Escenario: Agente genera saliente a un caso que no tuvo respuesta y si tuvo asignacion
			Dado que un agente recibe la asignacion del primer mensaje encolado del caso a las 12:20:00
			Y lo descarta a las 12:30:00
			Cuando un agente 2 procede a generar una respuesta para el caso desde Buscar Casos a las 12:40:00
			Entonces la metrica dira la distancia entre la primer asignación del caso y la respuesta desde Buscar Casos: 00:20:00