#language: es
Característica: Adjuntar los archivos que poseo en el portapapeles 
	Dado que soy un agente que esta respondiendo conversaciones y envio adjuntos
	Quiero poder aprovechar el portapapeles de windows
	Asi soy más agil agregando los archivos con control+v

	Regla de negocio: El control de formato permitido aplica al pegado del portapapeles

	Regla de negocio: En modo chat se limita la cantidad a 1 archivo para messenger y telegram

		@tc:8998
		Esquema del escenario: Agente intenta pegar multiples archivos a la conversacion y solo se adjunta uno
			Dado que un agente esta gestionando un caso de un servicio de canal <tipo-canal> en modo chat
			Y tiene multiples archivos copiados al portapapeles
			Cuando intenta pegar con control+v
			Entonces solo 1 sera adjuntado

			Ejemplos: 
				| tipo-canal |
				| messenger  |
				| telegram   |