#language: es
@us:4399
Característica: al cerrar un caso HSM automaticamente por inactividad etiquetar el caso 
	Se permite setear una etiqueta para que cuando un caso sea cerrado por este feature, se le aplique esa etiqueta.

	@tc:5049
	Esquema del escenario: etiquetado al momento de cerrar un caso HSM por inactividad
		Dado la siguiente configuracion en parametros de sistema:
			| funcionalidad                                      | configuracion              |
			| Minutos para cierre automático                     | <@minutosParaCierreNormal> |
			| Minutos para el cierre automatico de casos HSM     | <@minutosParaCierreHSM>    |
			| Aplicar etiqueta en cierre automático de casos HSM | Viriviri/AAA               |
		Cuando un caso que solo posee mensajes HSM esta siendo cerrado por el cierre automatico de casos HSM
		Entonces al caso se le aplicara la etiqueta "Viriviri/AAA"

		Ejemplos:
			| @minutosParaCierreNormal | @minutosParaCierreHSM |
			| 120                      | 60                    |
			| 60                       | 120                   |
