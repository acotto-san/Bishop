#language: es
Característica: variable para consultar estado de colas en tiempo real

	Como Administrador del sistema
	Quiero Que la variable compartir agentes conectados por cola devuelva las cantidades discriminadas por cola
	Para Identificar individualmente la cantidad de agentes conectada por cola

	En la configuración del servicio se puede configurar las colas que van a compartir los mensajes encolados y los agentes conectados.

	Exploratorio: evaluar el tiempo real, transferir mensajes, desconectar y conectar agentes e ir imprimiendo la variable

Regla: Se visualiza la nueva variable de sistema en el flujo y se pauede usar para manipular la data

	@tc:9785
	Escenario: se visualiza la variable queueConnectionAndMessagesData
		Dado un implementador que trabaja en un flujo
		Cuando va a la seccion de variables
		Entonces encuentra la variable queueConnectionAndMessagesData y su descripcion
	
	@tc:9786
	Escenario: se imprime la variable en una pieza mensaje
		Dado un implementador que trabaja en un flujo
		Cuando escribe la variable queueConnectionAndMessagesData en una pieza mensaje
		Entonces queda seleccionada correctamente
		Y el bot imprime sus valores

	@tc:9787
	Escenario: se usa la variable para evaluar una condicion
		Dado un implementador que trabaja en un flujo
		Cuando utiliza la variable queueConnectionAndMessagesData en una pieza como Elementos de un array
		Entonces puede establecer condiciones sobre los datos de esa variable

Regla: El comportamiento de la variable impacta solo sobre canales de tipo privado que posean un BOT asociado

	@tc:9788 
	Esquema del escenario: una interacción que no sea con el bot no invoca los datos de la variable
		Dado que un usuario interactua con <interaccion>
		Cuando se realizan los intercambios de mensaje
		Entonces en ningun momento se imprime la variable 

		Ejemplos:
		|interaccion  |
		|agente       |
		|canal publico|

Regla: la variable devuelve el dato del id y el nombre de las colas compartidas en el servicio
	
	@tc:9789
	Escenario: se devuelve el nombre y el id de dos colas compartidas en el servicio
		Dado que un servicio tiene configurado Compartir mensajes encolados de la cola A
		Y tiene configurado Compartir agentes conectados de la cola B
		Cuando se imprima la variable queueConnectionAndMessagesData
		Entonces en el array debera verse los datos del id y nombre de las colas: A y B

	@tc:9790
	Escenario: el caso se deriva a otra cola por clave de derivación
		Dado que un servicio tiene configurado Compartir mensajes encolados de la cola A
		Y tiene configurado Compartir agentes conectados de la cola B
		Cuando un mensaje se deriva por clave a la cola BBB
		Y se imprime la variable queueConnectionAndMessagesData
		Entonces en el array debera verse los datos del id y nombre de las colas: A y B

	@tc:9791
	Escenario: se comparten todas las colas
		Dado que un servicio tiene configurado Compartir todas las colas 
		Cuando se imprime la variable queueConnectionAndMessagesData
		Entonces en el array debera verse los datos del id y nombre de todas las colas

Regla: Un agente está conectado desde que se loguea, pasa por distintos estados hasta que se desconecta. 
	
	@tc:9792
	Esquema del escenario: Se contabiliza un agente conectado
		Dado que un servicio tiene configurado Compartir agentes conectados de la cola B
		Y en la cola B hay 1 agente en estado <estado>
		Cuando se imprime la variable queueConnectionAndMessagesData
		Entonces en el array debera contabilizarse 1 agente disponible

		Ejemplos: 
		| estado     |
		| auxiliar   |
		| login      |
		| disponible |
		| trabajando |

	@tc:9793 
	Escenario: No contabiliza un agente en estado no conectado
		Dado que un servicio tiene configurado Compartir agentes conectados de la cola B
		Y un agente de la cola B se encuentra en estado desconectado
		Cuando se imprime la variable queueConnectionAndMessagesData
		Entonces en la cola B no se contabilizara ningun agente disponible


#	@tc:9794
#	Esquema del escenario: No contabiliza a un agente trabajando con slots ocupados
#		Dado que un servicio tiene configurado Compartir agentes conectados de la cola B
#		Y un agente de la cola B se encuentra en estado trabajando con los slots ocupados
#		Cuando se imprime la variable queueConnectionAndMessagesData
#		Entonces en la cola B no se contabilizara ningun agente disponible
#
#		#este escenario no aplica ya que se cambió la definición

	@tc:9795
	Esquema del escenario: un agente está asignado a dos colas
		Dado que un servicio tiene configurado Compartir agentes conectados de la cola B y C
		Y un agente esta asignado a la cola B y C
		Cuando ese agente se encuentra disponible
		Y se imprime la variable queueConnectionAndMessagesData
		Entonces en ambas colas se contabilizara 1 agente disponible


Regla: La variable devuelve la cantidad de mensajes encolados de las colas compartidas en ese servicio

	@tc:9796
	Esquema del escenario: la variable devuelve la cantidad de mensajes encolados hay en la cola
		Dado que un servicio tiene configurado Compartir mensajes encolados de la cola A y B 
		Y la cola default es la C
		Cuando los mensajes encolados son los siguientes:
				|cola|cantidad encolados|
				|A   | 0                |
				|B   | 4                |
				|C   | 10               |
		Entonces en el array que devuelve la variable deberan aparecer correctamente la cantidad de mensajes encolados

Regla: La variable devuelve Null si no se comparten agentes o mensajes encolados de esa cola
	
	@tc:9816 
	Esquema del escenario: aparece null en el elemento no compartido
		Dado que un servicio tiene configurado Compartir <elemento a compartir> de la cola A
		Y tiene configurado  Compartir <elemento a compartir 2> solo la Cola B
		Cuando se imprime la variable queueConnectionAndMessagesData
		Entonces en la data de la cola A el campo <campo> debera ser Null

		Ejemplos: 
		| elemento a compartir | elemento a compartir 2 | campo            |
		| mensajes encolados   | agentes conectados     | connectedAgents  |
		| agentes conectados   | mensajes encolados     | enqueuedMessages |