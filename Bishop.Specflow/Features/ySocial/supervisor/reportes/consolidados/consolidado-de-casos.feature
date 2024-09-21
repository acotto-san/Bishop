#language: es
Característica: Reporte consolidado de casos
	Se desea tener un reporte que consolide metricas relacionadas a casos.
	La franja que acapare cada registro de metricas puede ser por intervalo diario o por intervalo de media hora.

	@tc:6083
	Esquema del escenario: El reporte tendra un grupo de columnas fijas en cualquier tipo de vista
			Dado un supervisor solicita un reporte Consolidado de Casos
			Cuando visualiza el reporte desde la vista <vista del reporte>
			Entonces vera que el reporte contiene las siguientes columnas:
				| nombre de columna                                       |
				| fecha                                                   |
				| casos iniciados                                         |
				| casos cerradoos                                         |
				| casos cerrados por service level                        |
				| casos reabiertos                                        |
				| encuestas enviadas                                      |
				| casos nuevos que invocaron a yflow                      |
				| casos cerrados por yflow                                |
				| casos derivados por yflow                               |
				| casos cerrados automaticamente por inactividad de yflow |

			Ejemplos: 
				| vista del reporte    |
				| online               |
				| exportado manual     |
				| exportado programado |