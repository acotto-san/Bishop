#language: es 
@us:4996
Característica: Actualizar la adherencia de un usuario a la Lista de Perfiles No Contactar
	Se desea poder configurar para que agregue o elimine usuarios de la lista al ser ejecutada la pieza.

@tc:5320
Esquema del escenario: Modificacion de Lista de Perfiles No Contactar al ejecutar la pieza Actualizar Perfil 
	Dado que la pieza Actualizar Perfil de un flujo posee la siguiente configuracion
		| campo                           | valor              |
		| Actualizar usuario No Contactar | <@valoNoContactar> |
	Y un usuario <@presenciaEnLista> en la Lista de Perfiles No Contactar
	Cuando el usuario ejecuta la pieza
	Entonces el usuario se encontrara <@presenciaResultado> en la Lista de Perfiles No Contactar 

		Ejemplos: Pieza configurada en "No actualizar"
			| @valoNoContactar | @presenciaEnLista | @presenciaResultado |
			| No actualizar    | presente          | presente            |
			| No actualizar    | ausente           | ausente             |

		Ejemplos: Pieza configurada en "Marcarlo como No Contactar"
			| @valoNoContactar           | @presenciaEnLista | @presenciaResultado |
			| Marcarlo como No Contactar | presente          | presente            |
			| Marcarlo como No Contactar | ausente           | presente            |

		Ejemplos: Pieza configurada en "Desmarcarlo como No Contactar"
			| @valoNoContactar              | @presenciaEnLista | @presenciaResultado |
			| Desmarcarlo como No Contactar | presente          | ausente             |
			| Desmarcarlo como No Contactar | ausente           | ausente             |