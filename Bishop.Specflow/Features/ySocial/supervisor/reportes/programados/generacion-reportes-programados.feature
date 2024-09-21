#language: es
Característica: generacion automatica de los reportes programados
	Se desea que los reportes programados se generen automaticamente segun su periocidad y deben contener movimientos de un tiempo limitado

	Regla de negocio: el contenido de un reporte se poblara con movimientos que el usuario tiene permiso para visualizar


		@tc:5632
		Escenario: los reportes contendran movimientos de colas que el usuario supervise
			Dado un supervisor que tiene permisos de supervision sobre las siguientes colas
				| nombre cola |
				| AAA         |
				| Cola 1      |
			Cuando el supervisor descargue un reporte automatico generado de tipo Detallado de Casos
			Entonces dentro del reporte solo debe haber casos que fueron gestionados en las colas
				| nombre cola |
				| AAA         |
				| Cola 1      |

		@tc:5633
		Escenario: supervisor obtiene misma informacion de un reporte programado que generando un reporte manual
			Dado un reporte programado de tipo Detallado de Casos con periodicidad diaria
			Y el reporte posee los filtros por default
			Cuando genera manualmente un reporte Detallado de Casos con los filtros default
			Y los filtros los deja configurados por default
			Entonces debera ver la misma informacion en ambos reportes

	Regla de negocio: la periodicidad de entrega establece la franja de tiempo que registrada dentro del reporte

		@tc:5634
		Escenario: Un reporte diario genera los movimientos del dia previo
			Dado un reporte programado con periodicidad diaria
			Cuando ySocial genere el reporte programado con periodicidad diaria
			Entonces contendra los movimientos del dia anterior

		@tc:5635
		Escenario: reporte programado diario es agendado a la mitad del dia
			Dado que un supervisor a las 15 hs creo un reporte programado con periodicidad diaria
			Cuando se publique el reporte al dia siguiente
			Entonces contendra todos los movimientos del dia previo a su generacion

		@tc:5636
		Escenario: un reporte semanal genera los movimientos de la semana que acaba de finalizar 
			Dado un reporte programado con periodicidad semanal
			Cuando ySocial genere el reporte los lunes
			Entonces contendra los movimientos de la semana anterior

		@tc:5637
		Escenario: reporte programado semanal es agendado a la mitad de la semana
			Dado que un supervisor un miercoles 22 creo un reporte programado con periodicidad semanal
			Cuando ySocial genere el reporte programado
			Entonces contendra los movimientos desde el dia lunes 20 hasta el domingo 26 inclusive

		@tc:5638
		Escenario: un reporte mensual genera los  movimientos del mes que acaba de finalizar
			Dado un reporte programado con periodicidad mensual
			Cuando ySocial genere el reporte el primer dia del mes
			Entonces contendra los movimientos de la semana anterior

		@tc:5639
		Escenario: reporte programado mensual es agendado a la mitad del mes
			Dado que un supervisor un 15 de marzo crea un reporte programado con periodicidad mensual
			Cuando ySocial genere el reporte programado
			Entonces contendra los movimientos desde el 1ro hasta el 31 de marzo