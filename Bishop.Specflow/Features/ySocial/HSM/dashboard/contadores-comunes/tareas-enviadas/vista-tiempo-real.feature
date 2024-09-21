#language: es
Característica: Tener una version del contador de tareas enviadas que me muestre exclusivamente las de hoy
	Como supervisor que esta viendo el dashboard
	Quiero tener una version del contador de tareas enviadas
	Para poder diferencias las que se estuvieron enviando solo hoy

	Regla de negocio: Se contabilizan tareas que hayan tenido fecha de inicio en el día presente

		@tc:
		Esquema del escenario: Se enviaron tareas durante hoy y aparecen en el contador de tareas enviadas
			Dado que hoy se enviaron <cantidad> <tipo-tarea>
			Cuando un supervisor visualice el contador desde 
				| seccion | tiempo real  |
				| vista   | <tipo-tarea> |
			Entonces vera que el contador indica <cantidad> 

			Ejemplos: tareas con caso
				| cantidad | tipo-tarea     |
				| 1        | tarea con caso |
				| 10       | tarea con caso |

			Ejemplos: tareas sin caso
				| cantidad | tipo-tarea     |
				| 1        | tarea sin caso |
				| 10       | tarea sin caso |

		@tc:
		Esquema del escenario: Las tareas enviadas ayer ya no se muestran en el contador de tareas enviadas en "Resumen diario"
			Dado que ayer se enviaron 2 <tipo-tarea>
			Y hoy no se envió ninguna
			Cuando un supervisor visualice el contador desde 
				| seccion | tiempo real  |
				| vista   | <tipo-tarea> |
			Entonces vera que el contador indica 0

			Ejemplos: 
				| tipo-tarea     |
				| tarea con caso |
				| tarea sin caso |

		@tc:
		Esquema del escenario: Una tarea se iniciada y pausada hoy cuenta para el contador de tareas enviadas en "Resumen diario"
			Dado que hoy inicio una <tipo-tarea>
			Y hoy mismo la pausaron
			Cuando un supervisor visualice el contador desde 
				| seccion | tiempo real  |
				| vista   | <tipo-tarea> |
			Entonces vera que el contador indica 1

			Ejemplos: 
				| tipo-tarea     |
				| tarea con caso |
				| tarea sin caso |
				
	Regla de negocio: Una tarea activa sin fecha de fin cuenta siempre y cuando haya iniciado hoy
		
		@tc:
		Esquema del escenario: Una tarea comienza a ejecutarse y se adicional al contador de tareas enviadas en "Resumen diario"
			Dado que un supervisor visualizo un 1 en el contador desde
				| seccion | tiempo real  |
				| vista   | <tipo-tarea> |
			Cuando inicia una nueva <tipo-tarea>
			Y vuelve a visualizar el contador 
			Entonces vera que el contador indica 2

			Ejemplos: 
				| tipo-tarea     |
				| tarea con caso |
				| tarea sin caso |

		@tc:
		Esquema del escenario: Tarea actualmente activa pero iniciada ayer no es considerada por el contador de tareas enviadas en "Resumen diario"
			Dado que ayer se inicio una <tipo-tarea>
			Y hoy sigue en ejecución
			Cuando un supervisor visualice el contador desde 
				| seccion | tiempo real  |
				| vista   | <tipo-tarea> |
			Entonces vera que el contador indica 0

			Ejemplos: 
				| tipo-tarea     |
				| tarea con caso |
				| tarea sin caso |

		@tc:
		Esquema del escenario: Tarea es reanudada hoy y el contador la considera si la fecha de inicio es hoy
			Dado que <dia> se inicio una <tipo-tarea> y luego fue pausada
			Y fue reanudada hoy mismo
			Cuando un supervisor visualice el contador desde 
				| seccion | tiempo real  |
				| vista   | <tipo-tarea> |
			Entonces vera que el contador indica <resultado>

			Ejemplos: 
				| tipo-tarea     | dia  | resultado |
				| tarea sin caso | ayer | 0         |
				| tarea con caso | hoy  | 1         |
