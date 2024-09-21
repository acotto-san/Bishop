#language: es 
Característica: Cerrado por AXP
En el reporte detallado de casos, cuando dice Cerrado, cambiar por "Agente AXP"

	Regla: Un caso cerrado por un agente axp aparecerá como "Cerrado por agente AXP" en el reporte detallado de casos

	@tc:7862
	Esquema del escenario: supervisor verifica columna "Cerrado por"
		Dado un caso cerrado por <agente>
		Cuando un supervisor verifica el detallado del caso
		Entonces en la columna Cerrado por debera verse <agente>

		Ejemplos: 
		| agente     |
		| axp        |
		| agente     |  
		| supervisor |
		| sistema    |
		| yflow      |
		| filtro     |