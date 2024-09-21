#language: es
Característica: Guardar el contexto entre yFlow-ySocial de un caso cuando yFlow termina su ejecución
	Como desarrollador de la plataforma
	Quiero que cada vez que yFlow termina de ejecutar la lógica de un flujo y se detiene a esperar que el usuario escriba
	Entonces se guarde de alguna manera los datos de variables/caso/ultimo bloque/ultima pieza
	Para que cuando el usuario escriba e yFlow necesite continuar la ejecución pueda recuperar esos datos

	Regla: yFlow guarda los datos del contexto del caso (contexto entre ySocial-yFlow) en local storage
		
		@tc:7506
		Escenario: yFlow termina de ejecutar su invocacion y genera un json
			Dado que un caso acaba de iniciarse en yFlow 
			Cuando el flujo se detiene en una pieza ingreso de datos
			Entonces en el local storage de la aplicacion se genera un json para guardar el contexto del caso

		@tc:7507
		Escenario: yFlow termina de ejecutar su invocacion y actualiza un json
			Dado que hay un caso abierto en yFlow que ya posee su json de contexto en el storage
			Cuando el flujo se detiene nuevamente en una pieza ingreso de datos
			Entonces el json sera actualizado con la ultima informacion

	Regla: los json que se crean guardan informacion que el flujo conocia al momento de terminar la ejecucion

		@tc:7508
		Escenario: un flujo genera un json con los valores de las variables
			Dado un caso que se inicia en yFlow
			Y se guardan en las variables de usuario ciertos datos
			Cuando el flujo se detiene en una pieza ingreso de datos
			Entonces el contenido del json generado debe tener los valores de las variables			
	
	Regla: cuando yFlow debe continuar el caso recupera los datos del json
		
		@tc:7509
		Escenario: se recuperan los datos de un json cuando el usuario continua el caso
			Dado un caso que habia quedado detenido en una pieza ingreso de datos 
			E yflow habia dejado un json con ciertos valores en las variables del flujo
			Cuando el usuario vuelva a escribir
			E yFlow recupere los valores de variables que habia en el json
			Entonces seran valores accesibles desde el mismo flujo

		@tc:7510
		Escenario: se recuperan los datos de un json cuando un agente transfiere el caso al bot
			Dado un caso que inicio por yFlow
			Y al derivarse a la cola yFlow genero un json con datos de contexto
			Cuando un agente vuelva a transferir el caso al bot
			Entonces yFlow debe recuperar los valores de variables del json

		@tc:7511
		Escenario: se recuperan los datos de un json cuando yFlow es invocado para cerrar un caso por inactividad
			Dado un caso que inicio por yFlow y genero un json con datos de contexto
			Y quedo acumulando inactividad por una pieza ingreso de datos
			Cuando ySocial intente cerrar el caso por inactividad
			E invoque a yFlow para cerrar el caso
			Entonces cuando el flujo continue en el bloque "cierre por inactividad" debera recuperar los valores de variables del json			

	Regla: un servicio se encarga de limpiar los json generados
	
		@tc:7512
		Escenario: ySocial cierra un caso y un servicio se encarga de limpiar el storage
			Dado que ySocial notifico a un service bus que se cerraron los casos "123" y "789"
			Cuando el servicio que limpia el storage recibe la notificacion
			Entonces eliminara los archivos "123.json" y  "789.json" de la carpeta