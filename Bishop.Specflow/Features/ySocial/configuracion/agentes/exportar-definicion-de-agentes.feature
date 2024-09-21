#language: es
Característica: Tener la posiblidad de exportar la informacion de los agentes
	Como administrador
	Quiero exportar los agentes configurados
	Para tener la informacion en un excel

	Regla de negocio: Al exportar debe verse la misma informacion que se ve en pantalla
		Anotacion: Las columnas de redes sociales en el archivo exportado deben verse de manera detallada
		
		@tc:7029
		Escenario: Supervisor exporta la lista de los agentes
			Dado que un supervisor se encuentra en la pantalla de agentes
			Cuando exporte la lista de los agentes
			Entonces debera ver en el archivo exportado la misma informacion que ve en pantalla

	Regla de negocio: La exportacion puede ser en excel o en csv
		
		@tc:7030
		Esquema del escenario: Exportacion de lista de agentes en diferentes formatos
			Dado un supervisor que se encuentra exportando la lista de agentes
			Cuando seleccione el formato de <formato>
			Y concrete la exportacion
			Entonces se generara un archivo en dicho formato
			
			Ejemplos: 
				| formato |
				| csv     |
				| excel   |

	Regla de negocio: Cuando el ySocial se encuentra en otro idioma cambian algunos elementos

   		@tc:7031
   		Esquema del escenario: El nombre del archivo cambia segun el idioma de ySocial
       		Dado que ySocial posee configurado el idioma <idioma> en Parametros de Sistema
       		Cuando un supervisor exporta la lista de agentes
       		Entonces el nombre del archivo estara en <idioma>

       		Ejemplos: 
           		| idioma    |
           		| ingles    |
           		| portugues |
           		| español   |

   		@tc:7032
   		Esquema del escenario: El contenido del archivo cambia segun el idioma de ySocial
       		//celdas con texto prefijado: si/no/etc.
       		Dado que ySocial posee configurado el idioma <idioma> en Parametros de Sistema
       		Cuando un supervisor exporta la lista de agentes
       		Entonces el nombre de las columnas estara en <idioma>
       		Y las celdas que contengan textos prefijados estaran en <idioma>
        
       		Ejemplos: 
           		| idioma    |
           		| ingles    |
           		| portugues |
           		| español   |