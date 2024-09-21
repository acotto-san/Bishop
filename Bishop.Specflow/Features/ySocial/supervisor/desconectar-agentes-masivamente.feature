#language: es
Característica: Desconectar masivamente agentes

	Regla de negocio: Permite que se desconecten muchos agentes al mismo tiempo
		
		@tc:6480
		Escenario: Supervisor desloguea a todos los agentes logueados
			Dado que en la plataforma hay multiples agentes logueados
			Cuando un supervisor utiliza el feature de desconectar agentes masivamente
			Entonces los agentes veran que fueron desconectados cuando interactuen con la web

	Regla de negocio: El alcance del feature llega a todos los agentes de la plataforma
		
		@tc:6481
		Escenario: Supervisor desloguea a agentes que se encuentran en colas sin su supervision
			Dado que en la cola A hay multiples agentes logueados
			Y un supervisor no tiene permisos de supervisor sobre dicha cola
			Cuando el supervisor utilice el feature de desconectar agentes masivamente
			Entonces los agentes veran que fueron desconectados cuando interactuen con la web
