#language: es
Característica: No asignar al mismo agente luego de una devolucion a la cola
	Como agente 
	Quiero que no se me asigne nuevamente un mensaje devuelto a la cola
	Para que no se me vuelva a asignar un mensaje que no voy a gestionar

	Regla: Si el agente que devuelve es el unico agente en la cola no se se le asignara hasta que pasen los minutos configurados	

		@tc:pendiente
		Escenario: No asignar al mismo agente luego de una devolucion a la cola
			Dado que soy un agente
			Y la cola tiene configurado no asignar por 5 minutos un mensaje devuelto al mismo agente
			Cuando devuelvo un mensaje a la cola
			Y soy el unico agente en la misma
			Entonces el mensaje no se me asigna por 5 minutos
		
		@tc:pendiente	@deudatecnica
		Escenario: La devolucion a cola por el timer del agente ignora esta configuracion
			Dado que soy un agente con un mensaje de una cola 
			Y la cola no asigna por 5 minutos un mensaje devuelto al mismo 
			Cuando un mensaje se me desasigna por el timer de agente
			Y soy el unico agente en la cola
			Entonces la cola ignora la configuracion de no asignar por 5 minutos un mensaje devuelto al mismo agente
			Y me vuelve a asignar el mensaje