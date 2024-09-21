#language:es
Característica: eliminar individualmente usuarios de una lista de perfiles
	Se desea poder eliminar individualmente a los usuarios de una lista de perfiles. 

	@tc:5373
	Esquema del escenario: se elimina determinado perfil de usuario que estaba presente en la lista
		Dado que soy un supervisor visualizando la lista de perfiles <lista>
		Y que el siguiente perfil de usuario se encuentra en la lista
			| Name               | Id             |
			| <nombre de perfil> | <id de perfil> |
		Cuando intento eliminar el perfil de la lista
		Entonces el perfil no se va a encontrar mas en la misma

			
		Ejemplos: 
			| lista                        | nombre de perfil | id de perfil |
			| Lista de Perfiles VIP        | Pepe Derby       | 315          |

	@tc:
	Esquema del escenario: se elimina un perfil de usuario cualquiera que estaba presente en la lista
		Dado que soy un supervisor visualizando la lista de perfiles <lista>
		Cuando intento eliminar un perfil de la lista
		Entonces el perfil no se va a encontrar mas en la misma

		Ejemplos: 
			| lista                        |
			| Lista de Perfiles VIP        |
			| Lista de Perfiles Bloqueados |