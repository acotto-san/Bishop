#language: es
Característica: Dar de baja masivamente numeros de whatsapp de una lista de perfiles
	Se desea dar de baja masivamente numeros de whatsapp de la lista de perfiles, al proveer una lista de numeros que se desean eliminar.

	@tc:5357
	Esquema del escenario: se elimina masivamente numeros de whatsapp de una lista de perfiles
		Dado que Sandra es una supervisora que se encuentra en la <@lista>
		Y que la <@lista> posee los siguientes perfiles:
			| Nombre                 | RRSS     | cuentas                            |
			| pepe@mail.com          | mail     | pepe@mail.com                      |
			| SalaLeopoldoLugones    | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
			| 5491122334455          | whatsapp | 5491122334455 (5491122334455)      |
			| Perfil Ulises Whatsapp | whatsapp | 5491122223333 (5491122223333)      |
			| 5491133334444          | whatsapp | 5491133334444 (5491133334444)      |
		Cuando Sandra elimina masivamente los siguientes numeros de whatsapp
			"""
				5491122334455,5491122223333
			"""
		Entonces la lista quedara con los siguientes perfiles
			| Nombre                 | RRSS     | cuentas                            |
			| pepe@mail.com          | mail     | pepe@mail.com                      |
			| SalaLeopoldoLugones    | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
			| 5491133334444          | whatsapp | 5491133334444 (5491133334444)      |
		Ejemplos: 
			| @lista                         |
			| Lista de Perfiles No Contactar |

	@tc:5358
	Esquema del escenario: la baja no se interrumpe al ingresar un numero que no estaba presente en la lista de perfiles
		Dado que Sandra es una supervisora que se encuentra en la <@lista>
		Y que la <@lista> posee los siguientes perfiles:
			| Nombre              | RRSS     | cuentas                            |
			| pepe@mail.com       | mail     | pepe@mail.com                      |
			| SalaLeopoldoLugones | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
			| 5491133334444       | whatsapp | 5491133334444 (5491133334444)      |
		Cuando Sandra elimina masivamente los siguientes numeros de whatsapp
			"""
				5491133334444,5491122334455
			"""
		Entonces la lista quedara con los siguientes perfiles
			| Nombre              | RRSS     | cuentas                            |
			| pepe@mail.com       | mail     | pepe@mail.com                      |
			| SalaLeopoldoLugones | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
		Ejemplos: 
			| @lista                         |
			| Lista de Perfiles No Contactar |