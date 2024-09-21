#language: es
Característica: yFlow - Pieza calendario
	esto es un comentario

	@tc:5576 @flowjson
	Esquema del escenario: Cliente escribe en un horario que coincide
		Dado que un bot posee la pieza Calendario con la siguiente configuracion:
			| atributo            | valor                                 |
			| evaluacion          | en caso de que los horarios coincidan |
			| franja horaria      | 9 a 18hs                              |
			| continuar en bloque | bloque Z                              |
		Cuando el cliente escriba en un horario que  <@coincide>
		Entonces debera continuar en <@bloque>

		Ejemplos:
			| @coincide | @bloque      |
			| Si        | bloque Z     |
			| No        | mismo bloque |

	@tc:5577 @flowjson
	Esquema del escenario: Cliente escribe en un horario que no coincide
		Dado que un bot posee la pieza Calendario con la siguiente configuracion:
			| atributo            | valor                                    |
			| evaluacion          | en caso de que los horarios no coincidan |
			| franja horaria      | 9 a 18hs                                 |
			| continuar en bloque | bloque Z                                 |
		Cuando el cliente escriba en un horario que <@coincide>
		Entonces debera continuar en otro <@bloque>

		Ejemplos:
			| @coincide | @bloque      |
			| Si        | mismo bloque |
			| No        | bloque Z     |


#	Esquema del escenario: Escenario combinado ambas config
#		Dado que un bot posee la pieza Calendario con la siguiente configuracion:
#			| atributo            | valor         |
#			| evaluacion          | <@evaluacion> |
#			| franja horaria      | 9 a 18hs      |
#			| continuar en bloque | bloque Z      |
#		Cuando el cliente escriba en un horario que <@coincide>
#		Entonces debera continuar en otro <@bloque>
#
#		Ejemplos: tiene que coincidir horario del mensaje con la franja horaria de la pieza
#			| @evaluacion                           | @coincide | @bloque      |
#			| en caso de que los horarios coincidan | Si        | bloque Z     |
#			| en caso de que los horarios coincidan | No        | mismo bloque |
#
#		Ejemplos: NO tiene que coincidir horario del mensaje con la franja horaria de la pieza
#			| @evaluacion                              | @coincide | @bloque      |
#			| en caso de que los horarios no coincidan | Si        | mismo bloque |
#			| en caso de que los horarios no coincidan | No        | bloque Z     |