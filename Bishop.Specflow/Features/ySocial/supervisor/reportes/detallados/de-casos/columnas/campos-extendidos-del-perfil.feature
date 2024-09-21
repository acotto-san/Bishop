#language: es 
Característica: Incluir en el reporte los campos extendidos del perfil
	Se desea que haya una configuración en el formulario del reporte pra poder incluir en 
	columnas los campos extendidos de perfil.

	Ejemplo de campos extendidos para configurar en parametros de sistema > pestaña global:
				| nombre de campo   | Descripcion          | tipo de dato | validacion                                                  |
				| campoTipoTexto    | 1er campo (texto)    | texto        | dos palabras separadas por un espacio(REGEX: "\\w+\\s\\w+") |
				| campoTipoNumero   | 2do campo (numero)   | numero       | entre 10 y 999999                                           |
				| campoTipoBooleano | 3er campo (booleano) | si/no        | implicita                                                   |
				| campoTipoDecimal  | 4to campo (decimal)  | decimal      | entre 10.99 y 999999.99                                     |
				| campoTipoLista    | 5to campo (lista)    | lista        | 0 (cliente no activo) o 1 (cliente activo)                  |
				| campoTipoFecha    | 6to campo (fecha)    | fecha        | entre 29/01/1900 y el día @@HOY@@                           |

	Regla de negocio: La visibilidad de las columnas en el reporte depende del check en el formulario
	
		@tc:5850
		Esquema del escenario: Supervisor visualiza columnas de campos extendidos del perfil en el Detallado de Casos online
			Dado que en Parametros de Sistema se tienen configurados los siguientes Campos Extendidos del Perfil
				| nombre de campo | descripcion        |
				| campoTipoTexto  | 1er campo (texto)  |
				| campoTipoNumero | 2do campo (numero) |
			Y un supervisor se encuentra en el formulario del reporte Detallado de Casos
			Y el check "Incluir Extendido del Perfil de Usuario" se encuentra <estado de check>
			Cuando confirma el formulario de busqueda
			Entonces en el reporte online estaran <visualizacion de columnas> las siguientes columnas
				| nombres de columnas |
				| 1er campo (texto)   |
				| 2do campo (numero)  |

			Ejemplos: 
				| estado de check | visualizacion de columnas |
				| habilitado      | presentes                 |
				| deshabilitado   | ausentes                  |

		@tc:5851
		Esquema del escenario: Supervisor visualiza columnas de campos extendidos del perfil en el Detallado de Casos exportado manualmente
		    Dado que en Parametros de Sistema se tienen configurados los siguientes Campos Extendidos del Perfil
				| nombre de campo | descripcion        |
				| campoTipoTexto  | 1er campo (texto)  |
				| campoTipoNumero | 2do campo (numero) | 
			Y un supervisor visualizando la vista online de un reporte Detallado de Casos que se encuentra <paginacion>
            Y el reporte lo genero con el check "Incluir Extendido del Perfil de Usuario" <estado del check> en el formulario del reporte
			Cuando el supervisor descargue el reporte desde <opcion>
			Entonces en el archivo descargado estaran <visualizacion de columnas> las siguientes columnas
				| nombres de columnas |
				| 1er campo (texto)   |
				| 2do campo (numero)  |

			Ejemplos: ejemplos con el check habilitado
				| estado del check | paginacion     | opcion            | visualizacion de columnas |
				| habilitado       | sin paginacion | exportar          | presentes                 |
				| habilitado       | con paginacion | exportar completo | presentes                 |
				| habilitado       | con paginacion | exportar visible  | presentes                 |


			Ejemplos: ejemplos con el check deshabilitado
				| estado del check | paginacion     | opcion            | visualizacion de columnas |
				| deshabilitado    | sin paginacion | exportar          | ausentes                  |
				| deshabilitado    | con paginacion | exportar completo | ausentes                  |
				| deshabilitado    | con paginacion | exportar visible  | ausentes                  |

		@tc:5852
		Esquema del escenario: Supervisor visualiza columnas de campos extendidos del perfil en el Detallado de Casos programado
			Dado que en Parametros de Sistema se tienen configurados los siguientes Campos Extendidos del Perfil
				| nombre de campo | descripcion        |
				| campoTipoTexto  | 1er campo (texto)  |
				| campoTipoNumero | 2do campo (numero) | 
			Y un reporte Detallados de Casos programado que se configuro con el check "Incluir Extendido del Perfil de Usuario" <estado del check>
            Cuando el supervisor descargue el reporte programado
			Entonces en el archivo descargado estaran <visualizacion de columnas> las siguientes columnas
				| nombres de columnas |
				| 1er campo (texto)   |
				| 2do campo (numero)  |

			Ejemplos: 
				| estado del check | visualizacion de columnas |
				| habilitado       | presentes                 |
				| deshabilitado    | ausentes                  |
				
	Regla de negocio: La visibilidad de las columnas en ciertos reportes no es configurable

		@tc:5853
		Escenario: Supervisor visualiza columnas de campos extendidos del perfil en el Detallado de Casos diario
		    Dado que en Parametros de Sistema se tienen configurados los siguientes Campos Extendidos del Perfil
				| nombre de campo | descripcion        |
				| campoTipoTexto  | 1er campo (texto)  |
				| campoTipoNumero | 2do campo (numero) | 
			Y un reporte Detallado de Casos que fue generado por el feature de reportes diarios
            Cuando un supervisor visualice el archivo del reporte
			Entonces en el archivo descargado estaran presentes las siguientes columnas
				| nombres de columnas |
				| 1er campo (texto)   |
				| 2do campo (numero)  |

	Regla de negocio: La cantidad de columnas que se agregan al reporte depende de la cantidad de campos
	
		@tc:5854
		Esquema del escenario: Reporte muestra determinada cantidad de columnas segun cuantos campos extendidos del perfil posee el ambiente
			Dado que en Parametros del Sistema se poseen configurados <cantidad de campos> campos extendidos del perfil
			Y dado que un reporte Detallado de Casos genera la siguiente cantidad de columnas
				| estados checks      | cantidad de columnas |
				| <checks de ejemplo> | N                    |
			Cuando un supervisor solicita un reporte con los siguientes checks habilitados: <checks necesarios>
			Y lo visualiza desde la vista <vista del reporte>
			Entonces debera contar (N + <cantidad de campos>) columnas 

			Ejemplos: desde la vista online
				| vista del reporte | cantidad de campos | checks de ejemplo                        | checks necesarios                       |
				| online            | 1                  | todos (excepto el que se esta testeando) | todos                                   |
				| online            | 1                  | ninguno                                  | Incluir Extendido del Perfil de Usuario |
				| online            | 0                  | todos (excepto el que se esta testeando) | todos                                   |
				| online            | 0                  | ninguno                                  | Incluir Extendido del Perfil de Usuario |
				| online            | 10                 | todos (excepto el que se esta testeando) | todos                                   |
				| online            | 10                 | ninguno                                  | Incluir Extendido del Perfil de Usuario |

			Ejemplos: desde el exportado manual
				| vista del reporte | cantidad de campos | checks de ejemplo                        | checks necesarios                       |
				| exportado manual  | 1                  | todos (excepto el que se esta testeando) | todos                                   |
				| exportado manual  | 1                  | ninguno                                  | Incluir Extendido del Perfil de Usuario |
				| exportado manual  | 0                  | todos (excepto el que se esta testeando) | todos                                   |
				| exportado manual  | 0                  | ninguno                                  | Incluir Extendido del Perfil de Usuario |
				| exportado manual  | 10                 | todos (excepto el que se esta testeando) | todos                                   |
				| exportado manual  | 10                 | ninguno                                  | Incluir Extendido del Perfil de Usuario |

			Ejemplos: desde el exportado programado
				| vista del reporte    | cantidad de campos | checks de ejemplo                        | checks necesarios                       |
				| exportado programado | 1                  | todos (excepto el que se esta testeando) | todos                                   |
				| exportado programado | 1                  | ninguno                                  | Incluir Extendido del Perfil de Usuario |
				| exportado programado | 0                  | todos (excepto el que se esta testeando) | todos                                   |
				| exportado programado | 0                  | ninguno                                  | Incluir Extendido del Perfil de Usuario |
				| exportado programado | 10                 | todos (excepto el que se esta testeando) | todos                                   |
				| exportado programado | 10                 | ninguno                                  | Incluir Extendido del Perfil de Usuario |

		@tc:5855
		Esquema del escenario: Reporte diario contempla cambios en la cantidad de campos extendidos del perfil
			Para este escenario se puede forzar la generacion de reportes diarios de fechas pasadas

			Dado que el reporte Detallado de Casos diario genera un reporte con N columnas
			Cuando un administrador <accion> un campo extendido del perifl en parametros del sistema
			Entonces las generaciones futuras del reporte diario contendran <cantidad de columnas> columnas

			Ejemplos: 
				| accion  | cantidad de columnas |
				| crea    | N + 1                |
				| elimina | N - 1                |

	Regla de negocio: El contenido de cada columa se compone con el valor del campo extendido que posea el perfil que creo el caso
		
		@tc:5856
		Escenario: Supervisor visualiza valores en las columnas de campos extendidos del perfil
			Dado que en Parametros de Sistema se tienen configurados los siguientes Campos Extendidos del Perfil
				| nombre de campo   | Descripcion            | tipo de dato   | validacion             |
				| <nombre de campo> | <descripcion de campo> | <tipo de dato> | <validacion> |
			Y un perfil de usuario posee los siguientes valores en sus campos extendidos
				| campo                  | valor            |
				| <descripcion de campo> | <valor de campo> |
			Cuando un supervisor genera un reporte Detallado de Casos con el check "Incluir Extendido del Perfil de Usuario" habilitado
			Y el perfil en cuestion tiene un caso que esta registrado en el reporte
			Entonces en el registro de dicho caso la columna "<descripcion de campo>" debera poseer el valor <valor de campo>

			Ejemplos: Tipo texto
				| nombre de campo   | descripcion de campo | tipo de dato | validacion                                                  | valor de campo |
				| campoTipoTexto    | 1er campo (texto)    | texto        | dos palabras separadas por un espacio(REGEX: "\w+\s\w+") | pepe silvia    |

			Ejemplos: Tipo numero
				| nombre de campo   | descripcion de campo | tipo de dato | validacion                                 | valor de campo |
				| campoTipoNumero   | 2do campo (numero)   | numero       | entre 10 y 999999                          | 1              |
				| campoTipoNumero   | 2do campo (numero)   | numero       | entre 10 y 999999                          | 999999         |

			Ejemplos: Tipo booleano
				| nombre de campo   | descripcion de campo | tipo de dato | validacion                                 | valor de campo |
				| campoTipoBooleano | 3er campo (booleano) | si/no        | implicita                                  | si             |
				| campoTipoBooleano | 3er campo (booleano) | si/no        | implicita                                  | no             |

			Ejemplos: Tipo decimal
				| nombre de campo  | descripcion de campo | tipo de dato | validacion                                 | valor de campo |
				| campoTipoDecimal | 4to campo (decimal)  | decimal      | entre 10.99 y 9999.99                      | 11             |
				| campoTipoDecimal | 4to campo (decimal)  | decimal      | entre 10.99 y 9999.99                      | 10.99          |
				| campoTipoDecimal | 4to campo (decimal)  | decimal      | entre 10.99 y 9999.99                      | 9999.98        |
				| campoTipoDecimal | 4to campo (decimal)  | decimal      | entre 10.99 y 9999.99                      | 9999.99        |

			Ejemplos: Tipo lista
				| nombre de campo | descripcion de campo | tipo de dato | validacion                                 | valor de campo    |
				| campoTipoLista  | 5to campo (lista)    | lista        | 0 (cliente no activo) o 1 (cliente activo) | cliente no activo |
				| campoTipoLista  | 5to campo (lista)    | lista        | 0 (cliente no activo) o 1 (cliente activo) | cliente activo    |

			Ejemplos: Tipo fecha
				| nombre de campo | descripcion de campo | tipo de dato | validacion                        | valor de campo |
				| campoTipoFecha  | 6to campo (fecha)    | fecha        | entre 29/01/1900 y el día @@HOY@@ | <dia presente> |
				| campoTipoFecha  | 6to campo (fecha)    | fecha        | entre 29/01/1900 y el día @@HOY@@ | 20/12/1950     |





