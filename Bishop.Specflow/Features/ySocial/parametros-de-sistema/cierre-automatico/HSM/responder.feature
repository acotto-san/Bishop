#language: es
@us:4399
Característica: al cerrar un caso HSM automaticamente por inactividad enviar un mensaje
	Al momento de cerrar un caso que solo contiene HSM se desea enviarle al usuario un mensaje de despedida.

	@tc:5050
	Esquema del escenario: respuesta al momento de cerrar un caso HSM por inactividad
		Dado la siguiente configuracion en parametros de sistema:
			| funcionalidad                                  | configuracion                 |
			| Minutos para cierre automático                 | <@minutosParaCierreNormal>    |
			| Minutos para el cierre automatico de casos HSM | <@minutosParaCierreHSM>       |
			| Responder en cierre automático de casos HSM    | te cierro el caso de solo HSM |
		Cuando un caso que solo posee mensajes HSM esta siendo cerrado por el cierre automatico de casos HSM
		Entonces al caso sera agregado un mensaje saliente antes del cierre
		Y el cuerpo del mensaje sera "te cierro el caso de solo HSM"
		Ejemplos:
			| @minutosParaCierreNormal | @minutosParaCierreHSM |
			| 120                      | 60                    |
			| 60                       | 120                   |