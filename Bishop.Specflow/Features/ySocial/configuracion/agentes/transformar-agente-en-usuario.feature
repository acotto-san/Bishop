#language: es
Característica: Transformar un agente en un usuario

	Para poder reutilizar las credenciales de un usuario que hoy es agente y cambia de rol
	Como Administrador del ambiente donde esta creado el agente
	Quiero poder transformarlo de agente a usuario (usuario supervisor)

	Regla de negocio: El proceso de conversión lo realiza un usuario desde la web del supervisor

		@tc:8574
		Escenario: Supervisor convierte a un usuario agente en un usuario supervisor
			Exploratorio: probar con un agente que poseía habilitado MFA
			Dado que el usuario con username "poochie" es un usuario de la seccion agentes
			Cuando el usuario agente es transformado a supervisor
			Entonces el usuario podra loguearse en la web del supervisor

		@tc:8575
		Escenario: Usuario que fue migrado de agente a usuario supervisor no podra loguear en la web de agentes
			Dado que un usuario agente fue transformado a supervisor
			Cuando intente ingresar a la web del agente con sus credenciales
			Entonces le sera informado que el usuario no posee permisos de agente

		#@tc:
		#Escenario: La transfromacion de usuario ocurre correctamente al estar al limite de la cantidad de usuario nominales
		#   escenario comentado porque estara para el feature 8461 de la proxima version
		#	Dado que un ambiente esta al limite de usuarios nominales
		#	Cuando se intenta transformar un usuario agente a usuario supervisor
		#	Entonces la conversion sera exitosa
		#	Y habra la misma cantidad de usuarios totales

	Regla de negocio: En la creación automática del nuevo usuario supervisor solo se migran datos básicos

		@tc:8576
		Escenario: Usuario supervisor se crea a partir de la conversion de un agente y mantiene sus datos básicos
			Dado un usuario agente
			Cuando el usuario agente es transformado a supervisor
			Entonces el nuevo usuario supervisor tendra automáticamente migrado:
				| propiedad  |
				| nombres    |
				| username   |
				| email      |
				| contraseña |
				| avatar     |

	Regla de negocio: Las credenciales del usuario se mantienen al ser transformado

		@tc:8577
		Escenario: Usuario que fue transformado de agente a supervisor mantiene sus credenciales
			Exploratorio: intentar cambiarla luego de ser supervisor
			Dado que un usuario podía loguearse con sus credenciales a la web del agente
			Cuando el usuario agente es transformado a supervisor
			Entonces podra autenticarse en la web del supervisor utilizando las mismas credenciales

		@tc:8578
		Escenario: Usuario que fue transformado de agente a supervisor mantiene su configuracion de MFA
			Dado que un agente requiere de un token para loguearse mediante MFA
			Cuando el usuario agente es transformado a supervisor
			Entonces para loguearse en la web del supervisor debera utilizar el mismo token

	Regla de negocio: Los registros que puede haber dejado el agente continuaran presentes
		
		@tc:8579
		Esquema del escenario: Registros en el reporte detallado continuan mostrando informacion de un agente transformado a supervisor
			Esto es un recordatorio que por más de que ya no es agente continua estando presente en reportes viejos
			Dado que un agente gestionó mensajes de un caso
			Cuando se obtenga un reporte detallado de <tipo> que contemple registros de dicho caso
			Entonces el agente estara presente en las celdas que corresponda ser mencionado

			Ejemplos:
				| tipo                             |
				| mensajes                         |
				| casos                            |
				| usuarios                         |
				| perfiles                         |
				| chats                            |
				| encuestas                        |
				| login/logout                     |
				| adherencia                       |
				| transferencias                   |
				| reapertura de casos              |
				| segmentos de tiempos de mensajes |

	Regla de negocio: La transformacion sera una accion registrada en el reporte detallado de eventos

		@tc:8580
		Escenario: Transformación de un agente a usuario se registra en el detallado de eventos
			No tiene detalles ni referencia username, solo el evento
			Dado que un usuario agente fue transformado a supervisor
			Cuando se obtenga un reporte detallado de eventos 
			Entonces habrá un evento registrado definido como accion transformar sobre una entidad agente
