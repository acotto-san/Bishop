#language: es
@us:6536
Característica: Tener la posiblidad de exportar la informacion de las colas
	Como administrador
	Quiero exportar las colas configuradas
	Para tener la informacion en un excel

	Regla de negocio: Al exportar debe verse la misma informacion que se ve en pantalla
		Anotacion: las columnas " agentes conectados " y " mensajes en cola " no se exportan.
		
		@tc6588
		Escenario: Supervisor exporta la definicion de las colas
			Dado que un supervisor se encuentra en la pantalla de colas
			Cuando exporte la definicion de las colas
			Entonces debera ver en el archivo exportado la misma informacion que ve en pantalla

	Regla de negocio: La exportacion puede ser en excel o en csv
		
		@tc:6859
		Esquema del escenario: Supervisor exporta el archivo indicando el formato que desea
			Dado que un supervisor quiere exportar el archivo en formato <formato1>
			Cuando seleccione el formato de <formato1>
			Entonces al exportar debera salir en el formato seleccionado
			
		Ejemplos: 
		| formato1 |
		| csv      |
		| excel    |

	Regla de negocio: Cuando el ySocial se encuentra en otro idioma cambian algunos elementos

   		@tc:6590
   		Esquema del escenario: El nombre del archivo cambia segun el idioma de ySocial
       		Dado que ySocial posee configurado el idioma <idioma> en Parametros de Sistema
       		Cuando un supervisor exporta la lista de colas
       		Entonces el nombre del archivo estara en <idioma>

       		Ejemplos: 
           		|idioma|
           		|ingles|
           		|portugues|
           		|español|

   		@tc:6591
   		Esquema del escenario: El contenido del archivo cambia segun el idioma de ySocial
       		//celdas con texto prefijado: si/no/etc.
       		Dado que ySocial posee configurado el idioma <idioma> en Parametros de Sistema
       		Cuando un supervisor exporta la lista de colas
       		Entonces el nombre de las columnas estara en <idioma>
       		Y las celdas que contengan textos prefijados estaran en <idioma>
        
       		Ejemplos: 
           		|idioma|
           		|ingles|
           		|portugues|
           		|español|

	Regla de negocio: La lista de colas que provee la exportacion puede estar filtrada

   		@tc:6592
   		Escenario: No se visualizan colas eliminadas al exportar la lista
       		Dado una cola es eliminada de ySocial
       		Cuando un supervisor exporta la lista de colas
       		Entonces en el archivo exportado no vera la cola eliminada


   		@tc:6593 
   		Esquema del escenario: Se visualizan tanto colas habilitadas como deshabilitadas al exportar la lista
       		Dado una cola que se encuentra en estado <estado> en ySocial
       		Cuando un supervisor exporta la lista de colas
       		Entonces en el archivo exportado vera la cola 

       		Ejemplos:
           		|estado|
           		|habilitada|
           		|deshabilitada|