#language: es
@us:7317

Característica: Tener un tablero donde ver los consumos de gpt
	Como administrador
	Quiero poder ver un tablero de consumos de cada proyecto de los del tipo GPT
	Para evaluar cuanto voy consumiendo mes a mes.
	

	Regla de negocio: se computa el +1 en el momento de ejecución 

		@tc:8622
		Escenario: Se revisan las metricas consumidas
			Dado usuario arranca el caso 1122 el 18-03 y a lo largo del día genera métricas para: intenciones, entidades, base de conocimiento, formularios
			Y el caso cierra el 20-03
			Cuando un supervisor abre la consola y filtra mostrando solo las métricas del día 18-03
			Entonces esas métricas consumidas por el caso estaran sumadas al total del día

	Regla de negocio: Las novedades se publican cada 30min
	
		@tc:8630
		Escenario: Movimiento dentro del rango de 30 min se debe mostrar al cierre del intervalo
			Dado que un movimiento ocurrio a las 23:45 min del día 
			Y esos movimientos impactan en los contadores
			Cuando se publique la recoleccion ocurrida a los 23:59 minutos 
			Entonces se debera mostrar ese movimiento

		@tc:8631
		Escenario: Movimiento de fecha pasada esta presente en el tablero
			Dado que un movimiento ocurrio el 22/03 a las 23:45
			Cuando un supervisor pida los contadores para el día 22/03
			Entonces ese movimiento debe estar presente en la metrica