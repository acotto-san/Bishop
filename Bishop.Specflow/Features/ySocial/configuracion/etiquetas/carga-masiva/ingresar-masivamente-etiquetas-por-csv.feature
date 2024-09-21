 #language: es
Característica: Tener muchas etiquetas en un csv para ingresar a la carga masiva de etiquetas
	Se desea que la carga masiva admita una alta cantidad de etiquetas.
	Se resuelve ingresarlas en un csv con una estructura determinada que sera graficada con los ejemplos a continuacion


	Regla de negocio: Cada registro debe tener una etiqueta
		
		@tc:5913
		Esquema del escenario: una etiqueta ocupa un renglon de csv y cada nivel de la etiqueta esta entre comas
			Dado que un supervisor intenta crear una etiqueta de nivel <nivel de la etiqueta> mediante la carga masiva
			Cuando define en un renglon de un csv la etiqueta de la siguiente manera
				"""
					<definicion del ejemplo>
				"""
			E utiliza el csv para la carga masiva de etiquetas
			Entonces la etiqueta <nombre de etiqueta> sera creada	

		Ejemplos:
			| nivel de la etiqueta | definicion del ejemplo                   | nombre de etiqueta                       |
			| 2                    | Etiquetas Ventas,nivel 2,,               | Etiquetas Ventas/nivel 2                 |
			| 3                    | Etiquetas Ventas,nivel 2,nivel 3,        | Etiquetas Ventas/nivel 2/nivel 3         |
			| 4                    | Etiquetas Ventas,nivel 2,nivel 3,nivel 4 | Etiquetas Ventas/nivel 2/nivel 3/nivel 4 |

		@tc:5914
		Escenario: Se pueden utilizar en el csv etiquetas de diferentes niveles al mismo tiempo
			Dado que un supervisor intenta crear etiquetas de nivel 2 y 3 mediante la carga masiva
			Cuando define en un renglon de un csv las etiquetas de la siguiente manera
				"""
					Etiquetas Ventas,Ventas Internacionales,,
					Etiquetas Ventas,Ventas Nacionales, Ventas CABA,
				"""
			E utiliza el csv para la carga masiva de etiquetas
			Entonces las siguientes etiquetas estarán creadas
				| nombre de la etiqueta                          | nivel de la etiqueta |
				| Etiquetas Ventas/Ventas Internacionales         | 2                    |
				| Etiquetas Ventas/Ventas Nacionales/Ventas CABVA | 3                    |

	Regla de negocio: Un csv puede contener datos invalidos y va a interrumpir la totalidad de la carga masiva
		
		@tc:5915
		Escenario: un renglon del csv referencia a una etiqueta de nivel 1 e interrumpe la carga masiva
			Dado un csv que contiene la siguiente definicion donde se encuentra una etiqueta de nivel uno
				"""
					Etiquetas Ventas, Ventas Internacionales,Ventas Mercosur,
					Etiquetas Reclamos,,,
					Etiquetas Administracion,Balances,,
				"""
			Cuando un supervisor utilice el csv para la carga masiva de etiquetas
			Entonces ninguna de las etiquetas del csv seran procesadas (ya sea creadas o modificadas)

		@tc:5916
		Escenario: un renglon del csv no respeta los 4 campos obligatorios e interrumpe la carga masiva
			Dado un csv que contiene la siguiente definicion donde se encuentra una etiqueta que no posee todos sus campos separados por comas
				"""
					Etiquetas Ventas, Ventas Internacionales,Ventas Mercosur,
					Etiquetas Reclamos,Reclamos Internos
					Etiquetas Administracion,Balances,,
				"""
			Cuando un supervisor utilice el csv para la carga masiva de etiquetas
			Entonces ninguna de las etiquetas del csv seran procesadas (ya sea creadas o modificadas)

		@tc:5917
		Esquema del escenario: una etiqueta en el csv contiene un campo obligatorio vacio e interrumpe la carga masiva
			Dado un csv que contiene la siguiente definicion donde se encuentra una etiqueta que no posee alguno de sus niveles antecesores
				"""
					Etiquetas Ventas, Ventas Internacionales,Ventas Mercosur,
					<etiqueta invalida>
					Etiquetas Administracion,Balances,,
				"""
			Cuando un supervisor utilice el csv para la carga masiva de etiquetas
			Entonces ninguna de las etiquetas del csv seran procesadas (ya sea creadas o modificadas)

		Ejemplos: 
			| etiqueta invalida                                         |
			| Etiquetas Reclamos,Reclamos Internos,,Facturacion Mensual |
			| Etiquetas Reclamos,,Facturacion,Facturacion Mensual       |
			| ,Reclamos Internos,Facturacion,Facturacion Mensual        |

	Regla de negocio: Inconsistencias del csv que son ignoradas

		@tc:5918
		Escenario: En el archivo csv se tiene un registro duplicado y no interrumpe la carga masiva
			Dado un csv que contiene la siguiente definicion donde se encuentra una duplicada
				"""
					Etiquetas Ventas, Ventas Internacionales,Ventas Mercosur,
					Etiquetas Administracion,Balances,,
					Etiquetas Ventas, Ventas Internacionales,Ventas Mercosur,
				"""
			Y dado que ninguna de las etiquetas se encuentran creadas en ySocial
			Cuando un supervisor utilice el csv para la carga masiva de etiquetas 
			Entonces la carga se realizara correctamente 
			Y las siguientes etiquetas quedaran creadas en ySocial
				| nombre de etiqueta (ruta)                               |
				| Etiquetas Ventas/Ventas Internacionales/Ventas Mercosur |
				| Etiquetas Administracion/Balances                       |

		@tc:5919
		Escenario: En el archivo csv se tiene una linea vacia al final y no interrumpe la carga 
			Dado un csv que contiene la siguiente definicion donde el final del csv contiene una linea vacia
				"""
					Etiquetas Ventas, Ventas Internacionales,Ventas Mercosur,
					Etiquetas Administracion,Balances,,

				"""
			Y dado que ninguna de las etiquetas se encuentran creadas en ySocial
			Cuando un supervisor utilice el csv para la carga masiva de etiquetas 
			Entonces la carga se realizara correctamente 
			Y las siguientes etiquetas quedaran creadas en ySocial
				| nombre de etiqueta (ruta)                               |
				| Etiquetas Ventas/Ventas Internacionales/Ventas Mercosur |
				| Etiquetas Administracion/Balances                       |

		@tc:5920
		Escenario: En el archivo csv se referencia una etiqueta que es contenedaora de otras y se la ignora sin interrumpir la carga masiva
			Dado que en ySocial existen las siguientes etiquetas
				| etiquetas preexistentes                  |
				| Etiquetas VIP/Campaña B2B/Sector publico |
				| Etiquetas VIP/Campaña B2B/Sector privado |
			Y un csv que contiene la siguiente definicion donde se encuentra una etiqueta preexistente que ya posee etiquetas hijas
				"""
					Etiqueta Ventas, Ventas Internacionales,Ventas Mercosur,
					Etiqueta VIP,Campaña B2B,,
					Etiqueta Administracion,Balances,,
				"""
			Cuando un supervisor utilice el csv para la carga masiva de etiquetas
			Entonces se realizara correctamente la carga masiva de todo el csv
			Y se ignorara la referencia de la etiqueta "Etiqueta VIP/Campaña B2B" de la linea 2
