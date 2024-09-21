#language: es
Característica:Tabla - Estadísticas de la kb
	Como usuario de ysmart 
	quiero ver las apariciones de los archivos de cada base de conocimiento
	para obtener una tabla con métricas


Regla: Se muestra la cantidad de apariciones de cada archivo por intervalo de fechas

@tc:7613
Escenario: se filtran las apariciones de un archivo en la tabla
	Dado que un archivo fue procesado 5 veces en <fecha>
	Cuando se filtra la tabla de base de conocimiento por <fecha>
	Entonces las apariciones de ese archivo debe ser de 5

	Ejemplos: 
	| fecha            |
	| dia de hoy       |
	| la ultima semana |
	| el ultimo mes    |

@tc:7614
Escenario: aparece un archivo invocado que no genero una respuesta indicada
	Dado que un archivo fue procesado
	Y ysmart no obtuvo chunks suficientes para armar la respuesta
	Cuando se filtra la tabla de base de conocimiento
	Entonces debera aparecer ese archivo en la lista de totales