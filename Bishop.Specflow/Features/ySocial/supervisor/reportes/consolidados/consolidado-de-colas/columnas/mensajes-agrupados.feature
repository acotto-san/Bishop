#language:es
Característica: tener una columna que diga cuantos agrupamientos ocurrieron 

	Escenario: Ocurre un agrupamiento mientras el mensaje A esta esperando en la cola
		Dado que mensaje A esta encolado esperando a un agente
		Cuando ingresa un mensaje B 
		Y agrupa al A
		Entonces solo quedara encolado el mensaje B
		Y la columna del consolidado sumara un +1

	Escenario: Ocurre un agrupamiento mientras el mensaje A esta en el agente
		Dado que mensaje A asignado a un agente
		Cuando ingresa un mensaje B y le es asignado al agente 
		Y agrupa al A en el agente
		Entonces solo el B quedara con estado Asignado
		Y la columna del consolidado sumara un +1
		Y tambien suma +1 en la columna "Mensajes agrupados por agente"

	Escenario: ocurre agrupamiento de mensajes en ambos segmentos
		Dado que un mensaje A esta asignado a un agente
		Y un mensaje B esta en la cola esperando a que el agente vea la conversacion
		Cuando un mensaje C ingresa a la cola y agrupa al B
		Y el agente ve la conversacion
		Entonces el mensaje C agrupa al A
		Y las columnas del consolidado diran
			| mensajes agrupados | mensajes agrupados por agente |
			| 2                  | 1                             |
