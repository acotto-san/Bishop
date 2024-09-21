#language: es
Característica: Dar de alta masivamente usuarios de mail a una lista de perfiles
	Se desea agregar  muchos usuarios de mail a una lista en una sola carga.

	Antecedentes: 
		Dado que el usuario Ulises posee las siguientes cuentas de Mail:
		| perfil en ySocial  | cuenta Mail                                     | se contacto previamente |
		| Perfil Ulises Mail | Ulises Tester ulises_tester_20@gmail.com        | si                |
		| null               | Ulises Tester Backup ulises_backup_20@gmail.com | no                |

	Regla de negocio: Se permite cargar usuarios que ya escribieron a la plataforma
		@tc:5329
		Esquema del escenario: Se carga en una lista de perfiles a una cuenta de mail que ya escribio a la plataforma
			Dado que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra intenta agregar desde la carga masiva de mail a la cuenta ulises_tester_20@gmail.com    
			Entonces en la lista debera quedar agregado el perfil "Perfil Ulises Mail"

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |

	Regla de negocio: Se  permite cargar usuarios que nunca escribieron a la plataforma
		@tc:5330
		Esquema del escenario: Se carga en una lista de perfiles a una cuenta de mail que nunca escribio a la plataforma
			Dado que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra intenta agregar desde la carga masiva de mail a la cuenta ulises_backup_20@gmail.com
			Entonces en la lista debera quedar agregado el perfil "ulises_backup_20@gmail.com"

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |

	Regla de negocio: Se pueden dar de alta muchos usuarios
		@tc:5331
		Esquema del escenario: alta masiva de cuentas de mail a una lista
			Dado que la <@lista> posee cargados los siguientes perfiles:
				| Nombre              | RRSS     | cuentas                            |
				| pepe@mail.com       | mail     | pepe@mail.com                      |
				| SalaLeopoldoLugones | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
				| 5491122334455       | whatsapp | 5491122334455 (5491122334455)      |
			Y que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra agrega masivamente las siguientes cuentas de mail:
				"""
					ulises_tester_20@gmail.com,ulises_backup_20@gmail.com
				"""
			Entonces la lista debera quedar con los siguientes perfiles:
				| Nombre                     | RRSS     | cuentas                                  |
				| pepe@mail.com              | mail     | pepe@mail.com                            |
				| SalaLeopoldoLugones        | twitter  | @Sala_Lugones(SalaLeopoldoLugones)       |
				| 5491122334455              | whatsapp | 5491122334455 (5491122334455)            |
				| Perfil Ulises Mail         | mail     | Ulises Tester ulises_tester_20@gmail.com |
				| ulises_backup_20@gmail.com | mail     | ulises_backup_20@gmail.com               |

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |
		@tc:5332
		Esquema del escenario: una casilla de mail de la carga masiva ya se encontraba en la lista
			Dado que la <@lista> posee cargados los siguientes perfiles:
				| Nombre              | RRSS     | cuentas                            |
				| pepe@mail.com       | mail     | pepe@mail.com                      |
				| SalaLeopoldoLugones | twitter  | @Sala_Lugones(SalaLeopoldoLugones) |
				| 5491122334455       | whatsapp | 5491122334455 (5491122334455)      |
			Y que Sandra es una supervisora que se encuentra en la <@lista>
			Cuando Sandra agrega masivamente las siguientes cuentas de mail:
				"""
					ulises_tester_20@gmail.com,pepe@mail.com
				"""
			Entonces se le informara a Sandra que la carga de usuarios fue exitosa
			Y que la cuenta pepe@mail.com no fue agregado por ya estar presente en la lista

			Ejemplos: 
				| @lista                         |
				| Lista de Perfiles No Contactar |

