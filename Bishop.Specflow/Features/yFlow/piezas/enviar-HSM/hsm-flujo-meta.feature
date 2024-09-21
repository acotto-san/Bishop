#language: es
@us:7958

Característica: integración con flujo de Meta
	Se requiere soportar la integración con los flows de META, para poder llamarlos desde yFlow desde un botón en la pieza Enviar HSM
	y recibir los datos capturados en el callback para parsearlos luego en yflow.

	El usuario recibe el hsm en su whatsapp y al completarlo salta al bloque "Respuesta HSM" (si tiene activada la configuración), sino se dirige a respuesta por defecto. En este bloque se puede recuperar el payload.

	Regla de negocio: Si la plantilla tiene un flujo asociado, debe aparecer en la configuracion de la pieza

		@tc:8109
		Escenario: se configura plantilla con flujo de Meta
			Dado la plantilla "mixedbuttons test" tiene un flujo de meta asociado
			Cuando se selecciona la pieza "Enviar HSM"
			Y se selecciona la plantilla "mixedbuttons test"
			Entonces debera aparecer el CTA al flujo de Meta
			Y los bloques de destino a configurar

		@tc:8110
		Escenario: se configura plantilla sin flujo de Meta
			Dado la plantilla "header test sin parametros" no tiene un flujo de meta asociado
			Cuando se selecciona la pieza "Enviar HSM"
			Y se selecciona la plantilla "header test sin parametros"
			Entonces no debera aparecer el CTA a un flujo de Meta

	Regla de negocio: Algunos flujos de meta se pueden parametrizar con datos de entrada que se completan desde variables de yflow. Deben ser variables del mismo tipo de dato configurado en meta

		@tc:8111
		Escenario: plantilla HSM con flujo asociado refleja parametros del flujo
			Dado la plantilla "mixedbuttons test" tiene un flujo de meta asociado
			Y tiene 2 parametros de entrada a configurar
			Cuando se selecciona la plantilla "mixedbuttons test" en la pieza "Enviar HSM"
			Entonces aparecen 2 parametros a completar con variables


		@tc:8112
		Escenario: las variables mostradas en los parametros coinciden con el tipo de dato
			Dado la plantilla "mixedbuttons test" tiene un flujo de meta asociado
			Y tiene 3 parametros de entrada a configurar:
				| parametro | tipo de dato |
				| 1         | array        |
				| 2         | texto        |
				| 3         | numerico     |
			Cuando se selecciona la plantilla "mixedbuttons test" en la pieza "Enviar HSM"
			Entonces los tres parametros permitiran ser completados solo por variables del mismo tipo

	Regla de negocio: la pieza quedará inválida si alguno de sus campos quedan vacíos

		@tc:8113
		Esquema del escenario: se invalida la pieza cuando quedan campos vacíos 
			Dado que un implementador configura la pieza "Enviar Hsm"
			Y la plantilla elegida tiene un flujo de meta asociado
			Cuando deja vacia <componente>
			Entonces la pieza queda invalida
			Y no podra publicar el flujo

			Ejemplos:
				| componente                             |
				| los saltos de bloque de destino        |
				| las variables de parametros de entrada |
		
		@tc:8114 
		Escenario: la pieza pierde la referencia con los saltos de bloque destino
			Dado que la pieza "Enviar HSM" tenia saltos de bloque configurados
			Cuando el bloque es importado a otro flujo 
			Y pierde la referencia con los saltos de bloque 
			Entonces la pieza queda invalida

		@tc:8115
		Escenario: pieza no será inválida si la plantilla HSM apunta a un flujo eliminado
			Este escenario denota que los flujos no estan estrechamente conectados
			a las plantillas, una plantilla sigue creada a pesar que su flujo referenciado ya no
			Dado que la plantilla elegida en la pieza "Enviar HSM" tenia el flujo "Satisfaccion" seleccionado
			Y el flujo "Satisfaccion" es eliminado en la consola de Meta
			Cuando un usuario pasa por esa pieza
			Entonces no se envia el hsm

		@tc:8264
		Escenario: pieza se convierte en inválida al dejar de existir una variable
			Dada una pieza HSM que posee seleccionado una plantilla con flujo de meta asociado
			Y la pieza contenia en sus parametros de entrada asignada una variable
			Cuando la variable sea borrada
			Y el parametro de entrada en la pieza quede vacio
			Entonces la pieza arrojara la alerta de invalidez 

	Regla de negocio: la respuesta del flujo de meta inicia un caso nuevo

		@tc:8116
		Escenario: se inicia un caso al completar el flujo de Meta
			Dado que un usuario recibe un flujo de meta por la pieza Enviar HSM
			Y completa el flujo de meta
			Cuando se envia el mensaje "enviado"
			Entonces se inicia el caso

		@tc:8265
		Escenario: Finalizar un flujo produce un salto de bloque a respuesta HSM
			Dado un bot de yFlow que posee habilitado el salto a Respuesta HSM
			Y dado un caso donde el último mensaje es un saliente normal del bot
			Cuando el usuario finalice un flujo provisto desde el boton de un HSM
			Entonces el flujo realizará el salto de bloque a Respuesta HSM
	
		#@tc:8117
		#Escenario: se completa el flujo de Meta y continua el mismo caso
		#	Dado que un usuario recibe un flujo de meta por la pieza Enviar HSM
		#	Y responde al hsm ingresando un texto
		#	Y avanza por el flujo conversacional
		#	Cuando completa el flujo de meta avanzado el caso
		#	Entonces continua el mismo caso 
		#	Y hace el salto de bloque determinado

	Regla de negocio: Se guardan los datos de salida del flujo en la variable de sistema payload

		@tc:8118
		Esquema del escenario: usuario completa el flujo y se imprimen los datos de salida en el payload
		Exploratorio: el usuario ingresa textos con emojis en el flujo de meta
			Dado que un usuario recibe un flujo de meta por la pieza Enviar HSM
			Cuando el usuario completa el flujo
			Entonces se imprimen todos los datos de salida en la variable payload

			Ejemplos: 
				| tipo de flujo                         |
				| con parametros de entrada a completar |
				| sin parametros                        |

	Regla de negocio: Se sobreescriben los datos de la variable payload
	
		@tc:8119
		Escenario: se sobreescriben los datos con un segundo flujo
		Exploratorio: recibir hsm e ingresar un dato, luego completar el flujo de meta
			Dado un usuario hablando con un bot responde un flujo enviado por la pieza mensaje interactivo de flujo
			Y el flujo tiene como datos de salida las respuestas a un formulario de contacto
			Y luego finaliza un flujo que acaba de recibir por mensaje HSM
			Y el flujo tiene como datos de salida las respuestas a una encuesta de satisfaccion
			Cuando se imprima la variable payload que contiene los datos de salida del flujo
			Entonces se encontraran presentes las respuestas a la encuesta de satisfaccion

	#Regla de negocio: Los saltos de bloque se configuran si la pieza pertenece a un flujo de Whatsapp - Si el usuario termina con éxito el flujo dentro del caso realiza el salto de bloque configurado en la pieza Enviar HSM
	#
	#	@tc:8120
	#	Escenario: usuario completa el flujo dentro del caso y del tiempo - solo WA
	#		Dado que un usuario esta interactuando con un bot
	#		Y recibe un HSM con un flujo de meta asociado
	#		Cuando avanza el flujo conversacional
	#		Y completa el flujo de Meta
	#		Y no paso el tiempo de expiracion
	#		Entonces hace el salto al bloque exitoso
	#
	#	@tc:8121
	#	Escenario: usuario completa el flujo cuando recibe el HSM - solo WA
	#		Dado que un usuario esta interactuando con un bot
	#		Y recibe un HSM con un flujo de meta asociado
	#		Cuando responde el flujo de meta al recibirlo
	#		Entonces hace el salto al bloque exitoso
	#
	#	@tc:8122
	#	Escenario: usuario intenta completar el flujo dos veces
	#		Dado que un usuario recibe un flujo de meta por la pieza Enviar HSM
	#		Y completa el flujo
	#		Cuando avanza el flujo conversacional
	#		Y intenta responder nuevamente al flujo del HSM
	#		Entonces no podra hacerlo porque el boton esta grisado
	#
	#Regla de negocio: Los saltos de bloque se configuran si la pieza pertenece a un flujo de Whatsapp - si el usuario termina con éxito el flujo pero habia expirado su tiempo, realiza el salto de bloque de expiracion
	#
	#	@tc:8123
	#	Escenario: usuario completa el flujo dentro del caso y fuera del tiempo de expiración  - solo WA
	#		Dado que un usuario recibe un flujo de meta por la pieza Enviar HSM
	#		Y el flujo tenia configurado una hora de tiempo de expiracion
	#		Cuando el usuario completa el flujo a las dos horas de haberlo recibido
	#		Entonces salta al bloque de vencimiento del tiempo
	#
	#	@tc:8124
	#	Escenario: usuario completa el flujo dentro del caso y dentro del tiempo de expiracion - solo WA
	#		Dado que un usuario recibe un flujo de meta por la pieza Enviar HSM
	#		Y el flujo tenia configurado una hora de tiempo de expiracion
	#		Cuando el usuario completa el flujo a los 30 minutos de haberlo recibido
	#		Entonces salta al bloque de exito
	#		 
	#Regla de negocio: Los saltos de bloque se configuran si la pieza pertenece a un flujo de Whatsapp - la validación del caso tiene prioridad ante el tiempo de expiración. 
	#
	#	@tc:8125
	#	Escenario: usuario completa flujo en otro caso y vencido el tiempo de expiración  - solo WA
	#		Dado que un usuario recibe un flujo de meta por la pieza Enviar HSM
	#		Y avanza con la conversacion
	#		Y vence el tiempo de expiracion del flujo de meta
	#		Cuando termina el caso
	#		Y completa el flujo de meta en un caso nuevo
	#		Entonces salta al bloque configurado para "no coincide caso"
	#
	#Regla de negocio: Los saltos de bloque se configuran si la pieza pertenece a un flujo de Whatsapp - si el usuario responde al flujo una vez finalizado el caso, realiza el salto de caso que no coincide
	
	#	@tc:8126
	#	Escenario: cierra el caso y completa el flujo  - solo WA
	#		Dado que un usuario recibe un flujo de meta por la pieza Enviar HSM 
	#		Y finaliza el caso por inactividad
	#		Y pasa el tiempo de expiracion
	#		Cuando completa el flujo de Meta
	#		Entonces salta al bloque definido cuando no coincide el caso
	#
	#	@tc:8127
	#	Escenario: completa el flujo y crea un caso nuevo  - solo WA
	#		Dado que se inicia un caso con un flujo de meta enviado por la pieza Enviar HSM
	#		Y el usuario no completa el formulario
	#		Y se cierra el caso
	#		Cuando completa el flujo
	#		Entonces salta al bloque configurado para "no coincide caso"
	#		Y se crea un caso nuevo



		