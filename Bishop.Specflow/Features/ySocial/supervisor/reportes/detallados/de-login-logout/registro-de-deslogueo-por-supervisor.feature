#language: es
@us:6087
Característica: Visualizar si un supervisor desconecta a un agente
	Como supervisor
	Quiero poder ver en el detallado de login-logout el motivo de desconexion del agente
	Para poder diferenciarlo de los deslogueos voluntarios


	Regla de negocio: se identifica que fue un supervisor el que deslogueo al agente

		@tc:6240
		Escenario: Se visualiza en registro que un supervisor fue el causante del deslogueo
			Dado que un supervisor desloguea a un agente
			Cuando ingrese al detallado de login-logout
			E ingrese a ver la informacion de la actividad reciente del agente
			Entonces debera ver en la descripcion que el agente fue desconectado forzosamente por un supervisor

		@tc:6241
		Escenario: Supervisor desloguea varios agentes de forma masiva
			Dado que un supervisor utilizo la funcionalidad de deslogueo masivo de agentes
			Cuando vea la informacion de la actividad reciente de los agentes desde el reporte detallado de login-logout
			Entonces debera ver en la descripcion "el agente fue desconectado forzosamente por el supervisor"

	Regla de negocio: El registro debe poder indicar cual supervisor fue el que desconectó al agente

		@tc:6237
		Escenario: Se visualiza el nombre completo en un registro de deslogueo por accion del supervisor 
			Dado que el nombre completo del supervisor que desconecto a un agente es "Pepe Admin"
			Cuando un supervisor ingrese al detallado de login-logout
			E ingrese a ver la informacion de la actividad reciente del agente
			Entonces debera ver en la descripcion "el agente fue desconectado forzosamente por el supervisor "Pepe Admin"

	Regla de negocio: El detalle también se puede apreciar en el archivo que se obtuvo al exportar el reporte

		@tc:6239
		Escenario: En un reporte de login-logout exportado se visualiza que un agente fue deslogueado por un supervisor	
			Dado que el registro Historico del Agente posee un registro de desconexion forzada por un supervisor
			Cuando se exporta el reporte
			Entonces debera ver en la descripcion que el agente fue desconectado forzosamente por un supervisor

