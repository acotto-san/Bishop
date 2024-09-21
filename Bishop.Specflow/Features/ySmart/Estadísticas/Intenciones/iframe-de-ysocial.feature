#language: es
Característica: iframe de ysocial en ysmart

Como supervisor 
quiero ver la información del caso de los mensajes que matchearon con intenciones, en la sección de estadísticas
para verlo directo desde ysmart y no tener que ir a buscarlo en ysocial
Aparece un icono en las acciones, en la sección de estadísticas.

	Regla: Si el mensaje corresponde a un caso, en las acciones de estadísticas de intenciones aparecerá la información obtenida de ysocial

		@tc:7536
		Escenario: mensaje de prueba en ysmart no se considera un caso en ysocial
			Dado que se consulta una frase en la seccion de pruebas de ysmart
			Y matchea en un 95% con una intencion
			Cuando se ingresa a las estadisticas de intenciones
			Entonces no debera aparecer ese mensaje en el listado

		@tc:7537
		Esquema del escenario: aparece el mensaje y el ícono de ysocial
			Dado que un mensaje de <canal> es procesado por ysmart
			Y matchea con una intencion en un porcetaje <porcentaje> al nivel de confianza
			Cuando se ingresa a las estadisticas de intenciones <tipo de estadistica>
			Entonces debera aparecer el icono de ysocial con el iframe del caso
				
				Ejemplos:
				| canal        | porcentaje    | tipo de estadística |
				| chat         | mayor o igual | seguras             |
				| fb messenger | mayor o igual | seguras             |
				| whatsapp     | menor         | ambiguas            |
				| instagram    | menor         | ambiguas            |

	Regla: Se visualizan los datos del caso de ysocial en el iframe

		@tc:7538
		Esquema del escenario: la información del iframe corresponde con la del caso de ysocial
		Exploratorio con casos de distintos canales
			Dado que un mensaje del caso 241809	fue procesado por ysmart
			Y matchea con una intencion en un porcetaje <porcentaje> al nivel de confianza
			Cuando se selecciona el icono de ysocial de ese mensaje en las estadisticas de intenciones <tipo de estadistica>
			Entonces los datos del iframe corresponden a la informacion de ysocial del caso 241809

				Ejemplos: 
				| porcentaje    | tipo de estadística |
				| mayor o igual | seguras             |
				| menor         | ambiguas            |