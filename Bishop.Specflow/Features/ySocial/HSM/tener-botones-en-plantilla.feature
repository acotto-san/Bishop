#language: es
Característica: Tener multiples botones en plantilla HSM


	Regla: tener hasta 10 botones total pero sin superar el limite de Call To Action

		@tc:7620
		Esquema del escenario: supervisor logra agregar hasta 10 botones mixtos 
			Dado un supervisor que esta creando una plantilla con botones mixtos
			Y ya agrego la siguiente cantidad de botones
				| tipo de boton  | cantidad   |
				| Quick Reply    | <cant qr>  |
				| Call to Action | <cant cta> |
			Cuando agrega un nuevo boton <nuevo boton>
			Entonces no podra agregar mas botones

			Ejemplos: 
				| cant qr | cant cta | nuevo boton    |
				| 6       | 3        | Call to Action |
				| 5       | 4        | Quick Reply    |
				| 8       | 1        | Quick Reply    |

		Escenario: la lista de botones esta desordenada 
				
	Regla: tener hasta 10 botones de tipo Quick Reply

		@tc:7621
		Escenario: el supervisor logra agregar hasta 10 botones Quick Reply
			Dado un supervisor que esta creando una plantilla
			Y ya le agrego 9 botones Quick Reply
			Cuando agrega un nuevo boton Quick Reply
			Entonces no podra agregar mas botones

	Regla: tener hasta 4 botones de tipo Call to Action

		@tc:7622
		Escenario: el supervisor logra agregar hasta 4 botones Call to Action
			Dado un supervisor que esta creando una plantilla
			Y ya le agrego 3 botones Call to Action
			Cuando agrega un nuevo boton Call to Action
			Entonces no podra agregar mas botones

	Regla: poder mezclar diferentes tipos de botones

		@tc:7623
		Escenario: una plantilla contiene multiples subtipos de boton Call to Action
			Dado un supervisor que esta creando una plantilla con botones de tipo Call to Action
			Cuando le agrega los siguientes botones
				| subtipos                       |
				| visitar a sitio web            |
				| llamar a un número de teléfono |
				| codigo de oferta               |
			Entonces la plantilla sera considerada valida
			Y el supervisor podra terminar de dar de alta la plantilla

		@tc:7624
		Escenario: una plantilla contiene multiples tipos de botones
			Dado un supervisor que esta creando una plantilla con botones mixto
			Cuando agrega los siguientes tipos de botones
				| tipo           | subtipo                        |
				| Quick Reply    | N/A                            |
				| Call to Action | visitar a sitio web            |
				| Call to Action | llamar a un número de teléfono |
				| Call to Action | codigo de oferta               |
			Entonces la plantilla sera considerada valida
			Y el supervisor podra terminar de dar de alta la plantilla