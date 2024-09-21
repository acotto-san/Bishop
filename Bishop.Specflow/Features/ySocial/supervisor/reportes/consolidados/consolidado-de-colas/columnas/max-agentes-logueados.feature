#language: es
Característica: Tener una columna que indique cuanto fue el pico de agentes en un intervalo
	Como supervisor que analiza intervalos del consolidado de colas
	Quiero saber cuanto fue el pico de agentes dentro del intervalo
	Para poder comparar entre intervalos

	@tc:7749
	Escenario: La cola registra un pico de agentes conectados
		Dada una cola que posee 10 agentes conectados en un intervalo
		Cuando se conectan otros 3 agentes 
		Y se desloguean 5 de los 10 previos
		Entonces para dicha cola el consolidado habra computado un pico de 13 agentes 

