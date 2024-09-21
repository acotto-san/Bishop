#language: es 
@us:5166
Característica: Descripcion de una cola
	Como administrador
	Quiero poder agregarle una descripción a la cola
	Para que cuando tenga que gestionar muchas, sepa de que es cada cosa identificandola con una breve descripción

	@tc:5461
	Esquema del escenario: supervisor agrega una descripcion de cola al editarla
		Dado que un supervisor se encuentra en la <altaOModificacion> de la cola "Cola AAA"
		Y que el campo de descripcion contiene: <contenidoCampo>
		Cuando completa el campo "Descripcion" con el texto:
			""" 
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum convallis tellus sit amet porttitor.
			"""
		Y guara cambios
		Entonces la descripcion debe quedar guardada en la cola

			Ejemplos: 
			| altaOModificacion | contenidoCampo          |
			| alta              | vacio                   |
			| modificacion      | vacio                   |
			| modificacion      | esto es un texto previo |

	@tc:5462
	Escenario: se visualiza el comienzo de la descripcion en la lista de colas
		Dado que la cola "Cola AAA" posee en su descripcion el texto:
			"""
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum convallis tellus sit amet porttitor.
			"""
		Cuando un supervisor ingresa a la lista de colas
		Entonces en el renglon de la cola "Cola AAA" como contenido de la columna "Descripcion" vera el comienzo del texto

	@tc:5463
	Escenario: se visualiza la descripcion de una cola en el modal de info de la misma
		Dado que la cola "Cola AAA" posee en su descripcion el texto:
			"""
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum convallis tellus sit amet porttitor.
			"""
		Cuando un supervisor ingresa a la lista de colas
		Y hace click en la lupa de la cola "Cola AAA"
		Entonces debe aparecer el modal de informacion de la cola
		Y en el campo "Descripcion" debe encontrarse el texto