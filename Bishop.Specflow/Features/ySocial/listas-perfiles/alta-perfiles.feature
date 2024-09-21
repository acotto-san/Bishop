#language: es 
Característica: A de los perfiles en la lista
	Se desea poder dar de alta y baja a usuarios en la lista.


	Regla de negocio: Se puede agregar y eliminar perfiles de usuarios ya registrados en la plataforma

		@tc:5377
		Esquema del escenario: se agrega a la lista un perfil de un usuario que ya contacto la plataforma
			Dado que Ulises es un usuario ya registrado en la plataforma
			Y que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra selecciona al perfil de Ulises desde el buscador de perfiles
			Y confirma el modal emergente
			Entonces el perfil de Ulises se encontrara en la <@lista>

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |

		@tc:5378
		Escenario: un usuario que nunca escribio a la plataforma no aparecera en la busqueda de perfiles
			Dado que la cuenta @cuentaTest de twitter nunca escribio a la plataforma
			Y que Sandra es una supervisora que se encuentra en una lista de perfiles
			Cuando Sandra intenta buscar "cuentaTest" en el buscador de perfiles
			Entonces no obtendra resultados de dicha cuenta