# language: es
@us:6876
Característica: modificación de campañas via API		
	 Se requiere poder modificar campañas sin caso mediante API, sin necesidad de modificarlas mediante ySocial.
	 
	 Se eligen algunas combinatorias de modificación de estados para los escenarios. De forma exploratoria, ampliar los ejemplos.

	 Regla:No podrá modificarse una campaña que se encuentre en un estado final: procesada, cancelada o en proceso de cancelación, pausado o carga de archivo CSV (procesando archiv0)

		@tc:7238
		Esquema del escenario: no se modifican campañas en estado final
			Dado que se ejecuta una request patch con el id de una campaña en estado <estado de campaña>
			Cuando el objeto del body es el siguiente:
			"""
				"status": <status a modificar>
			"""
			Entonces se obtiene una respuesta de error

				Ejemplos: 
					| estado de campaña  | status a modificar |
					| procesada          | 4                  |
					| cancelada          | 7                  |
					| pausando           | 5                  |
					| fuera de tiempo    | 4                  |
			
	 Regla: No podrá pausarse una campaña que no se encuentre activa en proceso de envío.

		@tc:7239
		Escenario: se pausa una campaña en ejecucion
			Dado que se quiere pausar una campaña en ejecucion
			Y se configura su id en los parametros de la request
			Cuando el objeto del body es el siguiente:
			"""
				"status": 7
			"""
			Entonces se obtiene una respuesta exitosa
			Y el id de la campaña debera ser 11 (pausando)

		@tc:7240
		Esquema del escenario: se intenta pausar una campaña en estado final o pausando
			Dado que se quiere pausar una campaña con estado <estado de campaña>
			Y se configura su id en los parametros de la request
			Cuando el objeto del body es el siguiente:
			"""
				"status": 7
			"""
			Entonces se obtiene una respuesta de error

			Ejemplos: 
					| estado de campaña  |
					| procesada          |
					| creada             |
					| procesando archivo |
					| cancelada          |
					| pausada            |
					| pausando           |


	 Regla: No podrá reanudarse una campaña que no se encuentre pausada.

		@tc:7241
		Esquema del escenario: se intenta reanudar campaña no pausada
			Dado que se configura el id de una campaña <estado> en los parametros de la request
			Cuando el objeto del body es el siguiente:
				"""
					"status": 4
				"""
			Entonces se obtiene una respuesta de error

				Ejemplos:	
					| estado       |
					| en ejecucion |
					| cancelada    |
					| creada       |

	 Regla: Si se envía a reanudar una campaña, previamente pausada, y ya existe otra en ejecución se retornará un “Pendiente” para representar que hay otra campaña enviándose en esos momentos. Si no hay campañas en ejecución, se reaunudará de inmediato.

		@tc:7242
		Escenario: campaña reanudada queda pendiente
			Dado que hay una campaña en ejecucion
			Y otra campaña pausada
			Cuando se quiere reanudar la campaña pausada
			Entonces se obtiene como respuesta id:6 
			Y queda pendiente

		@tc:7243 
		Escenario: campaña reanudada se ejecuta al instante
			Dado que no hay campañas en ejecucion
			Y hay una campaña pausada
			Cuando se quiere reanudar la pausada
			Entonces se obtiene como respuesta id:4
			Y se ejecuta

	Regla: Se puede cancelar una campaña sin trazabilidad previamente creada por integración

		@tc:7244 
		Esquema del escenario: se cancela una campaña
			Dado que se configura el id de una campaña <estado> en los parametros de la request
			Cuando el objeto del body es el siguiente:
				"""
					"status": 5
				"""
			Entonces se obtiene como respuesta id:10 "cancelando"

				Ejemplos: 
					| estado             |
					| en ejecucion       |
					| pausada            |
					| creada             |
					| pendiente          |
					| procesando archivo |
		@tc:7245 
		Esquema del escenario: se intenta cancelar una campaña en estado final
			Dado que se configura el id de una campaña <estado> en los parametros de la request
			Cuando el objeto del body es el siguiente:
				"""
					"status": 5
				"""
			Entonces se obtiene respuesta de error

				Ejemplos: 
					| estado          |
					| cancelando      |
					| cancelada       |
					| procesada       |
					| fuera de tiempo |