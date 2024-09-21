#language: es
@us:7958

Característica: mensaje interactivo de flujo - funcionalidad

	Desde yFlow se debe crear una nueva pieza para poder enviar un mensaje con un flow.

	Exploratorio: verificar que el enlace al flujo de meta funcione desde whatsapp web, 
	la app de escritorio y mobile. En caso de que funcione, verificar que no se rompan los datos


Regla de negocio: El usuario ingresa al flujo de meta en la pantalla 1. El flujo se rompía cuando el usuario iniciaba en otra pantalla ya que habían variables que dependían de pantallas previas, entonces se inhabilitó la opción de cambiar de pantalla.


	@tc:8089
	Escenario: usuario ingresa a la pantalla configurada en la pieza
		 Dado la pieza mensaje interactivo de flujo configurada con un flujo que tiene 3 pantallas
		 Cuando el usuario ingresa al flujo de meta
		 Entonces ingresa a la pantalla 1
		 Y luego puede navegar por las siguientes

#	@tc:8090
#	Escenario: se modifica la pantalla seleccionada en la pieza
#		 Dado la pieza mensaje interactivo de flujo configurada con un flujo que tiene 3 pantallas
#		 Y tiene seleccionada la pantalla 1 como inicio
#		 Cuando el implementador cambia la pantalla seleccionada por la 2da
#		 Entonces el usuario ingresa al flujo por la 2da pantalla
#		 Y luego puede navegar por la 3era
#
#	@tc:8091
#	Escenario: el flujo se rompe cuando tienen variables que dependen de otras pantallas
#		Dado que un flujo de meta tiene dos pantallas
#		Y la pantalla 2 recupera variables de la pantalla 1
#		Cuando se configura el inicio de la pieza en la pantalla 2
#		Entonces el usuario no puede navegar por la pantalla 1
#		Y al finalizar el flujo se marca un error como invalido

Regla de negocio: se capturan los datos de salida en el payload y se envia un mensaje de enviado al completar.
	
	@tc:8092
	Esquema del escenario: se imprimen los datos de salida en el payload
	Exploratorio: el usuario ingresa textos con emojis en el flujo de meta
		Dado que se selecciona un flujo de meta <tipo de flujo> 
		Y el flujo posee datos de salida
		Cuando el usuario completa el flujo
		Entonces se imprimen todos los datos de salida en la variable payload

			Ejemplos: 
			| tipo de flujo                         |
			| con parametros de entrada a completar |
			| sin parametros                        |

	@tc:8093
	Escenario: el payload queda vacío 
		Dado que un usuario ingresa a un flujo de meta
		Y lo deja incompleto 
		Cuando continua con la conversacion con el bot 
		Entonces la variable payload del bot no contendrá resultados del flujo

	@tc:8094
	Escenario: usuario mensaje "enviado" al completar el flujo de meta
		Dado que un usuario completa un formulario
		Cuando lo finaliza exitosamente
		Entonces se envia un mensaje de "enviado"

	@tc:8095
	Escenario: usuario pausa el formulario y luego vuelve a terminarlo
		Dado que un usuario ingresa a un flujo de meta
		Y lo deja incompleto para avanzar con la conversacion
		Cuando vuelve a abrir el flujo de meta
		Y lo termina
		Entonces se imprimen todos los datos de salida en el payload

	@tc:8096
	Esquema del escenario: usuario completa el flujo mientras está encolado o derivado a un operador y se pierden los datos
		Dado que un usuario se encuentra <estado>
		Cuando completa el flujo durante ese momento
		Entonces los datos del usuario enviados por meta se pierden

		Ejemplos: 
			| estado   |
			| encolado |
			| derivado |

Regla de negocio: La variable payload se sobreescribe. El implementador debe recuperar el payload una vez finalizado el flujo para no perder los datos.
	
	@tc:8097
	Escenario: el usuario completa dos flujos de meta 
		Dado que en un flujo aparece la pieza mensaje interactivo de flujo de meta dos veces
		Cuando un usuario completa los dos flujos de meta
		Entonces la variable payload debera imprimirse con los ultimos datos ingresados por el usuario


	@tc:8098
	Escenario: se pierden los datos del flujo de meta porque se reescribe el payload
		Dado que un usuario finaliza el flujo de meta
		Y luego envia otro mensaje que se guarda en la variable payload
		Cuando yflow intenta recuperar el payload posterior al mensaje 2
		Entonces ya no tendra disponibles los datos que envio meta del flujo

