#language: es
Característica: Dar de baja masivamente casillas de mail de una lista de perfiles
	Se desea dar de baja masivamente casillas de mail de la lista de perfiles, al proveer una lista de casillas que se desean eliminar.

	@tc:5351
	Esquema del escenario: se elimina masivamente casillas de mail de una lista de perfiles
		Dado que Sandra es una supervisora que se encuentra en la <@lista>
		Y que la <@lista> posee los siguientes perfiles:
			| Nombre                     | RRSS     | cuentas                                  |
			| pepe@mail.com              | mail     | pepe@mail.com                            |
			| SalaLeopoldoLugones        | twitter  | @Sala_Lugones(SalaLeopoldoLugones)       |
			| 5491122334455              | whatsapp | 5491122334455 (5491122334455)            |
			| Perfil Ulises Mail         | mail     | Ulises Tester ulises_tester_20@gmail.com |
			| ulises_backup_20@gmail.com | mail     | ulises_backup_20@gmail.com               |
		Cuando Sandra elimina masivamente las siguientes casillas de mail
			"""
				pepe@mail.com,ulises_tester_20@gmail.com
			"""
		Entonces la lista quedara con los siguientes perfiles
			| Nombre                     | RRSS     | cuentas                            |
			| SalaLeopoldoLugones        | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
			| 5491122334455              | whatsapp | 5491122334455 (5491122334455)      |
			| ulises_backup_20@gmail.com | mail     | ulises_backup_20@gmail.com         |
		Ejemplos: 
			| @lista                         |
			| Lista de Perfiles No Contactar |

	@tc:5352
	Esquema del escenario: la baja no se interrumpe al ingresar una casilla que no estaba presente en la lista de perfiles
		Dado que Sandra es una supervisora que se encuentra en la <@lista>
		Y que la <@lista> posee los siguientes perfiles:
			| Nombre                     | RRSS     | cuentas                            |
			| SalaLeopoldoLugones        | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
			| 5491122334455              | whatsapp | 5491122334455 (5491122334455)      |
			| ulises_backup_20@gmail.com | mail     | ulises_backup_20@gmail.com         |
		Cuando Sandra elimina masivamente las siguientes casillas de mail
			"""
				ulises_backup_20@gmail.com,pepe@mail.com  
			"""
		Entonces la lista quedara con los siguientes perfiles
			| Nombre              | RRSS     | cuentas                            |
			| SalaLeopoldoLugones | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
			| 5491122334455       | whatsapp | 5491122334455 (5491122334455)      |
		Ejemplos: 
			| @lista                         |
			| Lista de Perfiles No Contactar |