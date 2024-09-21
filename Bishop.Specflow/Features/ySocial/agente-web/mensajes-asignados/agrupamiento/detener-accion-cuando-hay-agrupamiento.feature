#language: es
Característica: Interrumpir accion si un mensaje asignado va a ser agrupado
	Como agente 
	Quiero que se detenga una accion que ejecute si justo había empezado un agrupamiento
	Para que sin querer no rompa tal actualización del mensaje

	@tc:7043
	Esquema del escenario: Mensaje comenzo a agruparse y el agente ejecuta una accion
		Dado un mensaje 1 asignado a un agente
		Cuando el mensaje asignado comienza el proceso de agrupamiento de un mensaje 2
		Y seguido el agente acciono <accion> del mensaje 1
		Entonces la accion sera cancelada
		Y se concretara el agrupamiento

		Ejemplos: 
			| accion             |
			| descartar          |
			| retornar           |
			| transferir         |
			| finalizar          |
			| descartar y cerrar |
			| finalizar y cerrar |

	@tc:7044
	Esquema del escenario: Agrupamiento quita modals de confirmacion que el agente tenga en pantalla
		Dado un mensaje 1 asignado a un agente
		Y que en la pantalla del agente se encuentra un modal para confirmar <accion> del mensaje
		Cuando comienza el proceso de agrupamiento de un mensaje 2
		Entonces se cerrara automaticamente el modal
		Y se concretara el agrupamiento

		Ejemplos: 
			| accion             |
			| descartar          |
			| retornar           |
			| transferir         |
			| finalizar          |
			| descartar y cerrar |
			| finalizar y cerrar |
	
	@tc:7045
	Escenario: Agrupamiento quita modal de etiquetado que el agente tenga en pantalla
		exploratorio: no solo el modal invocado manualmente para etiquetar, sino cualquier modal de etiquetado
		invocado por la accion de "etiquetar obligatoriamente" que existe en parametros de sistema
		Dado un mensaje 1 asignado a un agente
		Y que en la pantalla del agente se encuentra un modal para etiquetar el mensaje
		Cuando comienza el proceso de agrupamiento de un mensaje 2
		Entonces se cerrara automaticamente el modal
		Y se concretara el agrupamiento