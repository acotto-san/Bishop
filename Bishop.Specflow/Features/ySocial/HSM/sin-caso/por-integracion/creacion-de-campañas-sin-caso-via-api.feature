# language: es
@us:6876
Característica: creación de campañas via API		
	 Se requiere poder crear campañas sin caso mediante API, sin necesidad de crearlas mediante ySocial. 


	 Regla: Se puede crear una tarea de cualquier tipo. Entran en la misma cola de prioridad, que las creadas sin caso por la web de supervisor

		 @tc:7232
		 Esquema del escenario: creación de cualquier tipo de tarea masiva
		 Para que se procese la tarea, el csv tiene que ser zipeado y cargado a drive, el link debe ser público y la url debe ser export=download. De cualquier otra forma será cancelada la campaña.
			Dado que se quiere crear una campaña masiva via api de tipo <tipo de tarea>
			Cuando se ejecuta la request con el siguiente objeto del body:
			"""
				"type": <type>
			"""
			Entonces se creara ese tipo de campaña

				Ejemplos:
					| tipo de tarea | type |
					| inmediata     | 3    |
					| inmediata VIM | 4    |
					| agendada      | 1    |

		@tc:7233 
		Escenario: se crea campaña y entra en cola de espera de hsm sin caso para ejecutarse
			Dado que hay una tarea inmediata sin caso ejecutandose 
			Y otra tarea inmediata sin caso en espera para empezar a continuacion
			Cuando se crea una campaña inmediata importante sin caso via api
			Entonces sera la siguiente en ejecutarse una vez que termine la que estaba en proceso


		@tc:7234 
		Escenario: dos campañas masivas a dos líneas diferentes
			Dado que se crea una campaña a una linea via api
			Cuando se crea otra campaña a otra linea via api
			Entonces ambas campañas deberian ejecutarse exitosamente
		
	
	 Regla: Response No Ok. No se crea la campaña si hay algún error en la request

		@tc:7235
		Esquema del escenario: error en la configuración de la request
			Dado que se configura la request para crear una campaña via api
			Cuando hay un error en el <segmento>
			Entonces <resultado obtenido>

				Ejemplos: 
					| segmento                                             | resultado obtenido            |
					| csv                                                  | se crea y se cancela la tarea |
					| template                                             | se obtiene respuesta de error |
					| tipo de campaña                                      | se obtiene respuesta de error |
					| mal formateado el objeto del body (coma, llave, etc) | se obtiene respuesta de error |

		@tc:7236
		Esquema del escenario: error con el jwt
			Dado que se configura la request para crear una campaña via api
			Cuando se configura con un <jwt>
			Entonces recibe como respuesta un error 401

				Ejemplos: 
				| jwt                        |
				| jwt que ya no esta vigente |
				| jwt alterado               |
				| jwt ausente                |

	 Regla: Yoizen notificará al cliente el valor de un rate limit, en caso de superarse la API retornará un código HTTP de respuesta 429 (Too Many Requests).Rate limit: 5 request por minuto

		@tc:7237 
		Esquema del escenario: limite de 5 request por minuto
			Dado que una reques se ejecuta <cantidad> veces en un minuto
			Cuando se crean las campañas
			Entonces se crearan <creadas>
			Y <no creadas> tendran codigo de respuesta 429

				Ejemplos: 
				| cantidad | creadas | no creadas |
				| 5        | 5       | 0          |
				| 6        | 5       | 1          |
			