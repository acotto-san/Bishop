#language: es
Característica: poder exportar tiempo real de agentes

	Como Administrador del sistema
	Quiero Poder exportar el reporte de tiempo real de agentes
	Para Gestionarlo de forma ágil mediante un xls

	Exploratorio: reporte con cientos de agentes conectados, revisar paginado.

Regla: El archivo resultante de la exportación debe respetar los criterios de filtrado que haya aplicado el usuario

	@tc:9938
	Escenario: se exporta un reporte que tiene un filtro por agente aplicado
		Dado que un supervisor aplica el filtro por agente en el reporte de tiempo real de agentes
		Y selecciona <seleccion>
		Cuando exporta el reporte de lo visible
		Entonces el archivo debe coincidir con el listado filtrado en la web

		Ejemplos:
		| seleccion                           |
		| 5 agentes conectados                |
		| 1 agente conectado y 1 desconectado |
		| ningun agente conectado             |
		| todos                               |

	@tc:9939
	Escenario: se exporta un reporte que tiene un filtro por cola aplicado
		Dado que un supervisor aplica el filtro por cola en el reporte de tiempo real de agentes
		Y selecciona <seleccion>
		Cuando exporta el reporte de lo visible
		Entonces el archivo debe coincidir con el listado filtrado en la web
		
		Ejemplos:
		| seleccion                                     |
		| 5 colas con agentes conectados                |
		| 1 cola con agentes conectados y 1 sin agentes |
		| 1 cola sin agentes conectados                 |
		| todas las colas                               |

	@tc:9940
	Escenario: se exporta un reporte que tiene un filtro por sitio aplicado
		Dado que un supervisor aplica el filtro por sitio en el reporte de tiempo real de agentes
		Y selecciona <seleccion>
		Cuando exporta el reporte de lo visible
		Entonces el archivo debe coincidir con el listado filtrado en la web
		
		Ejemplos:
		| seleccion                                      |
		| 1 sitio con agentes conectados                 |
		| 1 sitio con agentes conectados y 1 sin agentes |
		| 1 sitio sin agentes conectados                 |
		| todas los sitios                               |

	@tc:9941
	Escenario: se exporta un reporte que tiene el check de mensajes	de las colas aplicado en el filtro
		Dado que un supervisor <activo> el check por mensajes de las colas en el reporte de tiempo real de agentes
		Cuando exporta el reporte de lo visible
		Entonces el archivo debe coincidir con el listado filtrado en la web
		
		Ejemplos:
		| activo      |
		| habilita    |
		| deshabilita |

	@tc:9942
	Escenario: se exporta un reporte que tiene un filtro por estado aplicado
		Dado que un supervisor aplica el filtro por estado en el reporte de tiempo real de agentes
		Y selecciona <seleccion>
		Cuando exporta el reporte de lo visible
		Entonces el archivo debe coincidir con el listado filtrado en la web
		
		Ejemplos:
		| seleccion             |
		| Auxiliar              |
		| Auxiliar y trabajando |
		| Disponible            |
		| todas los estados     |

	@tc:9943
	Escenario: se exporta un reporte que tiene un filtro por código de mensaje
		Dado que un	supervisor aplica el filtro por codigo de mensaje en el reporte de tiempo real de agentes
		Y busca por <seleccion>
		Cuando exporta el reporte de lo visible
		Entonces el archivo debe coincidir con el listado filtrado en la web
		
		Ejemplos:
		| seleccion                                 |
		| un mensaje asignado a un agente conectado |
		| un mensaje de un caso cerrado             |

	@tc:9944
	Escenario: se exporta un reporte que tiene un filtro por código de caso
		Dado que un	supervisor aplica el filtro por codigo de caso en el reporte de tiempo real de agentes
		Y busca por <seleccion>
		Cuando exporta el reporte de lo visible
		Entonces el archivo debe coincidir con el listado filtrado en la web
		
		Ejemplos:
		| seleccion                              |
		| un caso asignado a un agente conectado |
		| un caso cerrado                        |
	
	@tc:9945
	Escenario: se exporta un reporte que tiene el check de "Mostrar solo agentes con mensajes no leídos" aplicado
		Dado que un supervisor <activo> el check "Mostrar solo agentes con mensajes no leídos" en el reporte de tiempo real de agentes
		Cuando exporta el reporte de lo visible
		Entonces el archivo debe coincidir con el listado filtrado en la web
		
		Ejemplos:
		| activo      |
		| habilita    |
		| deshabilita |

	@tc:9946
	Escenario: se exporta un reporte que tiene un filtro de "Ordenar" aplicado
		Dado que un supervisor aplica el filtro de orden por <seleccion> en el reporte de tiempo real de agentes
		Y <activo> el check de ascendente
		Cuando exporta el reporte de lo visible
		Entonces el archivo debe coincidir con el listado filtrado en la web
		
		Ejemplos:
		| seleccion           | activo      |
		| agente              | habilita    |
		| sitio               | deshabilita |
		| estado              | habilita    |
		| tiempo en el estado | deshabilita |
		| tiempo sin leer     | habilita    |


Regla: El archivo resultante devuelve los datos que se traigan del servidor tras ejecutar la accion (la web refresca cada 10 seg?)

	@tc:9947
	Escenario: se descarga un registro que no se refleja todavía en el reporte real de agentes
		Dado que hay 3 agentes en disponible
		Cuando estos cambiaron a auxiliar 
		Y el reporte de tiempo real de agentes todavia no se refresco
		Entonces en el excel apareceran en auxiliar

	@tc:9948
	Escenario: el excel no devuelve el reporte pausado
		Dado que en el reporte real de agentes se ve tres agentes disponibles
		Y un supervisor le pone pausa al reporte
		Cuando pasa un minuto un agente se desconecta
		Y el supervisor imprime el excel del reporte pausado
		Entonces en el excel descargado se veran dos agentes disponibles

	@tc:10130 
	Escenario: se descarga un listado vacío
		Dado que en el reporte real de agentes se ve tres agentes disponibles
		Y un supervisor le pone pausa al reporte
		Cuando pasa unos segundos los tres agentes se desconecta
		Y el supervisor imprime el excel del reporte pausado
		Entonces en el excel descargado el listado sera vacio

Regla: Si el reporte estaba pausado, luego de exportarse se reanuda la actualización en tiempo real

	@tc:10129
	Escenario: Se reanuda la actualización de tiempo real después de exportar el reporte
		Dado que el reporte real de agentes se encuentra pausado
		Cuando un supervisor exporta el reporte
		Entonces se reanuda la actualizacion de tiempo real
		Y vuelve a aparecer el icono para pausar

Regla: Se puede descargar como csv o como excel

	@tc:9949
	Esquema del escenario: se puede descargar el archivo como csv o excel
		Dado que el supervisor exporta el reporte de tiempo real de agentes
		Cuando elige en formato <formato>
		Entonces se descarga en formato <formato> correctamente.

		Ejemplos: 
		| formato |
		| csv     |
		| excel   |