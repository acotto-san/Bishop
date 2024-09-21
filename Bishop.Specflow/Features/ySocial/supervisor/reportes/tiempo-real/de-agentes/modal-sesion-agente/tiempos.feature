#language: es
Característica:Tiempos en el modal - reporte de tiempo real de agentes

	Como supervisor, en el modal de información de la actividad del agente 
	quiero visualizar los tiempos de cada estado del agente durante la sesión y durante el día
	para que pueda analizarse


	Regla: Recupera los tiempos de cada estado de la sesión activa en un gráfico de torta

	@tc:7464
	Escenario: se muestran los tiempos de cada estado de la sesion actual del agente en el gráfico de tortas
	Exploratorio: probar con diferentes tipos de estado auxiliar
		Dado que un agente tuvo los siguientes cambios de estado en su sesion actual:
				| orden | estado     | tiempo |
				| 1     | login      | 1 min  |
				| 2     | auxiliar   | 2 min  |
				| 3     | disponible | 2 min  |
				| 4     | trabajando | 3 min  |
				| 5     | auxiliar   | 2 min  |
		Cuando un supervisor visualiza la pestaña de tiempos del modal
		Entonces en la distribucion de tiempos del la sesion aparece el detalle de cada estado
		Y los siguientes tiempos totales de la sesion:
				| estado     | tiempo total |
				| auxiliar   | 5 min        |
				| disponible | 2 min        |
				| trabajando | 3 min        |
	
	@tc:7465
	Escenario: luego de que un agente estuvo en un estado auxiliar recientemente asignado, se muestra en el grafico de tortas de la sesión
		Dado que un supervisor crea un nuevo estado auxiliar "Recreo" 
		Y se lo asigna al agente 
		Cuando un agente permanece 5 minutos en estado "Recreo"
		Y el supervisor visualiza la pestaña de tiempos del modal
		Entonces en la distribucion de tiempos del la sesion aparece el detalle del estado de "Recreo"
	
	Regla: Recupera los tiempos de cada estado durante todo el día de actividad del agente en un gráfico de tortas

	@tc:7466
	Escenario: se muestran los tiempos consolidados de los estados un agente que tuvo dos sesiones en un dia
	Exploratorio: probar con diferentes tipos de estado auxiliar y con interrupciones en el agente.
	Verificar qué sucede si se desconecta el agente por falla en la conexión o por acción del supervisor mientras tiene una sesión activa.
		Dado que un agente tuvo dos sesiones con los siguientes cambios de estado:
				| Sesion  | orden | estado     | tiempo |
				| primera | 1     | login      | 1 min  |
				| primera | 2     | auxiliar   | 2 min  |
				| primera | 3     | disponible | 2 min  |
				| primera | 4     | trabajando | 3 min  |
				| segunda | 1     | login      | 2 min  |
				| segunda | 2     | auxiliar   | 3 min  |
				| segunda | 3     | trabajando | 4 min  |
				| segunda | 4     | disponible | 1 min  |
		Cuando un supervisor visualiza la pestaña de tiempos del modal
		Entonces en la distribucion de tiempos del dia, aparece el detalle de cada estado
		Y los siguientes tiempos consolidados del dia:
				| estado     | tiempo total |
				| auxiliar   | 8 min        |
				| disponible | 3 min        |
				| trabajando | 7 min        |

	
	@tc:7467
	Escenario: luego de que un agente estuvo en un estado auxiliar recientemente asignado, se acumula su tiempo en el grafico de tortas del dia
		Dado que un agente tuvo mas de una sesion en el dia
		Y se le asigna un nuevo estado auxiliar "Recreo"
		Cuando el agente permanece 5 minutos en "Recreo"
		Y un supervisor visualiza la pestaña de tiempos del modal
		Entonces en la distribución de tiempos del dia aparece el detalle del estado "Recreo"
		Y se acumula el tiempo de 5 minutos al total de estado auxiliar

	