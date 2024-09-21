#language: es
Característica: Tener una columna que indique cuantos mensajes fueron asignados al agente desde la cola
	Como supervisor que analiza intervalos del consolidado de colas
	Quiero que haya  un conteo de cuantos mensajes fueron asignados desde la cola a agente
	Para poder comparar la fluctuacion de mensajes desde la cola a los agentes

	@tc:7747
	Escenario: Se registran cuantos mensajes la cola asigno
		Dado una cola que posee 10 mensajes
		Cuando los mensajes son asignados a agentes dentro de un intervalo
		Entonces para dicha cola el consolidado mostrara 10 en la columna de derivados a agentes
