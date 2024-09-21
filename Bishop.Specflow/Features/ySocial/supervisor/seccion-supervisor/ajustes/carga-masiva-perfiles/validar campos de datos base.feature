 #language: es
Característica: validar campos de datos base

	@tc:5950
	Esquema del escenario: campo de nombre incumple validacion   
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee los siguientes registros:
			"""
				<id>,2,<nombreInicial>,rgroisman@yoizen.com,5491158638852,1,1,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces se vera un aviso indicando que el csv posee un error en la linea 1


		Ejemplos:      
			| tipoServicio | id                   | nombreInicial |
			| WA           | 5491158638852        | null          |
			| email        | rgroisman@yoizen.com | n1 n2 n3 n4   |
			| WA           | 5491158638852        | 5491158638852 |

	@tc:5951
	Esquema del escenario: campo de mail incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee los siguientes registros:
			"""
				<id>,2,romina groisman,<email>,5491158638852,1,1,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces se vera un aviso indicando que el csv posee un error en la linea 1

		Ejemplos:       
			| tipoServicio | id                   | email                |
			| WA           | 5491158638852        | rgroisman.com        |
			| email        | rgroisman@yoizen.com | rgroisman@yoizen,com |
			| WA           | 5491158638852        | rgroisman@ yoizen.com|

	@tc:5952
	Esquema del escenario: campo de telefono incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee los siguientes registros:
			"""
				<id>,2,romina groisman,rgroisman@yoizen.com,<telefono>,1,1,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces se vera un aviso indicando que el csv posee un error en la linea 1

		Ejemplos:        
			| tipoServicio | id                   | telefono        |
			| WA           | 5491158638852        | 58638852        |
			| email        | rgroisman@yoizen.com | 549111558638852 |
			| WA           | 5491158638852        | telefono        |

	@tc:5953
	Esquema del escenario: campo de vip incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee los siguientes registros:
			"""
				<id>,2,romina groisman,rgroisman@yoizen.com,5491158638852,<vip>,1,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces se vera un aviso indicando que el csv posee un error en la linea 1

		Ejemplos:        
			| tipoServicio | id                   | vip   |
			| WA           | 5491158638852        | true  |
			| email        | rgroisman@yoizen.com | false |
			| WA           | 5491158638852        | null  |

	@tc:5954
	Esquema del escenario: campo de bloqueado incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee los siguientes registros:
			"""
				<id>,2,romina groisman,rgroisman@yoizen.com,5491158638852,1,<bloqueado>,1,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces se vera un aviso indicando que el csv posee un error en la linea 1

		Ejemplos:        
			| tipoServicio | id                   | bloqueado |
			| WA           | 5491158638852        | true      |
			| email        | rgroisman@yoizen.com | false     |
			| WA           | 5491158638852        | null      |

	@tc:5955
	Esquema del escenario: campo de lista no contactar incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee los siguientes registros:
			"""
				<id>,2,romina groisman,rgroisman@yoizen.com,5491158638852,1,1,<no contactar>,1
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces se vera un aviso indicando que el csv posee un error en la linea 1

		Ejemplos:        
			| tipoServicio | id                   | no contactar |
			| WA           | 5491158638852        | true         |
			| email        | rgroisman@yoizen.com | false        |
			| WA           | 5491158638852        | null         |

	@tc:5956
	Esquema del escenario: campo de lista testers incumple validacion
		Dado que un supervisor agrega usuarios masivamente de la red <tipoServicio>
		Y dado un csv que posee los siguientes registros:
			"""
				<id>,2,romina groisman,rgroisman@yoizen.com,5491158638852,1,1,1,<tester>
			"""
		Cuando un supervisor genera una carga masiva utilizando el csv provisto
		Entonces se vera un aviso indicando que el csv posee un error en la linea 1

		Ejemplos:        
			| tipoServicio | id                   | tester |
			| WA           | 5491158638852        | true   |
			| email        | rgroisman@yoizen.com | false  |
			| WA           | 5491158638852        | null   |