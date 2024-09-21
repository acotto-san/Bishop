#language: es
Característica: Campos basicos podran ser considerados invalidos en la carga
	Dado que al editar perfiles desde la web hay validaciones que me impiden cargar campos con datos invalidos, 
	se desea que en la carga masiva se respete esa validación y asi no tener perfiles con datos incorrectos en sus campos.

	@tc:5950
	Esquema del escenario: campo de nombre incumple validacion   
		#vacio no se va a considerar invalido, pendiente editar
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee el campo de nombre vacio:
			"""
				2,<id>,,rgroisman@yoizen.com,5491158638852,1,1,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces la carga se vera interrumpida por un aviso indicando que el csv posee un error


		Ejemplos:      
			| tipoServicio | id                   |
			| WA           | 5491158638852        |
			| email        | rgroisman@yoizen.com |

	@tc:5951
	Esquema del escenario: campo de mail incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee el siguiente registro con el campo "email" invalido:
			"""
				2,<id>,romina groisman,<email>,5491158638852,1,1,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces luego de finalizado el procesamiento de la carga el perfil no habra sido modificado

		Ejemplos:       
			| tipoServicio | id                   | email                |
			| WA           | 5491158638852        | rgroisman.com        |
			| email        | rgroisman@yoizen.com | rgroisman@yoizen,com |

	@tc:5952
	Esquema del escenario: campo de telefono incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee el siguiente registro con el campo "telefono" invalido:
			"""
				<id>,romina groisman,rgroisman@yoizen.com,<telefono>,1,1,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces luego de finalizado el procesamiento de la carga el perfil no habra sido modificado

		Ejemplos:        
			| tipoServicio | id                   | telefono             |
			| WA           | 5491158638852        | 58632                |
			| email        | rgroisman@yoizen.com | 54911111111558638852 |
			| WA           | 5491158638852        | telefono             |

	@tc:5953
	Esquema del escenario: campo de vip incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee el siguiente registro con el campo "vip" invalido:
			"""
				2,<id>,romina groisman,rgroisman@yoizen.com,5491158638852,<vip>,1,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces luego de finalizado el procesamiento de la carga el perfil no habra sido modificado

		Ejemplos:        
			| tipoServicio | id                   | vip   |
			| WA           | 5491158638852        | true  |
			| email        | rgroisman@yoizen.com | false |

	@tc:5954
	Esquema del escenario: campo de bloqueado incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee el siguiente registro con el campo "bloqueados" invalido:
			"""
				2,<id>,romina groisman,rgroisman@yoizen.com,5491158638852,1,<bloqueado>,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces luego de finalizado el procesamiento de la carga el perfil no habra sido modificado

		Ejemplos:        
			| tipoServicio | id                   | bloqueado |
			| WA           | 5491158638852        | true      |
			| email        | rgroisman@yoizen.com | false     |

	@tc:5955
	Esquema del escenario: campo de lista no contactar incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee el siguiente registro con el campo "no contactar" invalido:
			"""
				2,<id>,romina groisman,rgroisman@yoizen.com,5491158638852,1,1,<no contactar>,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces luego de finalizado el procesamiento de la carga el perfil no habra sido modificado

		Ejemplos:        
			| tipoServicio | id                   | no contactar |
			| WA           | 5491158638852        | true         |
			| email        | rgroisman@yoizen.com | false        |

	@tc:5956
	Esquema del escenario: campo de lista testers incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee el siguiente registro con el campo "tester" invalido:
			"""
				2,<id>,romina groisman,rgroisman@yoizen.com,5491158638852,1,1,1,<tester>
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces luego de finalizado el procesamiento de la carga el perfil no habra sido modificado

		Ejemplos:        
			| tipoServicio | id                   | tester |
			| WA           | 5491158638852        | true   |
			| email        | rgroisman@yoizen.com | false  |