#language: es 
Característica: Eliminar todos los perfiles de una lista
	Se desea tener un boton para limpiar todos los perfiles de una lista al mismo tiempo.

	@tc:5366
	Escenario: Se elimina masivamente perfiles de una lista
		Dado que una lista de perfiles posee los siguientes perfiles:
			| Perfil          | Usuario                                                 | Red               |
			| Santiago        | Yzn Qa Setentayseis - 987                               | FacebookMessenger |
			| Santiago perfil | Santiago(5491173677135)                                 | WhatsApp          |
			| sacosta         | Santiago Acosta Ottonelli <sacostaottonelli@yoizen.com> | Mail              |
		Cuando un supervisor clickea en el boton de baja masiva de perfiles
		Entonces la lista de perfiles debe quedar vacia

	@tc:5367
	Escenario: Una lista que tuvo baja masiva de perfiles exporta un excel vacio
		Dado que una lista de perfiles contiene perfiles dados de alta
		Y que un supervisor elimino los perfiles mediante el boton de baja masiva de perfiles
		Cuando el supervisor exporte la lista de perfiles
		Entonces el archivo debe estar vacio

	@tc:5368
	Esquema del escenario: El boton de baja masiva de perfiles no estara habilitado en listas de sistema
		Cuando el supervisor ingresa a la lista de perfil <@listaDePefil>
		Entonces no vera disponible el boton de baja masiva

		Ejemplos: 
			| @listaDePefil                  |
			| Lista de Perfiles VIP          |
			| Lista de Perfiles Bloqueados   |
			| Lista de Perfiles Testers      |
			| Lista de Perfiles No Contactar |

	@tc:5369
	Escenario: Usuario deja de estar registrado en lista de perfil luego de baja masiva de perfiles
		Dado que un usuario estaba registrado en una lista de perfiles
		Y que un filtro responde automaticamente todos los mensajes de usuarios de esta lista de perfiles
		Y que un supervisor realiza una baja masiva de perfiles en la lista de perfiles
		Cuando el usuario manda un mensaje
		E ingresa a ySocial
		Entonces el filtro no se ejecutara