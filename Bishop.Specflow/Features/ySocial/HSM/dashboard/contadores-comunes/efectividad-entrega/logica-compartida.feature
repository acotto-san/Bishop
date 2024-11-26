Característica: Tener un contador de tareas HSM Efectividad de entrega
	Como supervisor que va a estar controlando los envíos de tareas
	Quiero tener un contador de Efectividad de entregas en determinado tiempo
	Para poder tener nocion del Efectividad de entrega

	Regla de negocio: Son contabilizadas sin importar el usuario que agenda la tarea
		
		@tc:
		Esquema del escenario: Supervisor agenda tareas y se visualizan en el contador de Efectividad de entrega
			Dado que se esta viendo el contador desde
				| seccion | <seccion>    |
				| vista   | <tipo-tarea> |
			Y se ejecuto una <tipo-tarea> en la franja de tiempo comprendida por el contador 
			Y quien gestiono la tarea fue un supervisor
			Cuando el supervisor visualice el contenido del contador
			Entonces vera que el contador indica 1

			Ejemplos: 
				| seccion           | tipo-tarea      |
				| resumen diario    | tareas con caso |
				| resumen historico | tareas con caso |
				| resumen diario    | tareas sin caso |
				| resumen historico | tareas sin caso |

		@tc:
		Esquema del escenario: Integracion agenda por API tareas y se visualizan en el contador de Efectividad de entrega
			Dado que se esta viendo el contador desde
				| seccion | <seccion>    |
				| vista   | <tipo-tarea> |
			Y se ejecuto una <tipo-tarea> en la franja de tiempo comprendida por el contador 
			Y quien gestiono la tarea fue una integración vía API
			Cuando el supervisor visualice el contenido del contador
			Entonces vera que el contador indica 1

			Ejemplos: 
				| seccion           | tipo-tarea      |
				| resumen diario    | tareas con caso |
				| resumen historico | tareas con caso |
				| resumen diario    | tareas sin caso |
				| resumen historico | tareas sin caso |

	Regla de negocio: Mientras hayan finalizado con fecha de inicio cuentan sin importar la razon de finalización

		@tc:
		Esquema del escenario: Una tarea finaliza con fallo y se visualiza en el Efectividad de entrega
			Dado que una tarea se ejecuta y finaliza con fallos
			Cuando un supervisor visualice el contador desde 
				| seccion | <seccion>    |
				| vista   | <tipo-tarea> |
			Y la tarea esté comprendida porla franja de tiempo del contador
			Entonces vera que el contador indica 1

			Ejemplos: 
				| seccion           | tipo-tarea      |
				| resumen diario    | tareas con caso |
				| resumen historico | tareas con caso |
				| resumen diario    | tareas sin caso |
				| resumen historico | tareas sin caso |