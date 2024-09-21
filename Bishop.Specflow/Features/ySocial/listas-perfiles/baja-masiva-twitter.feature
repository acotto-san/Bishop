#language: es
Característica: Dar de baja masivamente usuarios de twitter de una lista de perfiles
	Se desea dar de baja masivamente usuarios de twitter de la lista de perfiles, al proveer una lista de usuarios que se desean eliminar.

	@tc:5354
	Esquema del escenario: se elimina masivamente cuentas de twitter de una lista de perfiles
		Dado que Sandra es una supervisora que se encuentra en la <@lista>
		Y que la <@lista> posee los siguientes perfiles:
			| Nombre                | RRSS     | cuentas                            |
			| pepe@mail.com         | mail     | pepe@mail.com                      |
			| SalaLeopoldoLugones   | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
			| 5491122334455         | whatsapp | 5491122334455 (5491122334455)      |
			| Perfil Ulises Twitter | twitter  | @ulisesTest20 (ulises tester)      |
			| ulises backup         | twitter  | @ulisesBackup20 (ulises backup)    |
		Cuando Sandra elimina masivamente las siguientes cuentas de twitter
			"""
				ulisesTest20,Sala_Lugones
			"""
		Entonces la lista quedara con los siguientes perfiles
			| Nombre                | RRSS     | cuentas                            |
			| pepe@mail.com         | mail     | pepe@mail.com                      |
			| 5491122334455         | whatsapp | 5491122334455 (5491122334455)      |
			| ulises backup         | twitter  | @ulisesBackup20 (ulises backup)    |
		Ejemplos: 
			| @lista                         |
			| Lista de Perfiles No Contactar |

	@tc:5355
	Esquema del escenario: la baja no se interrumpe al ingresar una cuenta que no estaba presente en la lista de perfiles
		Dado que Sandra es una supervisora que se encuentra en la <@lista>
		Y que la <@lista> posee los siguientes perfiles:
			| Nombre                | RRSS     | cuentas                            |
			| pepe@mail.com         | mail     | pepe@mail.com                      |
			| 5491122334455         | whatsapp | 5491122334455 (5491122334455)      |
			| ulises backup         | twitter  | @ulisesBackup20 (ulises backup)    |
		Cuando Sandra elimina masivamente las siguientes cuentas de twitter
			"""
				ulisesBackup20,Sala_Lugones
			"""
		Entonces la lista quedara con los siguientes perfiles
			| Nombre                | RRSS     | cuentas                            |
			| pepe@mail.com         | mail     | pepe@mail.com                      |
			| 5491122334455         | whatsapp | 5491122334455 (5491122334455)      |
		Ejemplos: 
			| @lista                         |
			| Lista de Perfiles No Contactar |