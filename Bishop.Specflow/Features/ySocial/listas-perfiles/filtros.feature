#language: es
Característica:filtro de lista de perfiles
	Como supervisar 
	Quiero poder filtrar mi lista de perfiles 
	Para poder buscarlos por nombre o red social

Regla: Se puede filtrar la lista de usuarios por nombre y/o red social

	@tc:6956
	Esquema del escenario: se filtra el listado por nombre o red social
		Dado una lista de perfiles con los siguientes usuarios:
			| Nro | Nombre          | Cuenta    |
			| 1   | test1@gmail.com | mail      |
			| 2   | usuario test    | facebook  |
			| 3   | 5491157778877   | Whatsapp  |
			| 4   | usuario test    | instagram |
			| 5   | usuario test    | messenger |
		Cuando un supervisor filtra la lista por <filtro>
		Y elige/escribe <opcion>
		Entonces le aparecen los registros <resultado obtenido> en su lista

		Ejemplos:
			| filtro     | opcion       | resultado obtenido |
			| nombre     | test         | 1                  |
			| nombre     | usuario test | 2-3-5              |
			| red social | facebook     | 2                  |
			| red social | instagram    | 4                  |

Regla: Los filtros usados en una lista se deshacen al salir de la lista

	@tc:6957
	Escenario: se vuelve a ingresar a la lista luego de haber hecho un filtrado
	A modo exploratorio: entrar y salir entre diferentes vistas, listas de sistema y de perfiles de usuario. Usar filtros en listas con muchos usuarios.
		Dado que un supervisor habia filtrado su lista de perfiles "Clientes morosos" por la red social Whatsapp
		Cuando cambia a la lista de perfiles bloqueados 
		Entonces visualiza la lista completa sin filtrarse
		Y cuando vuelve a la lista de perfiles "Clientes morosos" tambien vera la lista completa sin filtrarse
		