Regla de negocio: Si el usuario termina con éxito el flujo dentro del caso y del tiempo de expiración realiza el salto de bloque configurado en la pieza
	
	@tc:8099 
	Escenario: usuario completa el flujo de meta cuando pasa por la pieza
		Dado que el usuario inicia el flujo de meta cuando pasa por la pieza mensaje interactivo de flujo
		Cuando lo completa sin ninguna pausa
		Entonces realiza el salto de bloque al bloque de exito configurado en la pieza


	@tc:8100 
	Escenario: usuario completa el flujo de meta avanzado el flujo conversacional
		Dado que el usuario pasa por la pieza mensaje interactivo de flujo
		Y no completa el flujo de meta
		Cuando avanza en la conversacion vuelve a completarlo
		Entonces realiza el salto de bloque al bloque de exito configurado en la pieza

	@tc:8101
	Escenario: usuario intenta completar dos veces el mismo flujo de meta
		Dado que un usuario completa con exito un flujo de meta
		Cuando avanza en la conversacion
		Y intenta volver a ingresar al flujo de meta
		Entonces no puede hacerlo porque se inhabilita el boton al flujo

Regla de negocio: Si el usuario termina con éxito el flujo pero había expirado su tiempo, realiza el salto de bloque por expiración

	@tc:8102
	Escenario: usuario completa el flujo dentro del caso con el tiempo expirado
		Dado que la pieza tiene configurado una hora de tiempo de expiracion del flujo
		Cuando el usuario completa el flujo de meta a las 2 horas de haber pasado por la pieza
		Y continua en el mismo caso 
		Entonces salta al bloque configurado por expiracion del tiempo

	@tc:8103
	Escenario: usuario completa el flujo dentro del caso y dentro del tiempo configurado
		Dado que la pieza tiene configurado una hora de tiempo de expiracion del flujo
		Cuando el usuario completa el flujo de meta a los 30 min de haber pasado por la pieza
		Y continua en el mismo caso 
		Entonces salta al bloque configurado por exito

Regla de negocio: la validación del caso tiene prioridad ante el tiempo de expiración. 

	@tc:8104
	Escenario: usuario completa flujo en otro caso y vencido el tiempo de expiración
		Dado que un usuario pasa por la pieza mensaje interactivo de flujo
		Y avanza con la conversacion
		Y vence el tiempo de expiracion del flujo de meta
		Cuando termina el caso
		Y completa el flujo de meta en un caso nuevo
		Entonces salta al bloque configurado para "no coincide caso"

Regla de negocio: si el usuario responde al flujo de meta una vez finalizado el caso realiza el salto de bloque por no coincidir caso.

	@tc:8105 
	Escenario: usuario completa el flujo en otro caso, dentro del tiempo de expiracion
		Dado que la pieza tiene configurado dos hora de tiempo de expiracion del flujo
		Y un usuario inicia un caso que dura 15 minutos
		Cuando el usuario completa el flujo de meta a los 20 min de haber pasado por la pieza
		Entonces salta al bloque configurado por no coincidir caso
		Y se crea un caso nuevo

Regla de negocio: la pieza no frena el flujo conversacional. No es obligatorio que el usuario la responda cuando pasa por esa pieza
	
	@tc:8106 
	Escenario: la pieza no detiene el flujo conversacional
		Dado un flujo conversacional que inicia con la pieza mensaje interactivo de flujo
		Y a continuacion estan configuradas dos piezas mensajes
		Cuando un usuario inicia un caso
		Entonces recibira las tres piezas

	@tc:8107
	Escenario: usuario deja el flujo incompleto
		Dado un usuario pasa por la pieza mensaje interactivo de flujo
		Y inicia el flujo de meta
		Cuando lo deja incompleto
		Y avanza en la conversacion con el bot
		Entonces no recibe el mensaje "enviado"

Regla de negocio: Si se configuran varias piezas, se respetara el salto de bloque configurado en cada una

	@tc:8108
	Escenario: flujo conversacional con varios flujos de meta
		Dado que el flujo conversacional tiene las siguientes piezas mensajes interactivo de flujo:
			| Pieza | flujo        | salto de exito | salto de expiracion | salto no coincide caso |
			| 1     | Satisfaccion | bienvenida     | cierre              | otro caso              |
			| 2     | Satisfaccion | exito          | bienvenida          | cierre                 |
		Cuando el usuario completa el flujo de la pieza <pieza>
		Y <estado>
		Entonces <resultado obtenido>

			Ejemplos: 
			| pieza | estado                                             | resultado obtenido |
			| 1     | completa dentro del caso y del tiempo              | bienvenida         |
			| 2     | completa el flujo en otro caso y vencido el tiempo | cierre             |
			| 1     | completa vencido el tiempo, dentro del caso        | cierre             |
			| 2     | completa vencido el tiempo, dentro del caso        | bienvenida         |

