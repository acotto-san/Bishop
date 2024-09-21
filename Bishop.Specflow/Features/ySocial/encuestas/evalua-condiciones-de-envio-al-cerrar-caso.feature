#language: es
@us:6458
Característica: Evaluar si un caso debe ser encuestado al momento en el que es cerrado
	Hasta 8.4 se tenía solo una instancia de evaluación de casos para el envío de encuestas. Cuando un caso cumpliera el tiempo 
	necesario para ser encuestado (en la config de la encuesta se setea) entonces el servicio de encuestas tomaba
	dicho mensaje y evaluaba si aplicaba a las condiciones de envío y a las no-condiciones de envío. Dependiendo de la 
	evaluación, la encuesta salía o no. 

	Como dev 
	Quiero dividir el proceso de evaluacion de casos a ser encuestados
	Para poder adelantar el descarte de casos que no aplican a penas son cerrados y no tener un volumen 
	tan alto de casos a evaluar cuando el servicio recupere los que hayan acumulado el tiempo minimo para el envío

	Regla de negocio: Se evaluan los casos al momento de cerrarse

		@tc:6523
		Esquema del escenario: Evaluacion de encuesta al cerrar un caso que cerro en una cola
			Dada una cola con una encuesta configurada
			Y un caso que <aplica> a la encuesta
			Cuando el caso cierra en la cola
			Y es evaluado para identificar si aplica a ser encuestado
			Entonces el caso quedara registrado para <resultado> evaluado nuevamente cuando acumule el tiempo necesario

			Ejemplos: 
				| aplica    | resultado |
				| aplica    | ser       |
				| no aplica | no ser    |

		@tc:6524
		Esquema del escenario: Evaluacion de encuesta al cerrar un caso que solo interactuo con el bot
			Dado un servicio con una encuesta configurada en el apartado de yFlow
			Y un caso que <aplica> a la encuesta
			Cuando el caso cierra solo habiendo interactuado con el bot
			Y es evaluado para identificar si aplica a ser encuestado
			Entonces el caso quedara registrado para <resultado> evaluado nuevamente cuando acumule el tiempo necesario

			Ejemplos: 
				| aplica    | resultado |
				| aplica    | ser       |
				| no aplica | no ser    |

		@tc:6525
		Esquema del escenario: Evaluacion de encuesta al cerrar un caso de mail con solo un saliente
			Dado un servicio de mail con una encuesta configurada
			Y un caso que inicio por un mensaje saliente
			Y el caso <aplica> a la encuesta
			Cuando el caso cierra sin haber tenido respuesta del usuario final
			Y es evaluado para identificar si aplica a ser encuestado
			Entonces el caso quedara registrado para <resultado> evaluado nuevamente cuando acumule el tiempo necesario

			Ejemplos: 
				| aplica    | resultado |
				| aplica    | ser       |
				| no aplica | no ser    |