#language: es
Característica: se editan todos los datos de usuarios con perfiles de varias cuentas

	@tc:5978
	Esquema del escenario: se modifican datos de perfil con dos cuentas
		Dado un perfil que tiene vinculadas las siguientes cuentas
			| tipo de cuenta | id de cuenta                           |
			| email          | s0zegf+csigj19s7o9aw@guerrillamail.com |
			| WA             | 5491198987875                          |
		Cuando se modifican todos los tipos de datos del perfil utilizando el id de <tipo de id>
		Entonces al ubicar el perfil con ambos id se vera que contienen los mismos campos actualizados

		Ejemplos: 
			| tipo de id |
			| WA         |
			| email      |



	@tc:5979
	Escenario: se agrega un usuario nuevo con todos los checks activos
		Dado el usuario con el id de RRSS 5491158638852 nunca se contacto con ySocial
        Y un csv para carga masiva de perfiles que posee el siguiente registro:
			"""
				2,5491158638852,romi,rgroisman@yoizen.com,5491158638852,1,0,0,0,3,aaa#111,2,"{'campoTipoTexto':'usuariofulanito'}"
			"""
		Cuando un supervisor genera una carga masiva con los checks de business data y datos extendidos activos utilizando el csv provisto
		Y el 5491158638852 se contacta por primera vez
		Entonces el agente atendera el nuevo caso con los siguientes datos:
		 | id            | nombre | mail                 | telefono      | lista vip | lista bloq | lista no contactar | lista tester | business data | datos extendidos |
		 | 5491158638852 | romi   | rgroisman@yoizen.com | 5491158638852 | si        | no         | no                 | no           | aaa#111       | usuariofulanito  |

	@tc:6081
	Esquema del escenario: se realiza una carga masiva con multiples acciones combinadas
		Dado un csv para carga masiva que posee un registro con los 3 tipos de campos y las siguientes acciones
			| campos basicos   | campos de negocio | campos extendidos   |
			| <accion basicos> | <accion negocio>  | <accion extendidos> |
        Cuando un supervisor utiliza el csv para una carga masiva de perfiles
		Entonces el registro debe ser considerado valido
		Y debe crear/editar el perfil al que pertenece el id del registro

		Ejemplos: 
			| accion basicos    | accion negocio      | accion extendidos            |
			| 0                 | 1 (borrar todo)     | 1 (reemplazar todo)          |
			| 0                 | 2 (reemplazar todo) | 2 (reemplazar lo mencionado) |
			| 1 (crear perfil)  | 2 (reemplazar todo) | 0                            |
			| 1 (crear perfil)  | 3 (agregar)         | 1 (reemplazar todo)          |
			| 1 (crear perfil)  | 0                   | 1 (reemplazar todo)          |
			| 2 (editar perfil) | 2 (reemplazar todo) | 1 (reemplazar todo)          |
			| 2 (editar perfil) | 3 (agregar)         | 0                            |
			| 2 (editar perfil) | 4 (eliminar uno)    | 1 (reemplazar todo)          |
			| 2 (editar perfil) | 0                   | 2 (reemplazar lo mencionado) |
			| 2 (editar perfil) | 1 (borrar todo)     | 0                            |
			| 0                 | 3 (agregar)         | 1 (reemplazar todo)          |
			| 0                 | 4 (eliminar uno)    | 2 (reemplazar lo mencionado) |
			| 1 (crear perfil)  | 2 (reemplazar todo) | 1 (reemplazar todo)          |
			| 1 (crear perfil)  | 3 (agregar)         | 2 (reemplazar lo mencionado) |