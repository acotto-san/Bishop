#language: es
Característica: Tener una metrica para estimar cuanto es el tiempo de espera (EWT)
	Como supervisor de ySocial
	Quiero tener una metrica que indique cuanto es el tiempo de espera (EWT) de una cola	
	Para poder tener una idea de cuanto tiempo es el promedio en atender mensajes ahí

	Regla de negocio: La metrica se formula multiplicando AHT por los mensajes encolados y luego divido por los agentes disponibles/trabajando

		@tc:6742
		Escenario: Tener una metrica para estimar cuanto es el tiempo de espera (EWT)
			Dado que tengo un AHT de 10 minutos
			Y tengo 10 mensajes encolados
			Y tengo 5 agentes disponibles
			Cuando calculo la metrica
			Entonces el resultado es 20 minutos

	Regla de negocio: La metrica se computa cada una cantidad de segundos configurada

		@tc:6743
		Esquema del escenario: La metrica en el dashboard se vuelve a calcular segun el tiempo configurado en parametros de sistema
			Dado que en parametros de sistema se configuro que la metrica EWT se refresque cada <segundos> segundos
			Cuando transcurran <segundos> segundos desde la ultima vez que se calculo la metrica
			Entonces la metrica se vuelve a calcular	

			Ejemplos: 
				| segundos |
				| 15       |
				| 55       |

		@tc:6744
		Escenario: una cola puede sobreescribir la configuracion de EWT de parametros del sistema
			Dado que en parametros de sistema se configuro que la metrica EWT se refresque cada 55 segundos
			Y en una cola se configuro que se sobreescribira esa configuracion por un refresco cada 15 segundos
			Entonces la metrica de dicha cola se calculara mas seguido que en el resto de las colas

	Regla de negocio: Hay situaciones donde la metrica no se va a poder calcular 

		@tc:6745
		Escenario: No se poseen agentes en estado disponible/trabajando para calcular el EWT
			Dado que tengo un AHT de 10 minutos
			Y tengo 10 mensajes encolados
			Y tengo 0 agentes disponibles
			Cuando calculo la metrica
			Entonces el resultado es el simbolo de infinito

		@tc:6747
		Escenario: No se posee un AHT ni un ASA para calcular el EWT
			Dado que tengo un AHT de 0 minutos
			Y la cola posee un ASA de 0 minutos
			Y tengo 10 mensajes encolados
			Y tengo 5 agentes disponibles
			Cuando calculo la metrica
			Entonces el resultado es "N/A"

	Regla de negocio: Frente a la ausencia de una materia prima para construir el EWT se buscan alternativas.
        
        @tc:6746
        Escenario: No se posee un AHT para calcular el EWT
            Dado que tengo un AHT de 0 minutos
            Y la cola posee computada un ASA Diario
            Y tengo 10 mensajes encolados
            Y tengo 5 agentes disponibles
            Cuando calculo la metrica
            Entonces el resultado es calculado con el ASA del dia en reemplazo del AHT


        @tc:8816
        Escenario: No hay mensajes encolados entonces tal valor se omite de la computación del EWT.
            (EWT = AHT o Suplente / agente disponible -trabajando)
            Dado No hay mensajes encolados
            Cuando se calcula el ewt
            Entonces Se omite el valor de los mensajes encolados en la computación del EWT

        @tc:8817 
        Escenario: AHT y ASA Diario es 0
            Dado ASA BASE  esta configurado en 40 segundos
            Y aht - asa diario computan 0
            Cuando se computa el EWT
            Entonces se usa el valor de 40 segundos en reemplazo de aht y asa diario.
     