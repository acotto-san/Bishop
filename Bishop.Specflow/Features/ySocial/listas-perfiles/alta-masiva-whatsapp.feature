#language: es
Característica: Dar de alta masivamente numeros de whatsapp a una lista de perfiles
	Se desea agregar  muchos numeros de whatsapp a una lista en una sola carga.

	Antecedentes: 
		Dado que el usuario Ulises posee las siguientes cuentas de whatsapp:
		| perfil en ySocial      | numero de whatsapp | se contacto previamente |
		| Perfil Ulises Whatsapp | 5491122223333      | si                |
		| null                   | 5491133334444      | no                |

	Regla de negocio: Se permite cargar usuarios que ya escribieron a la plataforma
		@tc:5340
		Esquema del escenario: Se carga en una lista de perfiles a un numero de whatsapp que ya escribio a la plataforma
			Dado que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra intenta agregar desde la carga masiva de whatsapp al numero 5491122223333
			Entonces en la lista debera quedar agregado el perfil "Perfil Ulises Whatsapp"

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |

	Regla de negocio: Se  permite cargar usuarios que nunca escribieron a la plataforma
		@tc:5341
		Esquema del escenario: Se carga en una lista de perfiles a un numero de whatsapp que nunca escribio a la plataforma
			Dado que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra intenta agregar desde la carga masiva de whatsapp a la cuenta 5491133334444
			Entonces en la lista debera quedar agregado el perfil "5491133334444"

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |

	Regla de negocio: Se pueden dar de alta muchos usuarios
		@tc:5342
		Esquema del escenario: alta masiva de numeros de whatsapp a una lista
			Dado que la <@lista> posee cargados los siguientes perfiles:
				| Nombre              | RRSS     | cuentas                            |
				| pepe@mail.com       | mail     | pepe@mail.com                      |
				| SalaLeopoldoLugones | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
				| 5491122334455       | whatsapp | 5491122334455 (5491122334455)      |
			Y que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra agrega masivamente los siguientes numeros de whatsapp:
				"""
					5491122223333,5491133334444
				"""
			Entonces la lista debera quedar con los siguientes perfiles:
				| Nombre                 | RRSS     | cuentas                            |
				| pepe@mail.com          | mail     | pepe@mail.com                      |
				| SalaLeopoldoLugones    | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
				| 5491122334455          | whatsapp | 5491122334455 (5491122334455)      |
				| Perfil Ulises Whatsapp | whatsapp | 5491122223333 (5491122223333)      |
				| 5491133334444          | whatsapp | 5491133334444 (5491133334444)      |

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |
		@tc:5343
		Esquema del escenario: un numero de whatsapp de la carga masiva ya se encontraba en la lista
			Dado que la <@lista> posee cargados los siguientes perfiles:
				| Nombre              | RRSS     | cuentas                            |
				| pepe@mail.com       | mail     | pepe@mail.com                      |
				| SalaLeopoldoLugones | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
				| 5491122334455       | whatsapp | 5491122334455 (5491122334455)      |
			Y que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra agrega masivamente los siguientes numeros de whatsapp:
				"""
					5491122334455,5491122223333
				"""
			Entonces se le informara a Sandra que la carga de usuarios fue exitosa
			Y que el numero 5491122334455 no fue agregado por ya estar presente en la lista

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |


