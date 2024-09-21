#language: es
Característica:	Encolamiento segun prioridad de mensajes
	
	Antecedentes: 
		Dado que en la cola "Cola AAA" se encuentran logueados los siguientes usuarios:
			| nombre agente | estado     | cantidad slots de asignacion | slots ocupados |
			| Adrian        | auxiliar	 | 1                            | 0              |
			| Ana           | auxiliar   | 2                            | 0              |

	@tc:5479
	Esquema del escenario: cola asigna segun orden de prioridad
		La cola asigna por prioridad, estas siendo:
		1. Mensajes VIM
		2. Mensajes reservados
		3. Mensajes normales que se encolaron primero
		Dado que la cola posee los siguientes mensajes 
			| orden de ingreso | id de mensaje | status del mensaje |
			| 1                | 111           | normal             |
			| 2                | 222           | <@status222>       |
			| 3                | 333           | <@status333>       |
		Cuando <@agente> cambia su estado a disponible
		Entonces la cola le asignara el/los mensaje/ con id <@mensajes>

		Ejemplos: 
			| @status222         | @status333 | @agente | @mensajes |
			| normal             | normal     | Adrian  | 111       |
			| normal             | normal     | Ana     | 111 y 222 |
			| reservado a Adrian | normal     | Adrian  | 222       |
			| reservado a Adrian | normal     | Ana     | 111 y 333 |
			| reservado a Ana    | normal     | Ana     | 222 y 111 |
			| reservado a Adrian | VIM        | Adrian  | 333       |
#
#	Regla de negocio: los mensajes sin reserva y que no son VIM se asignan por orden de ingreso a la cola
#
#		Escenario: agente libera un slot y la cola asigna el primero en encolarse
#			Dado que la cola posee los siguientes mensajes 
#				| orden de ingreso | id de mensaje | status del mensaje |
#				| 1                | 111           | normal             |
#				| 2                | 222           | normal             |
#				| 3                | 333           | normal             |
#			Cuando Adrian cambia su estado a disponible
#			Entonces la cola le asignara el mensaje con id "111"
#
#		Escenario: cola asigna grupalmente los primeros en encolarse
#			Dado que la cola posee los siguientes mensajes 
#				| orden de ingreso | id de mensaje | status del mensaje |
#				| 1                | 111           | normal             |
#				| 2                | 222           | normal             |
#				| 3                | 333           | normal             |
#			Cuando Ana cambia su estado a disponible
#			Entonces la cola le asignara los mensajes con id "111" y "222"
#
#	Regla de negocio: los mensajes reservados tienen mayor prioridad que los normales
#
#		Escenario: agente libera un slot y la cola da prioridad a un mensaje reservado
#			Dado que la cola posee los siguientes mensajes 
#				| orden de ingreso | id de mensaje | status del mensaje |
#				| 1                | 111           | normal             |
#				| 2                | 222           | reservado a Adrian |
#				| 3                | 333           | normal             |
#			Cuando Adrian cambia su estado a disponible
#			Entonces la cola le asignara el mensaje con id "222"
#
#		Escenario: cola no le asigna mensaje reservado a un agente disponible que no posee la reserva
#			Dado que la cola posee los siguientes mensajes 
#				| orden de ingreso | id de mensaje | status del mensaje |
#				| 1                | 111           | normal             |
#				| 2                | 222           | reservado a Adrian |
#				| 3                | 333           | normal             |
#			Cuando Ana cambia su estado a disponible
#			Entonces la cola le asignara los mensajes con id "111" y "333"
#
#		Escenario: cola asigna los reservados y luego los que se encolaron primero
#			Dado que la cola posee los siguientes mensajes 
#				| orden de ingreso | id de mensaje | status del mensaje |
#				| 1                | 111           | normal             |
#				| 2                | 222           | reservado a Ana    |
#				| 3                | 333           | normal             |
#			Cuando Ana cambia su estado a disponible
#			Entonces la cola le asignara los mensajes con id "222" y "111"
#
#	Regla de negocio: los mensajes VIM tienen mayor prioridad que todos
#
#		Escenario: agente libera un slot y la cola da prioridad a un mensaje VIM
#			Dado que la cola posee los siguientes mensajes 
#				| orden de ingreso | id de mensaje | status del mensaje |
#				| 1                | 111           | normal             |
#				| 2                | 222           | reservado a Adrian |
#				| 3                | 333           | VIM                |
#			Cuando Adrian cambia su estado a disponible
#			Entonces la cola le asignara el mensaje con id "333"
#

