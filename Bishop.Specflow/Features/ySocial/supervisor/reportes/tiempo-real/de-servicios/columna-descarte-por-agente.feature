#language: es
Característica: Columna de mensajes descartados por agentes en un servicio
	Se desea tener en el reporte tiempo de tiempo real de servicios una columna para registrar cuantos 
	mensajes fueron descartados por accion del agente.

	Regla de negocio: La acumulación de movimientos es lo ocurrido durante el dia
		
		@tc:6718
		Escenario: La metrica registra solo los movimientos del dia
			Dado los siguientes descartes de un servicio
				| dia  | cantidad | autor  |
				| ayer | 3        | agente |
				| hoy  | 5        | agente |
			Entonces la columna de descartes por agentes en el reporte TR de colas mostrara 5

	Regla de negocio: Solo se consideran los descartes manuales realizados por el agente
		
		@tc:6719
		Escenario: Columna registra descarte en el agente
			debe aplicar a cualquier tipo de servicio (modo chat o no)
			Dado un agente que posee un caso asignado
			Y el caso solo posee un mensaje entrante
			Cuando descarta el mensaje
			Entonces la columna de descartes por agentes en el reporte TR de colas sumara +1

		@tc:6720
		Escenario: Columna ignora a mensaje agrupado cuando se descarta el mensaje que agrupa
			Dado un agente que que posee un mensaje asignado que agrupa a otro entrante
			Cuando descarta el mensaje
			Entonces la columna de descartes por agentes en el reporte TR de colas sumara +1

	Regla de negocio: Ciertos descartes no seran tenidos en cuenta
		
		@tc:6721
		Escenario: Columna no registra el descarte por agrupamiento en agente
			Dado que un mensaje se encuentra asignado a un agente
			Cuando ingrese un nuevo mensaje 
			Y el primero sea agrupado por el segundo
			Entonces la columna de descartes por agentes en el reporte TR de colas no registrara cambios

		@tc:6722
		Escenario: Columna no registra descartes por temporizador del usuario
			Dado que un mensaje se encuentra asignado a un agente
			Cuando el mensaje es descartado por agotar el temporizador del usuario
			Entonces la columna de descartes por agentes en el reporte TR de colas no registrara cambios
