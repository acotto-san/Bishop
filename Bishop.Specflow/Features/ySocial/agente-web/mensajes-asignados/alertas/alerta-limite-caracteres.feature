#language: es
Característica: Notificar a agente cuando este superando el limite de caracteres aceptado por la RRSS
	Cada red social posee su limite de caracteres, incluso puede variar si el mensaje es publico o privado.
	Se desea que esta limitacion sea validada al momento de enviar un mensaje de respuesta a un caso asignado.

	Esquema del escenario: Agente es notificado de que esta infringiendo el limite de caracteres aceptados
		Dado agente asignado un caso de <tipo de mensaje>
		Cuando el agente tipee la respuesta superando los <limite de caracteres> caracteres
		Entonces sera notificado de que el mensaje esta superando el limite de caracteres
		Y no se le permitira enviarlo

		Ejemplos: 
			| tipo de mensaje | limite de caracteres |
			| messenger       | 2000                 |
			| fb privado      | 2000                 |
			| tw publico      | 280                  |
			| tw privado      | 10000                |
			| ig publico      | 1000                 |
			| ig privado      | 1000                 |