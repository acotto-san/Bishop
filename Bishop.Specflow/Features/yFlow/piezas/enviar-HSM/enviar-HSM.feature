#language: es
Característica: Tener una pieza que envíe una plantilla HSM a un usuario de whatsapp
	us:3720 es el original donde se testeó por primera vez la pieza

	Como implementador que esta armando un flujo
	Quiero una pieza para poner estratégicamente que envíe una plantilla HSM a un número que le setee
	Para poder pactar con el usuario continuar por whatsapp y abrir la comunicación por esa vía con una plantilla HSM

	Regla de negocio: Puede elegirse que servicio usar

	Regla de negocio: Puede elegirse cual plantilla enviar

	Regla de negocio: El telefono a donde se enviara es configurable

	Regla de negocio: La plantilla puede estar compuesta por diferentes componentes
		
		@tc:7645
		Escenario: yFlow envía una plantilla compuesta por botones mixtos
			Dado que se creo una plantilla con botones mixtos
			Y se habilito su uso para integraciones
			Cuando un implementador configure la pieza de envio HSM en un flujo
			Entonces dicha plantilla estara disponible

	Regla de negocio: La plantilla es enviada en el momento que la pieza es ejecutada

		@tc:7646
		Esquema del escenario: usuario recibe plantilla HSM enviada por el bot
			Dado un caso iniciado en el bot
			Y que el flujo posee configurada la siguiente pieza de envio HSM 
				| propiedad       | valor             |
				| destinatario    | 549110123456      |
				| header          | <header>          |
				| parametros body | <parametros body> |
				| footer          | <footer>          |
				| botones         | <botones>         |
			Cuando el usuario navega hasta ejecutar la pieza
			Entonces ySocial enviara la plantilla
			Y sera recibida por el usuario de whatsapp 549110123456

			Ejemplos: por pairwise 60 variantes cubiertas en 18
				| header            | botones        | parametros body | footer |
				| header multimedia | cta offer code | no              | no     |
				| header multimedia | QR             | si              | si     |
				| header texto      | cta web        | si              | no     |
				| header texto      | cta call       | no              | si     |
				| header texto      | cta offer code | si              | si     |
				| header texto      | mixtos         | no              | si     |
				| header ubicacion  | cta call       | si              | no     |
				| header ubicacion  | ta offer code  | si              | si     |
				| header ubicacion  | QR             | no              | no     |
				| header ubicacion  | mixtos         | si              | si     |
				| header ubicacion  | cta web        | no              | si     |
				| header multimedia | mixtos         | no              | no     |
				| header multimedia | cta web        | si              | si     |
				| header multimedia | cta call       | si              | no     |
				| header texto      | QR             | no              | si     |
				| header texto      | mixtos         | si              | no     |
				| header texto      | cta web        | si              | si     |
				| header texto      | cta offer code | si              | no     |
