#language: es
@us:7958
Característica: Configuración de la pieza mensaje interactivo de flujo

	Se requiere soportar la integración con los flows de META, 
	para poder llamarlos desde yFlow desde un botón de mensaje interactivo 
	y recibir los datos capturados en el callback para parsearlos luego en yflow.

	Exploratorio: realizar test cases de comportamientos compartidos a todas las piezas.

	Regla de negocio: Esta pieza es exclusiva de Whatsapp

		@tc:8072
		Esquema del escenario: la pieza solo está disponible en flujo de whatsapp
		Exploratorio: va a estar disponible en Lite?
			Dado que un implementador configura un flujo de <servicio>
			Cuando busca la pieza de mensaje interactivo de flujo
			Entonces <resultado> la pieza en piezas avanzadas

			Ejemplos: 
				| servicio      | resultado     |
				| chat          | no encontrara |
				| Fb Messenger  | no encontrara |
				| Twitter       | no encontrara |
				| instagram     | no encontrara |
				| whatsapp      | encontrara    |
				| skype         | no encontrara |
				| mercado libre | no encontrara |
				| telegram      | no encontrara |
				| generic       | no encontrara |
				| google        | no encontrara |
				| apple         | no encontrara |

		@tc:8073
		Esquema del escenario: se importa el bloque con la pieza a un flujo de otro servicio
		Exploratorio: alternar pruebas entre importar el bloque o grupo de bloques
			Dado que un bloque de un flujo de whatsapp tiene la pieza mensaje interactivo de un flujo
			Cuando se importa ese bloque o grupo de bloques a un flujo de <servicio>
			Entonces <resultado> la pieza en el bloque importado

			Ejemplos: 
				| servicio      | resultado     |
				| chat          | no encontrara |
				| Fb Messenger  | no encontrara |
				| Twitter       | no encontrara |
				| instagram     | no encontrara |
				| whatsapp      | encontrara    |
				| skype         | no encontrara |
				| mercado libre | no encontrara |
				| telegram      | no encontrara |
				| generic       | no encontrara |
				| google        | no encontrara |
				| apple         | no encontrara |

		@tc:8074
		Esquema del escenario: se importa un json con la pieza a un flujo de otro servicio
			Dado que un flujo de whatsapp tiene la pieza mensaje interactivo de un flujo
			Cuando se importa ese json a un flujo de <servicio>
			Entonces <resultado> la pieza en el flujo

			Ejemplos: 
				| servicio      | resultado     |
				| chat          | no encontrara |
				| Fb Messenger  | no encontrara |
				| Twitter       | no encontrara |
				| instagram     | no encontrara |
				| whatsapp      | encontrara    |
				| skype         | no encontrara |
				| mercado libre | no encontrara |
				| telegram      | no encontrara |
				| generic       | no encontrara |
				| google        | no encontrara |
				| apple         | no encontrara |

	Regla de negocio: Los formularios disponibles en el desplegable de la pieza son los asociados a cada linea de Whatsapp, se pueden verificar en ySocial. Por el momento, en Meta, solo se pueden crear o eliminar.

		@tc:8075
		Escenario: una linea de whatsapp tiene sus flujos de meta asociados
			Dado que se selecciona la linea 2014 de whatsapp en la pieza mensaje interactivo de flujo
			Cuando se despliega la lista de flujos de Meta
			Entonces aparecen los mismos flujos configurados en ySocial con estado "Publicado"

		@tc:8076
		Esquema del escenario: se da de alta o baja un flujo de meta
			Dado un flujo de "Satisfaccion" en Meta
			Cuando se da de <status> ese flujo en la linea 2014
			Y en servicio se actualiza el estado de los flujos
			Entonces el flujo <resultado> en el desplegable de la pieza mensaje interactivo de flujo

			Ejemplos: 
				| status | resultado  |
				| alta   | aparece    |
				| baja   | desaparece |

		@tc:8077
		Escenario: una linea de whatsapp no tiene ningun flujo asociado
			Dado que la linea 2014 no tiene ningun flujo de meta asociado
			Cuando se elige la pieza mensaje interactivo de linea
			Entonces no aparecera la linea en el desplegable

		@tc:8266
		Escenario: una linea deshabilitada no aparece en la pieza
			Dado que la linea 2014 tiene flujos de meta asociados
			Y el servicio de la linea en ySocial se encuentra deshabilitado
			Cuando se elige la pieza mensaje interactivo de flujo
			Entonces no aparecera la linea en el desplegable

	Regla de negocio: Una vez que se elige un flujo de meta se despliegan las pantallas. Se inhabilitó este desplegable ya que se generaban errores en el flujo.

		@tc:8078 
		Escenario: se selecciona un flujo con dos pantallas
			Dado que el flujo "Satisfaccion" tiene dos pantallas configuradas en meta
			Cuando se elige el flujo "Satisfaccion" en la pieza mensaje interactivo de flujo
			Entonces aparecera la pantalla 1 en un desplegable inhabilitado

		#@tc:8079 
		#Escenario: se cambia de flujo seleccionado y aparecen las pantallas correspondientes
		#	Dado que el flujo "Satisfaccion" tiene dos pantallas configuradas en meta
		#	Y el flujo "Log in" tiene una pantalla configurada
		#	Y en la pieza mensaje interactivo de flujo esta seleccionado el flujo "Satisfaccion"
		#	Cuando se cambia al flujo "Log in"
		#	Entonces aparecera una pantalla en el desplegable de pantallas a elegir

	Regla de negocio: Algunos flujos de meta se pueden parametrizar con datos de entrada que se completan desde variables de yflow. Deben ser variables del mismo tipo de dato configurado en meta

		@tc:8080
		Escenario: pantalla de un flujo que despliega 2 parámetros a completar
			Dado que la pantalla 1 del flujo "Satisfaccion" tiene 2 parametros de entrada a configurar
			Cuando se selecciona la pantalla 1 del flujo "Satisfaccion" en la pieza mensaje interactivo de flujo
			Entonces apareceran 2 campos a completar con variables
		
		@tc:8081
		Escenario: se valida el tipo de dato de entrada de la pantalla elegida
		La composición de cada flujo se puede verificar en las plantillas de ysocial
			Dado que una pantalla de un flujo de meta tiene 3 parametros de entrada a configurar del siguiente tipo:
				| parametro | tipo de dato |
				| 1         | texto        |
				| 2         | booleano     |
				| 3         | arreglo      |
			Cuando se elige esa pantalla en la pieza mensaje interactivo de flujo
			Y se despliegan los parametros a completar
			Entonces solo se podra completar con variables del mismo tipo correspondiente a cada parametro

		@tc:8082
		Escenario: pieza no pide datos de entrada al flujo no tenerlos
			Dado que un flujo no tiene parametros de entrada para configurar
			Cuando se elije dicho flujo en la pieza mensaje interactivo de flujo
			Entonces no deberia aparecer ningun campo a completar con variables

	Regla de negocio: se puede personalizar el mensaje que acompaña el flujo de meta con un header, un body,footer y nombre del botón.
	
		@tc:8083
		Escenario: se configura el mensaje de la pieza
		Exploratorio: ingresar emojis en el botón y en los otros campos
			Dado que se configura la pieza mensaje interactivo de flujo con las siguientes caracteristicas:
			| header        | body                                   | footer                          | boton          |
			| fecha del dia | hola usuario, por favor deje sus datos | tiene dos horas para participar | Ir al concurso |
			Cuando el usuario pasa por la pieza
			Entonces el mensaje le devolvera lo que fue configurado

		@tc:8084
		Escenario: el body alerta que se supera el límite de caracteres
			Dada una pieza de mensaje interactivo de flujo 
			Cuando el implementador ingresa más de 1024 caracteres
			Entonces el body tendrá una marca de invalidez
			Y la pieza sera considerada inválida

		@tc:8085
		Escenario: el tiempo de expiracion sera posible entre la hora y las 24hs
			Dado que la pieza mensaje interactivo puede expirarse
			Cuando un implementador configura su tiempo de expiracion
			Entonces como minimo podra configurarse a la hora
			Y como maximo a las 24hs

	Regla de negocio: la pieza quedará inválida cuando algunos de sus campos queden vacíos.
		
		@tc:8086
		Esquema del escenario: se invalida la pieza cuando quedan campos vacíos 
			Dado que un implementador configura la pieza mensaje interactivo de flujo
			Cuando deja vacia <componente>
			Entonces la pieza queda invalida
			Y no podra publicar el flujo

				Ejemplos:
					| componente                             |
					| los saltos de bloque de destino        |
					| las variables de parametros de entrada |
					| el body del mensaje                    |
					| el boton del mensaje                   |
		
		@tc:8087 
		Escenario: la pieza pierde la referencia con los saltos de bloque destino
			Dado que la pieza mensaje interactivo de flujo tenia saltos de bloque configurados
			Cuando el bloque es importado a otro flujo de whatsapp
			Y pierde la referencia con los saltos de bloque 
			Entonces la pieza queda invalida

		@tc:8088
		Escenario: se invalida la pieza cuando se elimina el flujo
			Dado que la pieza mensaje interactivo de flujo tenia el flujo "Satisfaccion" seleccionado
			Y el flujo "Satisfaccion" es eliminado de ySocial
			Cuando el implementador ingresa al flujo de whatsapp 
			Entonces la pieza queda invalida
		
		@tc:8267
		Escenario: Se invalida la pieza cuando una variable en uso deja de existir
			Dado que una pieza de mensaje interactivo de flujo se encuentra configurada 
			Y posee variables como parametros de entrada
			Cuando el implementador elimina una de las variables desde la lista de variables del bot
			Entonces el campo del parametro que poseía la variable se encontrara vacío
			Y la pieza queda invalida
			