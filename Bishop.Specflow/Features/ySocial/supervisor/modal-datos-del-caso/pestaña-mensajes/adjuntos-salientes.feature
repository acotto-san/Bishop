#language: es
Característica: Visualizar los mensajes salientes con adjuntos en la conversación

Regla de negocio: Si el adjunto lo envio el bot con el método URL el adjunto es accesible al supervisor

	@tc:pendiente
	Escenario: Supervisor visualiza imagen enviada por un bot
		Dado que un bot envio por metodo URL un adjunto imagen
		Cuando el supervisor visualice el mensaje en el modal Datos del Caso
		Entonces vera una previsualización de la imagen

	@tc:pendiente
	Escenario: Supervisor visualiza la url de un pdf enviado por un bot
		Dado que un bot envio por metodo URL un adjunto pdf
		Cuando el supervisor visualice el mensaje en el modal Datos del Caso
		Entonces vera el enlace utilizado en la pieza para el envío del adjunto

Regla de negocio: Si el adjunto lo envio el bot hosteandolo por ser un binario o base64 entonces el supervisor no puede verlo

	@tc:pendiente
	Esquema del escenario: Supervisor visualiza vacío el mensaje donde un bot envio un adjunto
		Dado que un bot envio un adjunto utilizando un <tipo-dato>
		Cuando el supervisor visualice el mensaje en el modal Datos del Caso
		Entonces vera solo el nombre del archivo 
		Y no podra previsualizarlo o descargarlo

		Ejemplos: 
			| tipo-dato |
			| binario   |
			| base64    |