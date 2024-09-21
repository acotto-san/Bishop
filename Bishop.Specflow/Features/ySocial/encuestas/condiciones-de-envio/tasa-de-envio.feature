#language: es
Característica: tasa de envio de encuesta
	Se enviara la encuesta dependiendo de cuanto es el porcentaje de envios.
	Si quiero que se encueste la totalidad de los casos del usuario entonces se configura 100%.
	Si quiero que se encueste la mitad de los casos del usuario entonces se configura 50%, etc.

	Esquema del escenario: se envia una encuesta segun tasa de envio
		Dado que en la vinculacion de una encuesta a un/a <@entidadQueEnvia> la <@tasa> de envio es del <@porcentajeEnvio>
		Y la cantidad de casos de un usuario se encuentra en el siguiente estado:
		| totalCasos    | casosEncuestados   |
		| <@totalCasos> | <@casosEncuestado> |
		Cuando un nuevo caso se cierra
		Entonces el/la <@entidadQueEnvia> <@accionDeEnvio> una encuesta al nuevo caso cerrado

		Ejemplos: tasa al 100%
			| @entidadQueEnvia | @porcentajeEnvio | @totalCasos | @casosEncuestado | @accionDeEnvio |
			| cola             | 100              | 1           | 1                | envia          |
			| cola             | 100              | 10          | 10               | envia          |
			| servicio         | 100              | 1           | 1                | envia          |
			| servicio         | 100              | 10          | 10               | envia          |
		Ejemplos: tasa al 50%
			| @entidadQueEnvia | @porcentajeEnvio | @totalCasos | @casosEncuestado | @accionDeEnvio |
			| cola             | 50               | 1           | 0                | envia          |
			| cola             | 50               | 2           | 1                | no envia       |
			| cola             | 50               | 3           | 1                | envia          |
			| cola             | 50               | 4           | 2                | no envia       |
			| servicio         | 50               | 1           | 0                | envia          |
			| servicio         | 50               | 2           | 1                | no envia       |
			| servicio         | 50               | 3           | 1                | envia          |
			| servicio         | 50               | 4           | 2                | no envia       |

		Ejemplos: tasa al 75%
			| @entidadQueEnvia | @porcentajeEnvio | @totalCasos | @casosEncuestado | @accionDeEnvio |
			| cola             | 75               | 1           | 0                | envia          |
			| cola             | 75               | 2           | 1                | no envia       |
			| cola             | 75               | 3           | 1                | envia          |
			| cola             | 75               | 4           | 2                | envia          |
			| servicio         | 75               | 1           | 0                | envia          |
			| servicio         | 75               | 2           | 1                | no envia       |
			| servicio         | 75               | 3           | 1                | envia          |
			| servicio         | 75               | 4           | 2                | envia          |

		Esquema del escenario: al habilitar una encuesta 