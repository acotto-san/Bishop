#language: es
Característica: Se reflejan los datos de los mensajes entrantes en ySocial

	Se realizan mejoras google business, con el objetido de capturar los datos de las interacciones que realicen los usuarios con cada sucursal del negocio, 
	para luego reflejar los datos en ySocial. Se modifican las vistas del agente web y del supervisor

Regla: Se transmiten los datos de la sucursal

	@tc:8702 
	Esquema del escenario: El agente visualiza el nombre y dirección de la sucursal 
		Dado un cliente tiene declaradas dos sucursales en su cuenta de Google MB
			| Sucursal           | Direccion     |
			| zero gluten market | riglos 394    |
			| zero gluten resto  | Arenales 3370 |
		Cuando un usuario deja una <comentario> en la <sucursal>
		Y el agente selecciona <seccion>
		Entonces el agente visualiza los siguientes datos:
			| Sucursal   | Direccion   |
			| <sucursal> | <direccion> |

		Ejemplos: 
			| seccion                  | comentario | sucursal           | direccion     |
			| informacion del entrante | reseña     | zero gluten market | riglos 394    |
			| fecha y hora del mensaje | pregunta   | zero gluten resto  | Arenales 3370 |


	@tc:8703 
	Esquema del escenario:El supervisor visualiza el nombre y dirección de la sucursal 
		Dado un cliente tiene declaradas dos sucursales en su cuenta de Google MB
			| Sucursal           | Direccion     |
			| zero gluten market | riglos 394    |
			| zero gluten resto  | Arenales 3370 |
		Cuando un usuario deja una <comentario> en la <sucursal>
		Entonces el supervisor visualiza los siguientes datos de la sucursal en el detallado de casos><modal>:
			| sucursal   | direccion   |
			| <sucursal> | <direccion> |

			Ejemplos: 
			| modal                                      | comentario | sucursal           | direccion     |
			| Datos del Mensaje> Información del mensaje | reseña     | zero gluten market | riglos 394    |
			| Datos del caso>Mensaje                     | pregunta   | zero gluten resto  | Arenales 3370 |

Regla: Permite identificar el tipo de mensaje entrante: reseña o pregunta

	@tc:8704
	Esquema del escenario: El agente visualiza el tipo de mensaje en el entrante
		Dado que ingresa un mensaje de tipo <tipo de mensaje> a la web del agente
		Cuando el agente selecciona el entrante
		Entonces debera ver <tipo de mensaje> como tipo de mensaje en la informacion del entrante

		Ejemplos:
			| tipo de mensaje |
			| reseña          |
			| pregunta        |

	@tc:8705
	Esquema del escenario: El agente visualiza el tipo de mensaje en la información detallada del mensaje
		Dado que ingresa un mensaje de <tipo de mensaje> a la web del agente
		Cuando el agente selecciona la fecha y hora del mensaje
		Entonces debera ver <tipo de mensaje> como tipo de mensaje en la informacion del entrante

		Ejemplos:
			| tipo de mensaje |
			| reseña          |
			| pregunta        |

	@tc:8706
	Esquema del escenario: El supervisor visualiza el tipo de mensaje en el detallado del caso
		Dado un caso de google MB con un mensaje de <tipo de mensaje> 
		Cuando el supervisor visualiza ese caso en el detallado de casos > <modal>
		Entonces debera ver <tipo de mensaje> como tipo de mensaje en la informacion del mensaje

		Ejemplos:
			| modal                                      | tipo de mensaje |
			| Datos del Mensaje> Informacion del mensaje | reseña          |
			| datos del caso> Mensaje                    | pregunta        |

Regla: Permite identificar los datos del usuario que envia el mensaje

	@tc:8707
	Esquema del escenario:El agente visualiza los datos del usuario que envia el mensaje
		Dado que un usuario envia un mensaje de <tipo de mensaje>
		Cuando el agente selecciona el entrante
		Entonces debera ver los siguientes datos del usuario en el mensaje:
			| datos de usuario   |
			| Nombre del usuario |
			| Foto de perfil     |

		Ejemplos:
			| tipo de mensaje |
			| reseña          |
			| pregunta        |

	@tc:8708
	Esquema del escenario: El supervisor visualiza los datos del usuario que envia el mensaje
		Dado que un usuario envia un mensaje de <tipo de mensaje>
		Cuando el supervisor visualiza ese caso en el detallado de casos> <modal>
		Entonces debera ver los siguientes datos del usuario en la informacion del mensaje:
			| datos de usuario   |
			| Nombre del usuario |
			| Foto de perfil     |

		Ejemplos:
			| modal                                       | tipo de mensaje |
			| Datos del Mensaje > Informacion del mensaje | reseña          |
			| Datos del caso > Mensaje                    | pregunta        |

