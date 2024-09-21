#language: es
Característica: Tener una columna que indique cuantos agentes habia logueados al cierre del intervalo
	Como supervisor que analiza intervalos del consolidado de colas
	Quiero que haya  un conteo de cuantos agentes había logueados al cierre del intervalo
	Para poder comparar la fluctuacion de agentes en los diferentes 

	@tc:7744
	Escenario: Agente se encontraba logueado cuando el intervalo cerro
		Dado una cola que posee 5 agentes conectados
		Cuando el intervalo cierre 
		Y el consolidado compute la cantidad de agentes
		Entonces la columna indicara 5 