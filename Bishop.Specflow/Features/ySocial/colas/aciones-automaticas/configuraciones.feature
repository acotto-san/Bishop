#language: es 
@us:6539
Característica: Configuracion para acciones automaticas
	Como administrador
	Quiero poder configurar las acciones automaticas
	Para ejecutar diferentes acciones luego del vencimiento de un tiempo

	Regla de negocio: Al configurar "mover cola" en la primera accion automatica no se debe habilitar el uso de la segunda accion automatica

		@tc:8588
		Escenario: Supervisor configura "Mover cola" en la primera accion automatica
			Dado Un supervisor configura "Acciones ante el primer vencimiento" con la opcion "mover cola"
			Cuando quiera configurar "Acciones ante el segundo vencimiento"
			Entonces no podra seleccionar ninguna accion en "Acciones ante el segundo vencimiento"

	Regla de negocio: Dentro de la seccion de las acciones automaticas se podra determinar el tiempo a cumplirse

		@tc:8589
		Esquema del escenario: Supervisor configura la cantidad de minutos en el timer
			Dado que un supervisor ingresa <nro> en el timer 
			Cuando un mensaje se encole 
			Entonces debera esperarse <nro> minutos para ejecutar la accion

			Ejemplos: 
				| nro |
				| 0   |
				| 1   |
				| 15  |
				| 180 |

		@tc:8590
		Escenario: Supervisor configura 0 minutos en "Acciones ante el primer vencimiento"
			Dado un supervisor configura 0 minutos
			Cuando guarde la configuracion
			Entonces debera quedar guardado como 0 minutos

		@tc:8591
		Esquema del escenario: Supervisor configura 1 minuto en "Acciones ante el segundo vencimiento"
			Dado un supervisor configura <minutos> minutos
			Cuando guarde la configuracion
			Entonces <situacion> <minutos>

			Ejemplos: 
				| minutos | situacion                                     |
				| 0       | debera informar que no se puede configurar en |
				| 1       | debera quedar guardado como                   |
				| 15      | debera quedar guardado como                   |
				| 180     | debera quedar guardado como                   |

	Regla de negocio: El valor del tiempo la segunda acción debe ser mayor que el tiempo de la primera acción

		@tc:8695
		Escenario: Supervisor configura el timer del segundo vencimiento con menor tiempo que el timer del primer vencimiento
			Dado Un supervisor que se encuentra configurando acciones automaticas
			Y el timer del primer vencimiento lo configura en 5 minutos
			Cuando configure el timer del segundo vencimiento en 4 minutos
			Entonces al aceptar la configuracion el sistema debera avisar que no es posible

	Regla de negocio: Se deberan ver las acciones "Acciones ante el primer vencimiento" y "Acciones ante el segundo vencimiento"

		@tc:8592
		Escenario: Supervisor ingresa a una cola y ve acciones automaticas
			Dado un supervisor se encuentra en COLA A
			Cuando ingrese a "Acciones automaticas" 
			Entonces debera ver "Acciones ante el primer vencimiento" y "Acciones ante el segundo vencimiento"

		@tc:8593
		Escenario: Supervisor ingresa a acciones automaticas
			Dado que un supervisor ingresa a acciones automaticas
			Cuando vea "Primera accion" o "segunda accion"
			Entonces debera ver las acciones <acciones>
	
			Ejemplos: 
				| acciones                   |
				| Mover a cola               |
				| Responder automaticamente  |
				| Notificar al canal de chat |
				| Aplicar etiquetas          |
				
	Regla de negocio: En la accion responder automaticamente y notificar al canal de chat se podran utilizar comodines "@@EWT@@" Y "@@POSMSGCOLA@@"

		@tc:8594
		Escenario: Supervisor configura los comodines
			Dado un supervisor se encuentra en acciones automaticas
			Cuando seleccione la accion <accion>
			Entonces podra utilizar los comodines @@EWT@@ y @@POSMSGCOLA@@

			Ejemplos:
				| accion                     |
				| Responder automaticamente  |
				| Notificar al canal de chat |

	Regla de negocio: Al Supervisor configurar el comodin @@EWT@@ debajo vera un campo para completar un texto por si el "ewt = infinito" o "ewt = N/A"

		@tc:8595
		Esquema del escenario: Supervisor configura el comodin @@EWT@@
			Dado un supervisor configuando acciones automaticas 
			Cuando ingrese el comodin @@EWT@@
			Entonces debera ver un text area a completar llamado <texto>

			Ejemplos:
				| texto                            |
				| Texto de Respuesta alternativo 1 |
				| Texto de Respuesta alternativo 2 |

	Regla de negocio: Al usar el comodin @@EWT@@ se debe tener una condicion para configurar en cuantos segundos o cantidad de mensajes debe tener para ejecutar la accion de responder automaticamente con el comodin

		@tc:8596
		Esquema del escenario: Supervisor usa el comodin @@EWT@@
			Dado un supervisor configura acciones automaticas
			Cuando ingrese el comodin @@EWT@@
			Entonces debera ver la configuracion de <config>

			Ejemplos:
				| config                                |
				| Cantidad minima de EWT                |
				| Cantidad minima de mensajes encolados |

	Regla de negocio: De no cumplirse una de las dos condiciones del comodin @@EWT@@ no se ejecuta la accion

		@tc:8597
		Escenario: Ingresa un nuevo mensaje cuando hay 1 encolado
			Dado que un supervisor configura "Cantidad minima de mensajes" 2
			Cuando haya solo un mensaje encolado
			Entonces no se debera ejecutar la respuesta automatica

		@tc:8598
		Escenario: ingresa un nuevo mensaje
			Dado que un supervisor configura "Cantidad minima de EWT" en 30 segundos
			Cuando la metrica sea de 25 segundos
			Entonces no se debera responder automaticamente