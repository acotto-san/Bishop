#language: es
Característica: Dar de alta masivamente usuarios de twitter a una lista de perfiles
	Se desea agregar  muchos usuarios de twitter a una lista en una sola carga.

	Antecedentes: 
		Dado que el usuario Ulises posee las siguientes cuentas de Twitter:
		| perfil en ySocial     | cuenta Twitter                  | se contacto previamente |
		| Perfil Ulises Twitter | @ulisesTest20 (ulises tester)   | si                |
		| null                  | @ulisesBackup20 (ulises backup) | no                |

		Y que la usuaria Ursula posee las siguientes cuentas de Twitter:
		| perfil en ySocial     | cuenta Twitter                  | se contacto previamente |
		| Perfil Ursula Twitter | @ursulaTest20 (ursula tester)   | si                |
		| null                  | @ursulaBackup20 (ursula backup) | no                |

	Regla de negocio: Se permite cargar usuarios que ya escribieron a la plataforma
		@tc:5334
		Esquema del escenario: Se carga en una lista de perfiles a una cuenta de twitter que ya escribio a la plataforma
			Dado que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra intenta agregar desde la carga masiva de twitter al username ulisesTest20
			Entonces en la lista debera quedar agregado el perfil "Perfil Ulises Twitter"

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |
			

	Regla de negocio: Se  permite cargar usuarios que nunca escribieron a la plataforma
		@tc:5363
		Esquema del escenario: Se carga en una lista de perfiles a una cuenta de twitter que nunca escribio a la plataforma
			Dado que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra intenta agregar desde la carga masiva de twitter al username ursulaBackup20
			Entonces en la lista debera quedar agregado el perfil "ursula backup"

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |


	Regla de negocio: Se pueden dar de alta muchos usuarios
		@tc:5335
		Esquema del escenario: alta masiva de cuentas de twitter a una lista
			Dado que la <@lista> posee cargados los siguientes perfiles:
				| Nombre              | RRSS     | cuentas                            |
				| pepe@mail.com       | mail     | pepe@mail.com                      |
				| SalaLeopoldoLugones | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
				| 5491122334455       | whatsapp | 5491122334455 (5491122334455)      |
			Y que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra agrega masivamente las siguientes cuentas de twitter:
				"""
					ulisesTest20,ulisesBackup20,ursulaTest20,ursulaBackup20
				"""
			Entonces la lista debera quedar con los siguientes perfiles:
				| Nombre                | RRSS     | cuentas                            |
				| pepe@mail.com         | mail     | pepe@mail.com                      |
				| SalaLeopoldoLugones   | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
				| 5491122334455         | whatsapp | 5491122334455 (5491122334455)      |
				| Perfil Ulises Twitter | twitter  | @ulisesTest20 (ulises tester)      |
				| ulises backup         | twitter  | @ulisesBackup20 (ulises backup)    |
				| Perfil Ursula Twitter | twitter  | @ursulaTest20 (ursula tester)      |
				| ursula backup         | twitter  | @ursulaBackup20 (ursula backup)    |

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |

		@tc:5336
		Esquema del escenario: un usuario de la carga masiva ya se encontraba en la lista
			Dado que la <@lista> posee cargados los siguientes perfiles:
				| Nombre              | RRSS     | cuentas                            |
				| pepe@mail.com       | mail     | pepe@mail.com                      |
				| SalaLeopoldoLugones | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
				| 5491122334455       | whatsapp | 5491122334455 (5491122334455)      |
			Y que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra agrega masivamente las siguientes cuentas de twitter:
				"""
					ulisesTest20,Sala_Lugones
				"""
			Entonces se le informara a Sandra que la carga de usuarios fue exitosa
			Y que la cuenta Sala_Lugones no fue agregado por ser un usuario invalido

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |

	Regla de negocio: Se van a validar si los username de twitter realmente existen en la rrss
		@tc:5337
		Esquema del escenario: supervisor intenta agregar un usuario de twitter inexistente en el alta masiva de twitter
			Dado que no existe una cuenta en twitter con el username @qwdasdovk22
			Y que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra intenta agregar desde la carga masiva de twitter al username qwdasdovk22
			Entonces no se podra realizar el alta de dicho usuario

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |
		@tc:5338
		Esquema del escenario: usuario inexistente entre un alta masiva de usuarios de twitter en una lista de perfiles
			Dado que no existe una cuenta en twitter con el username @qwdasdovk22
			Y que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra agrega masivamente las siguientes cuentas de twitter:
				"""
					qwdasdovk22,Sala_Lugones
				"""
			Entonces se le informara que la carga de usuarios fue exitosa
			Y que el usuario qwdasdovk22 no fue agregado por ser inexistente en twitter

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |