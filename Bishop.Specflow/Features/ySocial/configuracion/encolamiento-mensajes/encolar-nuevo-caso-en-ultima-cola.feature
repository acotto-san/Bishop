#language: es
Característica: Cuando usuario inicia un nuevo caso encolarlo en la ultima cola gestionada


	Regla de negocio: Evaluación de invocación de yFlow en base a encolamiento

		@tc:9865
		Escenario: Un nuevo caso se encola en la cola default (AAA) si se vencio el tiempo configurado
			Dado a la configuracion de los tiempos:

			| mover a la ultima ola | No invocar a yflow | cola por defecto por servicio |
			| 10 minutos            | 20 minutos         | cola "AAA"                    |
			Y el caso fue cerrado en la cola "BBB"
			Cuando el usuario abre un nuevo caso a los 15 minutos
			Entonces el nuevo caso debe encolarse en la cola default "AAA"

			
	Regla de negocio: Encolamiento de casos según la regla de tiempo

		@tc:9863
		Escenario: Un nuevo caso se encola en BBB si el último caso fue gestionado en esa cola
			Dado a la configuracion de los tiempos:
			| mover a la ultima cola | No invocar a yflow | ultima cola de gestion |
			| 6 minutos              | 7 minutos          | cola "BBB"             |
			Cuando el caso fue cerrado hace 5 minutos
			Entonces el nuevo caso debe encolarse en la cola "BBB"
			

		@tc:9864
		Escenario: Un nuevo caso es gestionado por el bot si se abre después de 50 minutos del cierre del último caso
			Dado que el tiempo configurado es igual a 40 minutos
			Y el tiempo configurado NO invocar a yFlow es de 30 minutos
			Cuando un caso gestionado en la cola "BBB" se cerro 
			Y el usuario vuelve a escribir a los 50 minutos
			Entonces el nuevo caso debe ser gestionado por el bot


	Regla de negocio: Un caso valido sera encolado en la última cola gestionada

		@tc:9866
		Escenario: El caso se encola en la última cola gestionada si es válido para múltiples features
			Dado a la configuracion de los tiempos:
			| mover a la ultima cola | No invocar a yflow | ultima cola de gestion |
			| 20 minutos             | 15 minutos         | cola "BBB"             |
			Cuando el usuario abre un nuevo caso 16 minutos
			Entonces el nuevo caso debe encolarse en la última cola gestionada "BBB"
			Y no invoca a yFlow


	Regla de negocio: Configuraciones de tiempo

		@tc:9867
		Escenario: Se configura el valor minimo de 60 segundos
			Dado el valor mínimo configurable para mover el caso es 60 segundos
			Y un usuario tiene su último caso gestionado en la cola "BBB"
			Cuando abre un caso nuevo a los 50 minutos
			Entonces el caso debe encolarce a la cola correspondiente

		@tc:9868
		Escenario: Se configura el valor maximo de 600 segundos
			Dado el valor maximo configurable para mover el caso es 600 segundos
			Y un usuario tiene su último caso gestionado en la cola "BBB"
			Cuando abre un caso nuevo a los 500 minutos
			Entonces el caso debe encolarce a la cola correspondiente