#language: es
Característica: Tener una pagina para descargar reportes programados
	Se desea tener una vista donde se publiquen los reportes programados que ya fueron generados y se puedan descargar

	Regla de negocio: el contenido de la vista esta limitado por usuario 
		
		@tc:5694
		Escenario: supervisor solo visualiza los reportes generados que programo por su cuenta
			Dado que el supervisor Silvio tiene configurado un reporte programado con periodicidad diaria
			Y la supervisora Sandra no tiene configurado ningu reporte programado
			Cuando ySocial genere el reporte programado con periodicidad diaria
			Y Sandra ingrese a la pestaña "Reportes Programados" en la pagina de "Reportes Generados"
			Entonces no vera ningun reporte en la lista

		@tc:5695
		Esquema del escenario: supervisor descarga un reporte en formato excel/csv
			Dado un supervisor que se encuentra en la pagina de descargas de reportes programados
			Cuando selecciona un reporte programado en formato <formato de archivo>
			Entonces el archivo se debera descargar en formato <formato de archivo>

			Ejemplos: 
				| formato de archivo |
				| excel              |
				| csv                |

		@tc:5696
		Esquema del escenario: supervisor descarga reporte diferentes
			Dado un supervisor que se encuentra en la pagina de descargas de reportes programados
			Y en la lista se encuentra presente un reporte de <tipo> <detalle>
			Cuando el supervisor descargue y abra dicho reporte programado
			Entonces vera que las columnas que contiene el archivo son del tipo de reporte correcto

			Ejemplos:
				| tipo           | detalle     |
				| Detallado      | de mensajes |
				| Detallado      | de colas    |
				| Detallado      | de casos    |
				| Consolidados   | de agentes  |
				| Consolidados   | de casos    |
				| Consolidado    | de colas    |
				| Administrativo | de eventos  |
				| Administrativo | de login    |
