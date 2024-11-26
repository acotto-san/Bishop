#language: es
Característica:modificacion del gateway

Se migran de API las conexiones actuales de Avaya AXP.
En la configuración del gateway no van a existir los campos de channelProviderId y subscriptionId.
Se agrega el campo apiAppKey.
Si social tiene conexión con yflow se agrega el campo agentId.

Regla: se modifica la configuración del gateway ya que se migran de api las conexiones actuales de Avaya
	
	@tc:9408
	Escenario: se extraen dos campos y se agrega el campo apiAppKey
		Dado un cliente con gateway
		Cuando ingresa a la seccion configuracion>gateway
		Entonces no debera existir los campos de channelProviderId y subscriptionId
		Y debera ver el campo apiAppKey con su clave

	@tc:9409
	Escenario: un cliente hace un update de su version de social con gateway
		Dado un cliente con una version previa al cambio de api
		Y realiza el update a la nueva version
		Cuando ingresa a la seccion configuracion>gateway
		Entonces sus datos configurados seran viejos
		
	@tc:9410
	Escenario: cliente nuevo configura la sección de gateway
		Dado un cliente nuevo 
		Cuando configura la seccion de gateway
		Entonces debera tener la configuracion vacia

	@tc:9411
	Esquema del escenario: se configura el gateway con un parámetro inválido
		Dado que se configura o edita la seccion de gateway
		Cuando se completa el <parametro> con un dato invalido
		Entonces no deberia funcionar la conexion de ningun servicio

		Ejemplos: 
		| parametro    |
		| clientId     |
		| clientSecret |
		| region       |
		| accountId    |
		| apiAppKey    |

	@tc:9480
	Escenario: se agrega el campo agentId de yflow
		Dado que se realiza el update con la migracion de api
		Y el sistema esta conectado a yflow
		Cuando el cliente ingresa a la seccion configuracion>gateway
		Entonces debera ver el campo agentId
