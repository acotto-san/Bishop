#language: es
Característica: administracion de reportes programados

Como supervisor quiero administrar los reportes programados para poder crearlos, editarlos, eliminarlos o pausarlos 

	Regla de negocio: un supervisor en la lista de reportes programados solo ve los que fueron creados por el
	
		@tc:5697
		Escenario: Un supervisor puede ver exclusivamente sus reportes programados en la lista
			Dado un reporte programado por la supervisora Sandra
			Cuando el supervisor Silvio ingresa a la pagina de reportes programados 
			Entonces no debería ver los reportes programados por Sandra

	Regla de negocio: se pueden pausar la generacion automatica de los reportes

		@tc:5625
		Esquema del escenario: Un super visor puede deshabilitar la generación de un reporte
			Dado un reporte programado con periodicidad diaria
			Y un supervisor que se encuentra en la pagina de Reportes Programados
			Cuando el supervisor <accion> ese reporte programado
			Entonces <resultado esperado> la generacion el reporte del día siguiente

			Ejemplos:
				| accion      | resultado esperado |
				| habilita    | reanuda            |
				| deshabilita | pausa              |

	Regla de negocio: los reportes programados se pueden eliminar

		@tc:5626
		Escenario: Supervisor elimina un reporte programado
			Dado un reporte programado
			Y un supervisor que se encuentra en la pagina de Reportes Programados
			Cuando el supervisor elimina ese reporte programado
			Entonces debera desaparecer de la lista de reportes programados
			Y no se debera volver a publicar el reporte en Reportes Generados

	Regla de negocio: se pueden modificar unicamente los filtros de un reporte ya programado

		@tc:5627
		Esquema del escenario: Un supervisor puede editar los filtros de un reporte programado
			Dado un reporte programado de tipo <tipo reporte>
			Y esta configurado con el filtro "<filtro>" con valor "<atributo anterior>"
			Cuando un supervisor edita el filtro <filtro> configurandolo con el valor "<atributo modificado>"
			Entonces el reporte debera contener <contenido filtrado>

			Ejemplos:
				| tipo reporte         | filtro | atributo anterior | atributo modificado | contenido filtrado                   |
				| Consolidado de colas | Colas  | Todas las colas   | AAA                 | solamente movimientos de la cola AAA |
				| Detallado de casos   | Estado | Todos             | Abierto             | solo casos abiertos                  |

		@tc:5628
		Esquema del escenario: Un supervisor no puede editar el tipo de reporte ni la periodicidad de un reporte programado
			Cuando un supervisor ingresa a la edicion del reporte programado
			Entonces no le sera posible modificar <seccion> del reporte

			Ejemplos:
				| seccion         |
				| el tipo         | 
				| la periodicidad |

	Regla de negocio: se puede crear un reporte programado 

		@tc:5629
		Esquema del escenario: Un supervisor puede crear diferentes tipos de reportes programados con periodicidad limitada
			Dado un supervisor que se encuentra en la pagina de Reportes Programados
			Cuando crea un reporte programado de "<tipo> <detalle>" con periodicidad "<periodicidad>" 
			Entonces el reporte sera agregado a la pagina de reportes programados
			Y la proxima publicacion del reporte en la pagina de Reportes Generados se realizara <proxima publicacion>

			Ejemplos:
				| tipo           | detalle     | periodicidad | proxima publicacion           |
				| Detallado      | de mensajes | Diaria       | el dia siguiente              |
				| Detallado      | de colas    | Semanal      | el lunes proximo              |
				| Detallado      | de casos    | Mensual      | el primer dia del proximo mes |
				| Consolidados   | de agentes  | Diaria       | el dia siguiente              |
				| Consolidados   | de casos    | Semanal      | el lunes proximo              |
				| Consolidado    | de colas    | Mensual      | el primer dia del proximo mes |
				| Administrativo | de eventos  | Diaria       | el dia siguiente              |
				| Administrativo | de login    | Semanal      | el lunes proximo              |

		@tc:5630
		Escenario: supervisor no logra crear dos reportes identicos
			Dado un reporte programado de tipo Detallado de Casos con periodicidad diaria
			Y el reporte posee los filtros por default
			Cuando un supervisor intenta crear un nuevo reporte programado de tipo Detallado de Casos con periodicidad diaria
			Y los filtros los deja configurados por default
			Entonces se debera impedir la creacion del reporte programado 

		@tc:5631
		Escenario: Un supervisor puede configurar los filtros de un reporte programado
			Dado que un supervisor crea un reporte en la sección de reportes programados
			Cuando personaliza y configura los filtros
			Entonces la generacion posterior de dicho reporte tendra esos filtros
		
		@tc:5698
		Esquema del escenario: supervisor configura tipo de formato del archivo
			Dado un supervisor que se encuentra en la pagina de Reportes Programados
			Cuando crea un reporte programado con formato <formato de archivo>
			Entonces el reporte sera agregado a la pagina de reportes programados
			Y en la columna de formato indicara <formato de archivo>

			Ejemplos: 
				| formato de archivo |
				| excel              |
				| csv                |