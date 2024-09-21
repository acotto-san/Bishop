#language: es
Característica:Reporte detallado de la kb
	Como usuario de ysmart 
	quiero ver las estadísticas detalladas de las bases de conocimiento
	para poder obtenerlas por un rango de tiempo


	Regla: En esta tabla aparece una columna con la pregunta del usuario, la pregunta reformulada por la kb, la respuesta de ysmart y el archivo de la fuente de conocimiento invocado

		@tc:7596
		Escenario: aparece el mensaje del usuario en la columna del detallado
		Exploratorio: probar con longitud de texto y caracteres no convencionales
			Dado que yflow mando a procesar la frase del usuario "que es el plan procrear?"
			Cuando el supervisor verifica el detallado de las estadisticas de base de conocimiento
			Entonces la columna de mensaje del usuario debe tener "que es el plan procrear?"

		@tc:7597
		Escenario: aparece la reformulación de la kb en la columna del detallado
			Dado que yflow manda a procesar la frase del usuario "que es el plan procrear"
			Cuando se reformula la pregunta por: "¿Qué es el plan procrear?"
			Entonces la columna de pregunta reformulada debe tener: "¿Qué es el plan procrear?"

		@tc:7598
		Escenario: aparece la respuesta de ysmart en la columna del detallado
			Dado que yflow manda a procesar la frase del usuario "que es el plan procrear"
			Cuando ysmart responde con informacion de procrear
			Entonces la columna respuesta de ysmart debe aparecer el mismo mensaje que le llega al usuario

		@tc:7599
		Escenario: ysmart no sabe la respuesta luego de consultar a la base
			Dado que yFlow manda a procesar una frase del usuario
			Cuando se obtienen chunks de la base de conocimiento consultada
			Y a ysmart no le alcanza para armar la respuesta indicada
			Entonces la columna respuesta de ysmart debera tener el mensaje que le llega al usuario

		@tc:7600
		Escenario: respuesta null de ysmart por un fallo de redis
			Dado que yFlow manda a procesar una frase del usuario
			Cuando consulta por la base de conocimiento
			Y no encuentra el archivo (no existe el index)
			Entonces este registro no debera aparecer en la columna de respuesta de ysmart
		
		@tc:7601
		Escenario: aparece la fuente de conocimiento invocada en la columna del detallado
			Dado una base de conocimiento cargada con el nombre de Procrear
			Y el archivo "Informacion de procrear" subida a esa categoria
			Cuando yflow procesa una frase que invoca a ese archivo
			Entonces en la columna de la kb de ese ese mensaje aparecera "Informacion de procrear" - Procrear

		@tc:7602
		Esquema del escenario: base de conocimiento que tiene más de un archivo asociado
			Dado una base de conocimiento cargada con 3 archivos
			Cuando yFlow procesa una frase que invoca <nro de archivo>
			Entonces en la columna de la kb de ese mensaje aparecera el nombre de los archivos correspondientes y la categoria

			Ejemplos: 
			| nro de archivo |
			| uno            |
			| dos            |
			| tres           |

		@tc:7603
		Escenario: aparece la base de conocimiento consultada en la columna del detallado cuando no formula una respuesta indicada
			Dado que yFlow manda a procesar frase del usuario: "cual es el articulo 11 del reglamento de previaje?"
			Cuando se obtienen chunks de la base de conocimiento "Previaje"
			Y a ysmart no le alcanza para armar la respuesta indicada
			Entonces la columna respuesta de ysmart debera tener el mensaje que le llega al usuario

		@tc:7604
		Escenario: se elimina la kb invocada
		#este comportamiento no está asegurado, los registros no se van a eliminar pero no se confirmó que va a estar la aclaración
			Dado que se elimina la base de conocimiento "Procrear" el dia martes
			Y yFlow deja de procesar esa kb
			Cuando se filtran las estadisticas por la semana anterior al martes
			Entonces no se reflejan cambios en la columna de base de conocimiento
			Y los registros de la kb eliminada aparecen con una aclaracion

	Regla: En esta tabla aparece una columna con la cantidad de tokens del prompt y de la respuesta de la kb

		@tc:7605
		Escenario: aparece la cantidad de tokens consumidos para reformular la respuesta en la columna del detallado
			Dado que yflow mando a procesar una frase del usuario
			Cuando se reformula la frase se consumen 147 tokens
			Entonces en la columna de tokens consumidos por reformular la frase aparecera 147

		@tc:7606
		Escenario: aparece la cantidad de tokens consumidos del prompt en la columna del detallado
			Dado que yflow manda a procesar una frase del usuario
			Cuando se genera la respuesta el prompt consume 104 tokens
			Entonces en la columna de tokens consumidos por el prompt aparecera 104


	Regla: En esta tabla aparece una columna con el id de la categoría, el id del caso y el id del mensaje
	
		@tc:7607
		Escenario: aparece el id de la categoría invocada en la columna del detallado
			Dado que yflow procesa una frase del usuario
			Cuando se invoca a la base de conocimiento con id 72 para generar la respuesta
			Entonces en la columna de id de categoria aparecera 72

		@tc:7608
		Escenario: aparece el id de caso procesado por ysmart en la columna del detallado
			Dado que el caso 47889 pasa una pieza de base de conocimiento
			Cuando yflow manda a procesar una frase de ese caso
			Entonces en la columna de id de caso aparecera 47889

		@tc:7609
		Escenario: aparece id de caso de chat procesado por ysmart en la columna del detallado
			Dado que un caso de chat pasa una pieza de base de conocimiento
			Cuando yflow manda a procesar una frase de ese caso
			Entonces en la columna de id de caso aparecera un numero que lo identifica 
			Y no sera el mismo que en ysocial

		@tc:7610
		Escenario: no aparece caso que no es procesado por una base de conocimiento
		Exploratorio: corroborar que frases analizadas por ySmart que dan confianza alta en una intención que NO tiene asociada una base de conocimiento, no quedara presente en el reporte
			Dado que el caso 47890 no pasa por ninguna pieza conectada a base de conocimiento
			Cuando se verifica el reporte
			Entonces no se visualiza el id 47890 en la columna de caso

		@tc:7611 
		Escenario: aparece caso que es procesado por la sección de pruebas de ysmart
			Dado que el supervisor manda a procesar una frase en la seccion de pruebas
			Cuando se busca ese caso en las estadisticas de la kb
			Entonces ese caso aparecera en el reporte detallado de la kb
			#Esto está en duda, si llega a aparecer el consumo es una mejora extra, ya que hay un consumo en estas pruebas

		@tc:7612
		Escenario: aparece el id del mensaje en la columna del detallado
			Dado que un usuario envia el mensaje 34567
			Cuando ese mensaje es procesado por ysmart
			Entonces en la columna de id de mensaje aparecera 34567