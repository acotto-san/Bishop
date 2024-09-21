#language: es 
Característica: Crear nuevas etiquetas masivamente mediante la carga masiva
	
	Regla de negocio: En la carga masiva se definen etiquetas y si estas no existen seran creadas
		
		@tc:5905	
		Esquema del escenario: Funcionalidad de carga masiva crea una etiqueta nivel dos
			Dado que se tiene en un csv de carga masiva la etiqueta de nivel 2: "Equipo A/nivel 2"
			Y dado la siguiente condicion de su ancestro nivel 1:
				| existe           | posee etiquetas en nivel 2 |
				| <existe nivel 1> | <existe nivel 2>          |
			Cuando un supervisor realiza la carga masiva con dicho csv
			Entonces la etiqueta "Equipo A/nivel 2" estara creada
			Y la configuracion de la etiqueta debera ser la misma que se establecio en el formulario de carga masiva

			Ejemplos: 
				| existe nivel 1 | existe nivel 2 |
				| no             | no             |
				| si             | no             |
				| si             | si             |

		@tc:5906
		Esquema del escenario: Funcionalidad de carga masiva crea una etiqueta nivel tres
			Dado que se tiene en un csv de carga masiva la etiqueta de nivel 3: "Equipo B/nivel 2/nivel 3"
			Y dado la siguiente condicion de su ancestro nivel 1:
				| existe etiqueta nivel 1 | posee nivel 2    | posee nivel 3    |
				| <existe nivel 1>        | <existe nivel 2> | <existe nivel 3> |
			Cuando un supervisor realiza la carga masiva con dicho csv
			Entonces la etiqueta "Equipo B/nivel 2/nivel 3" estara creada
			Y la configuracion de la etiqueta debera ser la misma que se establecio en el formulario de carga masiva

			Ejemplos: 
				| existe nivel 1 | existe nivel 2 | existe nivel 3 |
				| no             | no             | no             |
				| si             | no             | no             |
				| si             | si             | no             |
				| si             | si             | si             |


		@tc:5907
		Esquema del escenario: Funcionalidad de carga masiva crea una etiqueta nivel cuatro
			Dado que se tiene en un csv de carga masiva la etiqueta de nivel 3: "Equipo C/nivel 2/nivel 3/nivel 4"
			Y dado la siguiente condicion de su ancestro nivel 1:
				| existe etiqueta nivel 1 | posee nivel 2    | posee nivel 3    | posee nivel 4    |
				| <existe nivel 1>        | <existe nivel 2> | <existe nivel 3> | <existe nivel 4> |
			Cuando un supervisor realiza la carga masiva con dicho csv
			Entonces la etiqueta "Equipo C/nivel 2/nivel 3/nivel 4" estara creada
			Y la configuracion de la etiqueta debera ser la misma que se establecio en el formulario de carga masiva

			Ejemplos: 
				| existe nivel 1 | existe nivel 2 | existe nivel 3 | existe nivel 4 |
				| no             | no             | no             | no             |
				| si             | no             | no             | no             |
				| si             | si             | no             | no             |
				| si             | si             | si             | no             |
				| si             | si             | si             | si             |



		@tc:5908
		Escenario: Se crean multiples etiquetas de diferentes niveles al mismo tiempo
			Dado un csv de carga masiva que contiene las siguientes etiquetas
				"""
					Equipo I/nivel 2
					Equipo II/nivel 2/nivel 3
					Equipo III/nivel 2/nivel 3/nivel 4
				"""
			Y en ySocial no existen las siguientes etiquetas de nivel 1
				| etiqueta   |
				| Equipo I   |
				| Equipo II  |
				| Equipo III |
			Cuando un supervisor realiza la carga masiva con dicho csv
			Entonces las 3 etiquetas estaran creadas
			Y la configuracion de todas debera ser la misma que se establecio en el formulario de carga masiva
			
		@tc:5909
		Escenario: De el csv se ignoran las etiquetas que ya existen en ySocial
			Dado que en ySocial solo existe la etiqueta "Equipo Y/nivel 2/nivel 3/nivel 4a"
			Y un csv de carga masiva que contiene las siguientes etiquetas
				"""
					Equipo Y/nivel 2/nivel 3/nivel 4a
					Equipo Y/nivel 2/nivel 3/nivel 4b
				"""
			Cuando un supervisor realiza la carga masiva con dicho csv
			Entonces la etiqueta "Equipo Y/nivel 2/nivel 3/nivel 4b" sera creada 
			Y la etiqueta "Equipo Y/nivel 2/nivel 3/nivel 4a" no sera duplicada



