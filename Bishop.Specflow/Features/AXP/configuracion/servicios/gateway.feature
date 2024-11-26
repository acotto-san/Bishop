#language: es
@us:9174
Característica: configuración del gateway de un servicio
	Cada servicio va a tener dos parámetros de gateway:
	El businessAccountName es único, va a ser uno por servicio.
	El channelProviderId va a encapsular servicios del mismo tipo. Puede existir más de un channelProviderId de WA por ejemplo, 
	pero un channelProviderId no puede ser el mismo para fb e ig.
	Estas definiciones no tienen una validación al completarse los datos. Estos datos se los da Avaya al cliente.

	El funcionamiento de los servicios no debería modificarse con este cambio. 
	Exploratorio: probar todos los servicios.

Regla: Solo los clientes que tienen gateway verán modificaciones en la configuración de sus servicios
	
	@tc:9412
	Escenario: cliente con gateway visualiza los cambios
		Dado un cliente con gateway
		Cuando ingresa a la edicion o creacion de un servicio 
		Entonces aparece la solapa o los datos de gateway

	@tc:9413
	Escenario: cliente sin gateway no visualiza los cambios
		Dado un cliente sin gateway
		Cuando ingresa a la edicion o creacion de un servicio 
		Entonces no observa la pestaña gateway en la edicion o creacion de un servicio

Regla: Ambos parámetros son obligatorios. Pueden dejarse vacíos para continuar con la configuración del servicio.

	@tc:9414
	Escenario: se visualizan los dos parámetros del gateway
		Dado un cliente de gateway
		Cuando ingresa a la configuracion o edicion del gateway de un servicio
		Entonces apareceran dos parametros a completar: businessAccountName y channelProviderId

	@tc:9415
	Escenario: se edita servicio con ambos parámetros de gateway vacíos
	Exploratorio: probar todos los servicios.
		Dado un cliente que tenia servicios activos
		Y ahora observa los nuevos campos en la edicion de un servicio
		Cuando deja ambos parametros vacios
		Entonces puede guardar los cambios
		Y el servicio todavia no queda activo para la conexion de mensajes

	@tc:9416
	Escenario: se edita servicio con los dos parámetros de gateway completos
	Exploratorio: probar todos los servicios.
		Dado un cliente que tenia servicios activos
		Y ahora observa los nuevos campos en la edicion de un servicio
		Cuando completa ambos parametros
		Entonces guarda la configuracion
		Y el servicio funciona activamente

	@tc:9417
	Esquema del escenario: se edita servicio con un solo parámetro de gateway completo
	Exploratorio: probar todos los servicios.
		Dado un cliente que tenia servicios activos
		Y ahora observa los nuevos campos en la edicion de un servicio
		Cuando completa solamente el parametro <parametro>
		Y el otro lo deja vacio
		Entonces no podra guardar la edicion

			Ejemplos:
				|parametro          |
				|businessAccountName|
				|channelProviderId  |
	
	@tc:9418
	Escenario: se crea servicio nuevo con los dos parámetros de gateway vacíos
	Exploratorio: probar todos los servicios.
		Dado un cliente que crea un servicio nuevo
		Cuando deja ambos parametros vacios
		Entonces puede guardar la configuracion del servicio
		Y el servicio todavia no queda activo para la conexion de mensajes

	@tc:9449
	Escenario: se crea o edita un servicio nuevo con los dos parámetros de gateway vacios y conexion a yflow
		Exploratorio: probar todos los servicios.
		Dado un cliente que crea un servicio nuevo
		Y lo conecta a yflow
		Cuando deja ambos parametros vacios
		Y puede guardar la configuracion del servicio
		Entonces la interacción con el bot no deberia fallar
		Y falla la derivacion al gateway

	@tc:9419
	Escenario: se crea servicio nuevo con los dos parámetros de gateway completos
	Exploratorio: probar todos los servicios.
		Dado un cliente que crea un servicio nuevo
		Cuando completa ambos parametros
		Entonces guarda la configuracion
		Y el servicio funciona activamente

	@tc:9420
	Esquema del escenario: se crea servicio nuevo con un solo parámetro de gateway completo
	Exploratorio: probar todos los servicios.
		Dado un cliente que crea un servicio nuevo
		Cuando completa solamente el parametro <parametro>
		Y el otro lo deja vacio
		Entonces no podra guardar la configuracion del servicio

			Ejemplos:
				|parametro          |
				|businessAccountName|
				|channelProviderId  |

#se comentan los siguientes escenarios ya que no se observó ninguna validación en el front ni en el back, ni del lado de avaya. 
#Los servicios fueron configurados con cualquier parámetro válido, se permiten duplicados y las conexiones funcionan igual.

#	Regla: el channelProviderId puede usarse para varios servicios del mismo tipo. El businessAccountName es único.
#
#	@tc:9421
#	Escenario: se crea servicio de mismo canal con mismo channelProviderId
#		Dado que se tiene un servicio de messenger configurado con su channelProviderId
#		Y se da de alta otro servicio de messenger
#		Cuando se usa el mismo channelProviderId 
#		Entonces falla la conexion del webhook ya que tiene una suscriptionId existente
#		Y no se genera ningun error en el servicio
#		#channelproviderid ya usado, no se genera ninguna suscripcion porque ya existe (pero no es un error)
#
#	@tc:9422
#	Escenario: se crea un servicio con channelProviderId de otro tipo de canal
#		Dado que se tiene configurado un servicio de whatsapp
#		Cuando se crea un servicio de instagram
#		Y se le ingresa el channelProviderId de whatsapp
#		Entonces no deberia guardarse la configuracion del servicio
#		
	@tc:9423
	Esquema del escenario: se completa la configuración con un parámetro inválido
		Dado un cliente que crea un servicio nuevo
		Cuando completa el parametro <parametro> con un formato invalido
		Entonces va a fallar la conexion con el servicio 

			Ejemplos:
				|parametro          |
				|businessAccountName|
				|channelProviderId  |
#
#	@tc:9424
#	Escenario: Se intenta repetir un businessAccountName
#		Dado que existe un servicio de wa con el businessAccountName "15241534name"
#		Cuando se crea o edita otro servicio de wa nuevo
#		Y se usa el mismo businessAccountName "15241534name" en la configuracion
#		Entonces no podra guardarse la configuracion
#
#	@tc:9425
#	Escenario: Se da de baja una suscripcion de un servicio
#		Dado que se tiene un servicio configurado
#		Cuando se da de baja su suscripcion
#		Entonces el sistema deberia crearle una nueva suscriptionId al guardar su configuracion

	#pedir ayuda, hay que pegarle a un endpoint para dar de baja la suscripción
	
	@tc:9426
	Escenario: servicio que se deshabilita y se vuelve a habilitar
		Dado que se tiene un servicio de wa configurado con los parametros de gateway
		Y se deshabilita
		Y deja de funcionar
		Cuando se vuelve a habilitar
		Entonces deberia funcionar correctamente

Regla: un servicio con los parámetros del gateway configurado debería tener un funcionamiento normal en su mensajería
	
	@tc:9427
	Escenario: mensajes salientes y entrantes de un servicio con gateway
	Exploratorio: probar todos los servicios, con y sin yflow
		Dado un servicio configurado con los parametros del gateway
		Cuando recibe entrantes
		Y envia salientes
		Entonces no se ve ningun error en su comportamiento


		#con el bot debería funcionar