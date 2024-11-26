#language: es
Característica: Información del servicio en el widget
	Como agente de AXP, cuando recibo un mensaje asignado
	Quiero ver la información del servicio: Nombre de servicio, Tipo de servicio y Logo del servicio,
	Para saber de donde proviene el mensaje


Regla: Un agente puede ver en el widget del mensaje la información del servicio

	@tc:9687
	Escenario: Se visualiza los datos del servicio en el widget
		Exploratorio: probar con todos los servicios disponibles
		Dado que un agente recibe un mensaje del servicio de whatsapp 'Demo Avaya'
		Cuando visualiza la informacion del widget
		Entonces debera ver la siguiente informacion del servicio:
			| dato               | informacion      |
			| tipo de servicio   | Whatsapp         |
			| nombre de servicio | Demo Avaya       |
			| logo del servicio  | logo de whatsapp |