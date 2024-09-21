#language: es
Característica: Modificar masivamente configuracion de Colas asociadas y Grupos de Etiquetas
	Se desea que al procesar una lista masiva de etiquetas se le aplique a todas la configuracion que se seleccione en el formulario.
	Entidades que se pueden configurar en el formulario:
		-grupos de etiquetas a la que pertenece la etiqueta
		-colas asociadas a la etiqueta

	Regla de negocio: Se puede borrar toda la configuracion vieja de las etiquetas mencionadas y pisar con lo nuevo
		
		@tc:5910
		Esquema del escenario: En una carga masiva se elimina la configuracion de grupos de etiquetas y colas asociadas y queda se reemplazada por lo nuevo
			Dado que la etiqueta "Equipo I/nivel 2" posee la siguiente configuracion
				| grupos de etiquetas | colas asociadas |
				| grupo pepe          | AAA,Cola A      |
			Cuando un supervisor realiza una carga masiva de etiquetas que contiene la etiqueta mencionada
			Y en el formulario de carga masiva selecciono la siguiente configuracion
				| accion     | grupo de etiquetas | colas asociadas   |
				| reemplazar | <grupo a asociar>  | <colas a asociar> |
			Entonces la etiqueta tendra la siguiente configuracion
				| grupo de etiquetas | colas asociadas   |
				| <resultado grupo>  | <resultado colas> |

			Ejemplos: ejemplos donde alguna configuracion queda vacia
				| grupo a asociar | colas a asociar | resultado grupo | resultado colas |
				| vacio           | vacio           | vacio           | vacio           |
				| vacio           | BBB             | vacio           | BBB             |
				| Etiquetas VIP   | vacio           | Etiquetas VIP   | vacio           |

			Ejemplos: ejemplos donde se asocia una o mas entidades en cada campo
				| grupo a asociar                   | colas a asociar | resultado grupo                   | resultado colas |
				| Etiquetas VIP                     | BBB             | Etiquetas VIP                     | BBB             |
				| Etiquetas VIP                     | BBB,Cola B      | Etiquetas VIP                     | BBB,Cola B      |
				| Etiquetas VIP,Etiquetas de Ventas | BBB             | Etiquetas VIP,Etiquetas de Ventas | BBB             |
				| 30 grupos                         | 100 colas       | 30 grupos                         | 100 colas       |

	Regla de negocio: Se puede mantener toda la configuracion vieja de las etiquetas mencionadas y mezclar con lo nuevo

		@tc:5911
		Esquema del escenario: En una carga masiva se mezcla la data nueva de configuracion de grupos de etiqueta y colas asociadas con la data vieja
			Dado que la etiqueta "Equipo I/nivel 2" posee la siguiente configuracion
				| grupos de etiquetas | colas asociadas |
				| grupo pepe          | AAA,Cola A      |
			Cuando un supervisor realiza una carga masiva de etiquetas que contiene la etiqueta mencionada
			Y en el formulario de carga masiva selecciono la siguiente configuracion
				| accion     | grupo de etiquetas | colas asociadas   |
				| reemplazar | <grupo a asociar>  | <colas a asociar> |
			Entonces la etiqueta tendra la siguiente configuracion
				| grupo de etiquetas | colas asociadas   |
				| <resultado grupo>  | <resultado colas> |

			Ejemplos: ejemplos donde alguna configuracion queda vacia
				| grupo a asociar | colas a asociar | resultado grupo | resultado colas |
				| vacio           | vacio           | vacio           | vacio           |
				| vacio           | BBB             | vacio           | BBB             |
				| Etiquetas VIP   | vacio           | Etiquetas VIP   | vacio           |

			Ejemplos: ejemplos donde se asocia una o mas entidades en cada campo
				| grupo a asociar                   | colas a asociar | resultado grupo                              | resultado colas        |
				| Etiquetas VIP                     | BBB             | grupo pepe, Etiquetas VIP                    | AAA,Cola A,BBB         |
				| Etiquetas VIP                     | BBB,Cola B      | grupo pepe,Etiquetas VIP                     | AAA,Cola A,BBB,Cola B  |
				| Etiquetas VIP,Etiquetas de Ventas | BBB             | grupo pepe,Etiquetas VIP,Etiquetas de Ventas | AAA,Cola A,BBB         |
				| 30 grupos                         | 100 colas       | (grupo pepe)+30 grupos                       | (AAA,Cola A)+100 colas |

	Regla de negocio: Cuando se utiliza la opcion reemplaza solo deberia pisar la config de colas y grupo de etiquetas pero el resto no deberia afectarse

		@tc:5912
		Escenario: Configuracion de color y clave de la etiqueta no se modifica cuando se utiliza la opcion reemplazar en carga masiva de etiquetas
			Dado que la etiqueta "Equipo I/nivel 2" posee la siguiente configuracion
				| grupos de etiquetas | colas asociadas | color | clave    |
				| grupo pepe          | AAA,Cola A      | rojo  | claveVIP |
			Cuando un supervisor realiza una carga masiva de etiquetas que contiene la etiqueta mencionada
			Y en el formulario de carga masiva selecciono la siguiente configuracion
				| accion     | grupo de etiquetas | colas asociadas |
				| reemplazar | vacio              | vacio           |
			Entonces la configuracion de color y clave seguira siendo la misma