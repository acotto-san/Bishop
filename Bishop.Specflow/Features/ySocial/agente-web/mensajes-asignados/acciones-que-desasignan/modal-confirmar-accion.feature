#language: es
Característica: Tener un modal para solicitarle al agente confirmar la accion 
	
	@tc:7042
	Esquema del escenario: Se le pide confirmar al agente una accion que le desasignara el caso
		Dado una sesion de agente que posee un mensaje asignado
		Cuando el agente intenta realizar la accion de <accion>
		Entonces aparecera un modal que le pedira confirmar dicha accion

		Ejemplos: 
			| accion                    |
			| descartar                 |
			| retornar                  |
			| transferir                |
			| finalizar                 |
			| descartar y cerrar        |
			| finalizar y cerrar        |
			| responder mensaje publico |