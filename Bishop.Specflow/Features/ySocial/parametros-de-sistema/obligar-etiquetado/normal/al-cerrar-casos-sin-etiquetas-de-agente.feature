#language: es
@us:7984
Característica: Obligación de etiquetar al cerrar un caso sin etiquetas de un agente

	Regla: Configuración del etiquetado obligatorio en Parámetros de sistema

		@tc:8774
		Escenario: Habilitar etiquetado obligatorio al cerrar un caso sin etiquetas de agentes
			Dado que la funcionalidad de etiquetado obligatorio al cerrar casos sin etiquetas de agentes está deshabilitada
			Cuando un supervisor accede a los parámetros de sistema
			Entonces podrá habilitar la opción para que aplique globalmente a todos los agentes

	Regla de negocio: El etiquetado obligatorio aplica a casos asignados

		@tc:8775
		Esquema del escenario: El agente debe etiquetar al cerrar un caso asignado sin etiquetas propias
			Dado que la funcionalidad de etiquetado obligatorio al cerrar está configurada en "si no tiene etiquetas de agente"
			Y a un agente se le asigna un caso con etiquetas, pero ninguna proporcionada por un agente
			Cuando el agente intenta cerrar el caso mediante <acción>
			Entonces deberá aplicar al menos una etiqueta normal para continuar

			Ejemplos:
				| acción                      |
				| finalizar (modo chat)       |
				| responder (modo normal)     |
				| descartar                   |
				| responder con plantilla HSM |

	Regla de negocio: Aplicación del etiquetado obligatorio en casos cerrados desde "Salientes"

		@tc:8776
		Escenario: El agente debe etiquetar al cerrar un caso desde "Salientes" sin etiquetas propias
			Dado que la funcionalidad de etiquetado obligatorio al cerrar está configurada en "si no tiene etiquetas de agente"
			Cuando el agente intenta cerrar un caso desde "Salientes" con etiquetas, pero ninguna proporcionada por un agente
			Entonces deberá aplicar al menos una etiqueta para continuar

	Regla de negocio: Casos exentos de etiquetado obligatorio

		@tc:8777
		Escenario: El agente está exento de etiquetar si el caso ya tiene una etiqueta del agente
			Dado que la funcionalidad de etiquetado obligatorio al cerrar está configurada en "si no tiene etiquetas de agente"
			Cuando un agente intenta cerrar un caso asignado que posee una etiqueta proporcionada por el agente
			Entonces no estará obligado a etiquetar

		@tc:8778
		Escenario: El agente está exento de etiquetar al cerrar un caso desde "Salientes" si tiene etiquetas del agente
			Dado que la funcionalidad de etiquetado obligatorio al cerrar está configurada en "si no tiene etiquetas de agente"
			Cuando un agente intenta cerrar un caso desde "Salientes" que posee una etiqueta proporcionada por el agente
			Entonces no estará obligado a etiquetar

		@tc:8780
		Escenario: El agente está exento de etiquetar al cerrar un caso desde "Buscar Casos" si tiene etiquetas del agente
			Dado que la funcionalidad de etiquetado obligatorio al cerrar está configurada en "si no tiene etiquetas de agente"
			Cuando un agente intenta cerrar un caso desde "Buscar Casos" que posee una etiqueta proporcionada por el agente
			Entonces no estará obligado a etiquetar

		@tc:8781
		Escenario: El agente está exento de etiquetar al cerrar un caso si no hay etiquetas disponibles
			Dado que la funcionalidad de etiquetado obligatorio al cerrar está configurada en "si no tiene etiquetas de agente"
			Y a un agente se le asigna un caso con etiquetas, pero ninguna proporcionada por el agente
			Y la cola de donde proviene el caso no tiene etiquetas asignadas
			Cuando el agente intenta cerrar el caso
			Entonces no estará obligado a etiquetar