Regla: Se transmite la fecha y hora del mensaje entrante

	@tc:8709
	Esquema del escenario: El agente visualiza la fecha y hora del mensaje entrante
		Dado que un usuario envia un mensaje de tipo <tipo de mensaje> el 10 de mayo a las 15:00hs
		Cuando el agente selecciona el entrante
		Entonces debera ver 10/05/2024 15:00 en la informacion del mensaje

		Ejemplos:
			| tipo de mensaje |
			| reseña          |
			| pregunta        |

	@tc:8710 
	Esquema del escenario: El supervisor visualiza la fecha y hora del mensaje entrante
		Dado que un usuario envia un mensaje de tipo <tipo de mensaje> el 10 de mayo a las 15:00hs
		Cuando el supervisor visualiza ese caso en el detallado de casos> <modal>
		Entonces debera ver 10/05/2024 15:00 en la informacion del mensaje


		Ejemplos:
			| modal                                      | tipo de mensaje |
			| Datos del Mensaje> Información del mensaje | reseña          |
			| datos del caso>Mensaje                     | pregunta        |

Regla: Se transmite a ySocial la valoración que el usuario debe colocar obligatoriamente en su reseña.

	@tc:8711 
	Esquema del escenario: El agente visualiza el ranking de la reseña en el mensaje entrante
		Dado que un usuario califica una reseña con <estrellas> estrellas
		Cuando el agente selecciona ese mensaje entrante
		Entonces debera ver el mensaje con las <estrellas> estrellas rankeadas

		Ejemplos:
			| estrellas |
			| 1         |
			| 2         |
			| 3         |
			| 4         |
			| 5         |

	@tc:8712 
	Esquema del escenario: El agente visualiza el ranking de la reseña en la información detallada del mensaje
		Dado que un usuario califica una reseña con <estrellas> estrellas
		Cuando el agente selecciona la hora del mensaje
		Entonces debera ver las <estrellas> estrellas rankeadas en el mensaje
		
		Ejemplos:
			| estrellas |
			| 1         |
			| 2         |
			| 3         |
			| 4         |
			| 5         |

	@tc:8713
	Esquema del escenario: El supervisor visualiza el ranking de la reseña en la información del caso	
		Dado que un usuario califica una reseña con <estrellas> 
		Cuando el supervisor visualiza ese caso en el detallado de casos> <modal>
		Entonces debera ver las <estrellas> rankeadas en el mensaje

		Ejemplos: 
			| modal                                      | estrellas |
			| Datos del Mensaje> Informacion del mensaje | 1         |
			| Datos del Mensaje> Informacion del mensaje | 2         |
			| Datos del Mensaje> Informacion del mensaje | 3         |
			| Datos del caso>Mensaje                     | 4         |
			| Datos del caso>Mensaje                     | 5         |

	@tc:8714 
	Esquema del escenario: Usuario intenta valorar un mensaje por fuera de los límites de estrellas
		Dado que un usuario intenta valorar un mensaje de tipo <tipo de mensaje>
		Cuando ingresa <estrellas>
		Entonces no logra hacerlo

			Ejemplos:
			| tipo de mensaje | estrellas |
			| reseña          | 0         |
			| reseña          | 6         |
			| pregunta        | 3         |

Regla: Los mensajes traducidos solo reflejarán su contenido original, no se verá el extracto "Translated by Google"

	@tc:8715
	Esquema del escenario: Agente visualiza el contenido original de un mensaje traducido por Google
		Dado que ingresa un mensaje de tipo <tipo de mensaje> con traduccion a la web del agente
		Cuando se visualiza el contenido del mensaje
		Entonces no se debera ver la aclaracion de "(Translated by google)" u "(Original)"

		Ejemplos: 
			| tipo de mensaje |
			| reseña          |
			| pregunta        |

	@tc:8716
	Esquema del escenario: Supervisor visualiza el contenido original de un mensaje traducido por Google
		Dado que ingresa un caso con mensaje de tipo <tipo de mensaje> con traduccion
		Cuando el supervisor busca ese caso en el detallado de casos 
		Y visualiza el contenido del mensaje
		Entonces no se debera ver la aclaracion de "(Translated by google)" u "(Original)"

		Ejemplos: 
			| tipo de mensaje |
			| reseña          |
			| pregunta        |

Regla: Google no devuelve los adjuntos para el caso de las reseñas, se ignoran los adjuntos que envia el usuario.

	@tc:8717
	Esquema del escenario: Se omiten los adjuntos en la web del agente
		Dado que un usuario envia un adjunto en su reseña
		Cuando el agente selecciona el entrante
		Entonces se omite el adjunto en la informacion del mensaje

	@tc:8718
	Esquema del escenario: Se omiten los adjuntos en la información del mensaje reportada en el detallado de casos
		Dado que un usuario envia un adjunto en su reseña
		Cuando el supervisor busca ese caso en el detallado de casos 
		Y visualiza el contenido del mensaje
		Entonces se omite el adjunto en la informacion del mensaje