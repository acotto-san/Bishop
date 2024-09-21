#language: es 
@us:4915
Característica: Pieza para acortar las url
	Se desea poder tomar una url cualquiera y acortarla (como bit.ly)


	Regla de negocio: toda url que se le provea a la pieza sera transformada en una nueva url mas corta

		@tc:5465 @flowjson
		Escenario: acorta una url escrita literalmente en su campo de ingreso
			Dado que una pieza en un bot posee como ingreso escrito literalmente la url "https://www.pagina12.com.ar"
			Cuando un usuario hablando con el bot ejecuta la pieza 
			Y el bot imprime una pieza mensaje con la variable donde se guardo la url acortada
			Entonces el usuario debe recibir un enlace que comienza con "https://yoiz.me/"
			Y el enlace debe redirigir a la url "https://www.pagina12.com.ar"
		
		@tc:5466 @flowjson
		Esquema del escenario: acorta una url alojada en una variable
			Dado que en un bot la variable de usuario "urlBase" contiene como valor el texto "https://www.pagina12.com.ar"
			Y una pieza "acortar url" posee en su ingreso configurado el texto "<@urlEnPieza>"
			Cuando un usuario hablando con el bot ejecuta la pieza 
			Y el bot imprime una pieza mensaje con la variable donde se guardo la url acortada
			Entonces el usuario debe recibir un enlace que comienza con "https://yoiz.me/"
			Y el enlace debe redirigir a la url "https://www.pagina12.com.ar"

			Ejemplos: 
				| @urlEnPieza |
				| {{urlBase}} |
				| ${urlBase}$ |
		
		@tc:5467
		Esquema del escenario: acorta una url compuesta 
			Dado que en un bot existen las siguientes variables de usuario:
				| nombre variable | valor                       |
				| urlBase         | https://www.pagina12.com.ar |
				| urlExtension    | /secciones/el-mundo         |
			Y una pieza "acortar url" posee en su ingreso configurado el texto "<@base><@extension>"
			Cuando un usuario hablando con el bot ejecuta la pieza 
			Y el bot imprime una pieza mensaje con la variable donde se guardo la url acortada
			Entonces el usuario debe recibir un enlace que comienza con "https://yoiz.me/"
			Y el enlace debe redirigir a la url "https://www.pagina12.com.ar/secciones/el-mundo"

			Ejemplos: con doble llave
				| @base                       | @extension       |
				| https://www.pagina12.com.ar | {{urlExtension}} |
				| {{urlBase}}                 | {{urlExtension}} |

			Ejemplos: con ${}$
				| @base                       | @extension       |
				| https://www.pagina12.com.ar | ${urlExtension}$ |
				| ${urlBase}$                 | ${urlExtension}$ |


	Regla de negocio: la url ya acortada se guarda en una variable de usuario tipo texto
		
		@tc:5468
		Escenario: supervisor solo visualiza variables de tipo texto donde se guardara la url acortada
			Dado que un supervisor se encuentra configurando la pieza "acortar url"
			Y en el bot existen las siguientes variables de usuario:
				| nombre variable | tipo     |
				| variable1       | texto    |
				| variable2       | numerico |
				| variable3       | booleano |
				| variable4       | fecha    |
				| variable5       | objeto   |
				| variable6       | base64   |
				| variable7       | texto    |
			Cuando hace click en el campo "Guardar en"
			Entonces en las sugerencias de variables vera "variable1" y "variable7"

	Regla de negocio: la ejecucion de la pieza puede depender de una condicion
		
		@tc:5469
		Esquema del escenario: pieza se ejecuta segun condicion
			Dado que en un bot la pieza "acortar url" contiene una evaluacion 
			Cuando un usuario hablando con el bot ejecuta la pieza 
			Y el resultado de la evaluacion es <@resultadoCondicion>
			Entonces el acortador <@accionPieza> el acortado y guardado de la url en la variable de salida

			Ejemplos: 
				| @resultadoCondicion | @accionPieza |
				| true                | realiza      |
				| false               | no realiza   |