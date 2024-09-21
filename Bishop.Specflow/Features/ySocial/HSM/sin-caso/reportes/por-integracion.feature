# language: es
@us:6876
Característica: campañas sin caso via api

Regla: En el detallado de tareas aparece creado por integracion

	@tc:7246
	Escenario: se visualiza creado por "Integracion" en el detallado
		Dado que se crea una campaña sin caso via api
		Cuando se realiza una busqueda en el detallado de tareas de envio masivo sin caso
		Entonces debera decir por "Integracion" en la columna "Creado por"
		
	@tc:7247
	Escenario: se genera el reporte de una campaña creada via api
		Dado que se crea una campaña sin caso via api
		Cuando fue procesada
		Y se descarga la informacion de la tarea
		Entonces debera generarse el reporte con todos sus registros