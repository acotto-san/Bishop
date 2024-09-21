#language: es
Característica: Marcar mensaje como pendiente para no cerrar el caso por inactividad
	Como la pieza ingreso de datos contempla que el nosotros detenemos nuestro envio de mensajes para esperar a que el usuario
	escriba un dato en particular entonces deseamos pausar el tiempo que se contabiliza para cerrarle el caso por inactivo.
	Entonces podemos setear un timer con el tiempo que se le va a aguardar al usuario su respuesta, una vez agotaddo el timer 
	podemos hacer un salto de bloque o podemos imprimirle un nuevo mensaje.

	Este feature no funciona en Chat porque no se desarrollo y en caso de insertarse mediante un flujo generico va a generar que el caso se rompa.

	Regla de negocio: Al agotar el timer se puede ejecutar una acción
		
		@tc:9386 @flowjson
		Escenario: Ulises no responde a una pieza ingresar datos y le envían un mensaje
			Dado que a Ulises un bot le solicita ingresar un dato mediante la pieza Ingreso de Datos
			Y la pieza tiene configurado enviar un mensaje a los 10 minutos
			Cuando transcurren 10 minutos desde que la pieza fue ejecutada sin que Ulises respondiera
			Entonces el bot le enviara el mensaje configurado en la pieza Ingreso de Datos para incentivarle a responder

		@tc:9387 @flowjson
		Escenario: Ulises no responde a una pieza ingresar datos y el caso sigue en otro bloque
			Dado que a Ulises un bot le solicita ingresar un dato mediante la pieza Ingreso de Datos
			Y la pieza tiene configurado hacer un salto de bloque a los 10 minutos
			Cuando transcurren 10 minutos desde que la pieza fue ejecutada sin que Ulises respondiera
			Entonces el bot continuara la ejecucion del bloque que hay configurado en la pieza Ingreso de Datos

	Regla: el timer de marcar como pendiente no altera el tiempo de inactividad que controla ySocial para cerrar casos

		@tc:9388
		Escenario: Caso cierra por inactividad antes de acabar el tiempo de pendiente de Ingreso de Datos
			Dado que a Ulises ejecutó la pieza Ingreso de Datos que estará pendiente por 30 minutos
			Pero ySocial cierra los casos que acumulan 10 min de inactividad en yFlow
			Cuando hayan transcurrido 10 minutos desde que el entrante de Ulises ejecutó la pieza
			Entonces el caso sera cerrado por ySocial por inactividad

		@tc:pendiente @flowjson:9386 @flowjson:9387
		Esquema del escenario: Caso cierra por inactividad luego de agotar el tiempo pendiente de la pieza Ingreso de Datos
			Dado que ySocial cierra los casos que acumulan 5 min de inactividad en yFlow
			Y a Ulises la pieza Ingreso de datos le <accion-de-pieza> luego de agotar el tiempo de la pieza
			Cuando se agoten los 5 minutos de inactividad desde el último entrante de Ulises
			Entonces el caso sera cerrado por ySocial por inactividad

			Ejemplos: 
				| accion-de-pieza     |
				| envio un mensaje    |
				| salto a otro bloque |