#language: es
Característica: Un caso de ySocial puede ser iniciado por un HSM

	Este .feature apunta a dejar claro que ocurre cuando un usuario escribe una respuesta a un HSM que inició un caso.
	La duda regular que surge es si el mensajes entrante del usuario sería tratado por un bot o si es derivado a una cola directamente.

	@tc:pendiente
	Esquema del escenario: HSM crea un caso y usuario responde a servicio que posee yFlow
		Dado un caso que fue creado a partir de un HSM por envio <metodo>
		Y el servicio posee yFlow habilitado
		Cuando el usuario responde el HSM enviando un texto
		Entonces mensaje entrante sera tratado por <modulo>

		Ejemplos: 
			| metodo                   | modulo |
			| individual de agente     | cola   |
			| individual de supervisor | yFlow  |
			| individual de api        | yFlow  |
			| masivo de supervisor     | yFlow  |

	@tc:pendiente
	Esquema del escenario: yFlow procesa la respuesta a un HSM y realiza el salto al bloque de respuesta HSM
		Dado que yFlow recibio un mensaje entrante escrito a mano por el usuario 
		Y el mensaje entrante es el segundo de un caso iniciado por un HSM
		Y el flujo posee habilitado el saltar de bloque cuando un entrante es respuesta a HSM
		Cuando el sistema decida a que bloque derivar el mensaje entrante
		Entonces gestionara el mensaje en el bloque de respuesta hsm en vez del bloque de bienvenida

	@tc:TODO
	Esquema del escenario: yFlow procesa la respuesta a un HSM que se envio en campaña sin traza
