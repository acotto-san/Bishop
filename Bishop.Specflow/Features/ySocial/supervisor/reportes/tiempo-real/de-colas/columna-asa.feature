#language:es
Característica: Columna ASA en reporte tiempo real de colas
	Como supervisor
	Quiero una columna en el tiempo real de colas con el ASA diario de cada una
	Para poder ver el ASA de cada cola en tiempo real

	Composicion del ASA: en modo normal (tiempo en cola + sin leer + de lectura + de trabajo / cant de mensajes )
						 en modo chat (tiempo en cola + sin leer + de lectura / cant de mensajes )


	Regla de negocio: El ASA recolecta tiempos diferentes segun el modo del mensaje
		
		@tc:6727
		Escenario: Un mensaje de modo chat es valido para el ASA y recolecta la suma de tiempo en cola, tiempo sin leer y tiempo de lectura
			Este escenario no tiene en cuenta el tiempo de trabajo (que si aplica en modo normal)
			Dado que el mensaje de modo chat con id "205748" fue atendido por un agente
			Y recolecto los siguientes tiempos:
				| tiempo en cola | tiempo sin leer | tiempo de lectura |
				| 00:01:37,200   | 00:00:18,716    | 00:00:22,500      |
			Y el mensaje fue el unico gestionado en la cola
			Cuando el supervisor consulte el ASA de la cola	
			Entonces el ASA de la cola sera de 2 minutos y 18 segundos (tiempo en cola + sin leer + de lectura / cant de mensajes )

		@tc:6728
		Escenario: Un mensaje de modo normal es valido para el ASA y recolecta la suma de tiempo en cola, tiempo sin leer, tiempo de lectura y tiempo de trabajo
			Dado que el mensaje de modo normal con id "205750" fue respondido por un agente
			Y recolecto los siguientes tiempos:
				| tiempo en cola | tiempo sin leer | tiempo de lectura | tiempo de trabajo |
				| 00:00:25,070   | 00:00:20,792    | 00:00:20,780      | 00:00:19,792      |
			Y el mensaje fue el unico gestionado en la cola
			Cuando el supervisor consulte el ASA de la cola
			Entonces el ASA de la cola sera de 1 minuto y 26 segundos (tiempo en cola + sin leer + de lectura + de trabajo / cant de mensajes )

		@tc:6729
		Escenario: Un mensaje es respondido en la cola por un supervisor es valido para el ASA y recolecta el tiempo en cola
			Dado que un mensaje se encuentra encolado
			Y el mensaje es el primer encolado en el dia
			Cuando un supervisor lo responda al haber acumulado 1 minuto 
			Y el supervisor consulte el ASA de la cola	
			Entonces el ASA de la cola sera de 1 minuto

	Regla de negocio: Se obtiene la metrica al generar el promedio del tiempo total de atencion de los mensajes 

		@tc:6730
		Escenario: ASA calculado mediante mensajes de ambos modos	
			Este escenario mezcla los dos previos, recordar que en modo chat se esta desestimando el tiempo de trabajo
			Dado que en el dia hubo 3 mensajes gestionados en la cola:
				| tiempo en cola | tiempo sin leer | tiempo de lectura | tiempo de trabajo | modo         |
				| 00:01:37,200   | 00:00:18,716    | 00:00:22,500      | 00:00:15,792      | modo chat    |
				| 00:00:25,070   | 00:00:20,792    | 00:00:20,780      | 00:00:19,792      | modo no chat |
				| 00:00:05,363   | 00:00:02,706    | 00:00:02,319      | 00:02:08,717      | modo no chat |
			Cuando un supervisor consulta el ASA de la cola	
			Entonces el ASA de la cola sera de 2 minuto y 1 segundo (msj1: 138,416 seg + msj2: 86,434 + msj3: 139,105 / 3 = 121,318)

		@tc:6731
		Escenario: ASA calculado mediante multiples mensajes de modo chat de una misma atencion
			Dado que una cola no tuvo mensajes en el dia
			Y en una misma atencion un agente responde entrantes de modo chat generando los siguientes tiempos
				| tiempo en cola | tiempo sin leer | tiempo de lectura | tiempo de trabajo |
				| 00:00:01,657   | 00:00:05,022    | 00:00:07,227      | 00:00:21,323      |
				| 00:00:00,366   | 00:00:00,117    | 00:00:12,153      | 00:00:10,473      |
				| 00:00:00,367   | 00:00:00,146    | 00:00:09,057      | 00:00:10,976      |
			Cuando un supervisor consulta el ASA de la cola	
			Entonces el ASA de la cola sera de 11 segundos

	Regla de negocio: No se incluye al calculo del ASA mensajes que no sean respondido/atendido 

		@tc:6732
		Escenario: Mensaje no es tenido en cuenta por el ASA al ser gestionado por agente sin responder/atender
			TODO:CORROBORAR SI UN MENSAJE EN MODO CHAT LE RESPONDEN Y LUEGO LO TRANSFIEREN NO CUENTA PARA EL ASA
			Dado que una cola no tuvo mensajes en el dia
			Y un mensaje asignado a un agente es <accion>
			Cuando un supervisor consulta el ASA de la cola
			Entonces el ASA de la cola sera de 0 segundos

			Ejemplos:
				| accion              |
				| descartado          |
				| agrupado            |
				| transferido de cola |