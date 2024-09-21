#language: es

@us:6059
@us:7920

Característica: pieza ingreso multimedia

    Como implementador de un flow
    Quiero poder agregar una pieza
    Para poder definir que tipos de formatos de archivos quiero que sean aceptados o no.

    Aclaracion: La configuracion de la pieza tiene prioridad sobre la configuracion del servicio.

    Se incorporan 2 nuevos switch a la pieza. Uno para capturar el texto y otro para hacer el salto de bloque en caso de que se ingrese un texto.
    En un flow de whatsapp, la pieza tiene un switch extra de validar comandos.

Regla de negocio: La pieza debe aceptar los formatos configurados

	@tc6485
	Esquema del escenario: usuario envia un tipo de archivo al bot
		Dado que el bot1 tiene la pieza "ingreso multimedia" configurada para aceptar todos los tipos de datos
		Cuando un usuario hablando con el bot1 ingrese un archivo tipo <tipo>
		Entonces el bot debera aceptar el archivo

				Ejemplos: 
				| tipo   |
				| Imagen |
				| Texto  |
				| Pdf    |
				| Word   |
				| Audio  |
				| Video  |
				| Excel  |
				| Ppt    |
				| Zip    |

Regla de negocio: La pieza debe rechazar los formatos no configurados

@tc6487
	Esquema del escenario: usuario envia un tipo de archivo no confgurado al bot
		Dado que el bot1 tiene la pieza "ingreso multimedia" configurada para aceptar un archivo tipo <archivo>
		Cuando un usuario hablando con el bot1 ingrese un archivo distinto a <archivo>
		Entonces el bot debera rechazar el archivo

	Ejemplos:
		| archivo |
		| Imagen  |
		| Texto   |
		| Pdf     |
		| Word    |
		| Audio   |
		| Video   |
		| Excel   |
		| Ppt     |
		| Zip     |

Regla de negocio: La pieza tiene prioridad sobre el servicio

	@tc6489
	Escenario: usuario envia un tipo de archivo permitido por el bot pero no por el servicio
		Dado que la pieza se encuentra configurada para aceptar archivos pdf
		Y el servicio tiene configurado no aceptar el pdf
		Cuando el usuario envie un archivo tipo pdf
		Entonces el bot debera tomar el archivo

Regla de negocio: Se puede capturar el texto que ingresa un usuario cuando pasa por esta pieza y definir la continuación del flujo. Se guarda en la variable text por defecto

	@tc:7995
	Escenario: la pieza tiene el switch de excepción de texto desactivado
		Dado que tiene el switch de excepcion de ingreso de texto desactivado
		Y Un usuario interactua con un bot
		Cuando pasa por la pieza multimedia
		Y el usuario ingresa un texto
		Entonces se ejecutan los reintentos de la pieza

	@tc:7996
	Escenario: la pieza tiene el switch de excepción de texto activado y el de salto de bloque desactivado
		Dado que tiene el switch de excepcion de ingreso de texto activado
		Y el salto de bloque por ingreso de texto desactivado
		Cuando un usuario pasa por la pieza multimedia
		Y ingresa un texto
		Entonces la pieza guarda ese texto en la variable "text"
		Y se continua con el flujo

	@tc:7997
	Escenario: la pieza tiene el switch de excepción de texto activado y el de salto de bloque activado
		Dado que tiene el switch de excepcion de ingreso de texto activado
		Y el salto de bloque por ingreso de texto activado
		Cuando un usuario pasa por la pieza multimedia
		E ingresa un texto
		Entonces la pieza guarda ese texto en la variable "text"
		Y continua con el salto de bloque determinado

