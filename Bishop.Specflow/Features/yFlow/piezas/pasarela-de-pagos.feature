#language:es
Característica: Generar un enlace a una pasarela de pagos para que nos invoquen cuando pague
	Regla de negocio: Un sistema de nuestro cliente identifica que el usuario paga y nos invoca para continuar por la vía exitosa
		@tc:pendiente
		Escenario: Usuario paga y nos invocan por la vía exitosa
			Dado que un usuario recibio un enlace de la pieza pasarela de pagos
			Cuando realiza el pago en la web del cliente
			Y el sistema del cliente nos invoca al endpoint de pasarela confirmando el pago
			Entonces el caso de yFlow hace un salto al bloque configurado para la vía de éxito