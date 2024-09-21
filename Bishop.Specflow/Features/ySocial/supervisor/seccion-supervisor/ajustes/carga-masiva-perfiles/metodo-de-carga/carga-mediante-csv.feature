#language: es
Característica: Se permite al supervisor utilizar un csv para realizar la carga masiva

	Regla de negocio: el archivo debe ser csv

	    @tc:5966
		Esquema del escenario: intenta cargar un adjunto de formato distinto a un csv
			Dado que un supervisor se encuentra en el formulario de carga masiva de perfiles
			Cuando adjunta un archivo de tipo <tipo de adjunto>
			E intenta confirmar el formulario
			Entonces deberia aparecer un error

			Ejemplos:
				| tipo de adjunto |
				| excel           |
				| doc             |
				| pdf             |

	Regla de negocio: los separadores dentro del csv son configurables en el formulario de carga
		
		@tc:6045
		Esquema del escenario: Se consideran validos los registros del csv segun su separador
			Dado que se tiene un csv valido de carga masiva de perfiles
			Y sus campos se encuentran separados por <separador>
			Cuando el supervisor configura en el formulario de carga masiva que el archivo va a ser separado por <separador>
			E intenta confirmar la carga masiva con el csv provisto
			Entonces la solicitud debera ser aceptada

			Ejemplos: 
				| separador                                            |
				| ,                                                    |
				| ;                                                    |
				| pipeline (no puedo escribir el caracter en la tabla) | 