Regla de negocio: Si la pieza tiene el switch de excepción de ingreso de texto habilitado, no aplica para el caso en que el usuario envie un adjunto con una descripción (texto) en un solo mensaje ya que la presencia del adjunto tiene prioridad.

	@tc:7998
	Esquema del escenario: se envía un adjunto con descripción de texto y tiene el salto de bloque desactivado
	Solo funciona para whatsapp y telegram. En messenger primero llega el texto y luego la imagen.
		Dado que un flujo de <canal> tiene el switch excepcion de ingreso de texto <habilitacion>
		Y el switch de salto de bloque desactivado
		Cuando un usuario ingresa un adjunto con un texto en la descripcion
		Entonces se guarda el adjunto
		Y continua el flujo

		Ejemplos:
			| canal        | habilitacion |
			| whatsapp     | desactivado  |
			| telegram     | desactivado  |
			| whatsapp     | activado     |
			| telegram     | activado     |

	@tc:7999
	Esquema del escenario: se envía un adjunto con descripción de texto y tiene el salto de bloque activado
	Solo funciona para whatsapp y telegram. En messenger primero llega el texto y luego la imagen.
		Dado que un flujo de <canal> tiene el switch excepcion de ingreso de texto activado
		Y el switch de salto de bloque activado
		Cuando un usuario ingresa un adjunto con un texto en la descripcion
		Entonces se guarda el adjunto
		Y no se realiza el salto de bloque por la excepcion de ingreso de datos

		Ejemplos: 
			| canal        |
			| whatsapp     |
			| telegram     |

	@tc:8262
	Escenario: adjunto con descripcion de messenger envia primero texto y luego imagen
		Dado que un usuario de fb envia una imagen con un texto descriptivo
		Y facebook primero envia el texto 
		Y el bot continuó procesando por la via texto
		Cuando facebook envie la imagen adjuntada
		Entonces el bot realizara un salto de bloque a respuesta por defecto

	@tc:8263
	Escenario: se envia adjunto con descripción a pieza y la descripción queda guardada en text
		Nota: quizas este escenario no es exclusivo de whatsapp, habría que chequear telegram
		Dado una interaccion con el bot que se detuvo en una pieza ingreso multimedia
		Y la pieza tiene habilitado el switch de excepcion de ingreso de texto
		Cuando un usuario de whatsapp envia una imagen con un texto descriptivo
		Entonces se guarda el adjunto
		Y la variable texto contiene el texto descriptivo
		Y el flujo continua
		

Regla de negocio: En el canal de whatsapp la pieza tiene un switch para validar comandos. En el caso de que este activo, cuando se ingresa un texto se puede validar la coincidencia con un comando

	@tc:8000
	Esquema del escenario: la opción de validar comandos esta activada y la excepción de ingreso de texto desactivada - canal Whatsapp
		Dado que tiene el switch de validar comandos activado
		Y tiene el switch de excepcion de ingreso de texto desactivado
		Cuando el usuario ingresa un texto que <coincidencia> con un comando
		Entonces <resultado obtenido>

		Ejemplos: 
			| coincidencia | resultado obtenido                        |
			| coincide     | se valida y hace el salto correspondiente |
			| no coincide  | realizar los reintentos de la pieza       |
            
	@tc:8001
	Escenario: las opciones de validar comandos y la excepción de ingreso de texto están desactivadas - canal Whatsapp
		Dado que tiene switch de validar comandos desactivado
		Y tiene el switch de excepcion de ingreso de texto desactivado
		Cuando el usuario ingresa un texto que coincide con un comando
		Entonces se ejecutan los reintentos de la pieza

	@tc:8002
	Escenario: la opción de validar comandos está activada y el salto bloque está desactivado - canal Whatsapp
		Dado que tiene switch de validar comandos activado
		Y tiene el switch de excepcion de ingreso de texto activado
		Y el switch de salto de bloque desactivado
		Cuando el usuario ingresa un texto que <coincidencia> con un comando
		Entonces <resultado obtenido>

		 Ejemplos: 
			| coincidencia | resultado obtenido                                   |
			| coincide     | se valida y hace el salto correspondiente al comando |
			| no coincide  | se captura el texto y continua el flujo              |

	@tc:8003
	Escenario: la opción de validar comandos está activada y el salto bloque está activado - canal Whatsapp
		Dado que tiene switch de validar comandos activado
		Y tiene el switch de excepcion de ingreso de texto activado
		Y el switch de salto de bloque activado
		Cuando el usuario ingresa un texto que <coincidencia> con un comando
		Entonces <resultado obtenido>

		Ejemplos:
			| coincidencia | resultado obtenido                                                      |
			| coincide     | se valida y hace el salto correspondiente al comando                    |
			| no coincide  | se captura el texto y hace el salto correspondiente al ingreso de datos |