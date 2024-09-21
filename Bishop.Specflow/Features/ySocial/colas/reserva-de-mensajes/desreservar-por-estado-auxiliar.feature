#language: es 
@us:4376
Característica: Desreserva un mensaje si el agente ingresa a un estado auxiliar que no admite reservas
	Se desea que si una cola posee estados auxiliares que no permiten reserva, entonces se les quite a los mensajes este estatus cuando su agente asignado ingrese a dicho estado auxiliar.

	Regla: la desreserva ocurre cuando el agente completa la transicion de estado al que no admita reserva
		
		@tc:4788
		Esquema del escenario: Agente ingresa a estado que no admite reservas y la cola le quita la misma a los mensajes
			Dado que en la cola los siguientes estados auxiliares poseen la siguiente config:
				| nombre estado aux | permite reserva |
				| estado aux X      | no              |
				| estado  aux Y     | si              |
			Y agente A esta en el estado <estadoPrevio>
			Y en la cola hay un mensaje reservado al agente A
			Cuando agente transiciona a "estado aux X"
			Entonces el mensaje de la cola debe dejar de tener la reserva

				Ejemplos:
				| estadoPrevio |
				| login        |
				| pend de aux  |
				| estado aux Y |