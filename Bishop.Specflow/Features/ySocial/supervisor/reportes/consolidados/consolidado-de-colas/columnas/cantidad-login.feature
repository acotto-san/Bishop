#language: es 
Característica: Tener una columna que compute la cantidad de logins de agentes
	Como supervisor que analiza intervalos del consolidado de colas
	Quiero que el intervalo tenga registros de cuantos login de agentes ocurrieron
	Para poder comparar la cantidad con otros intervalos

	@tc:7751
	Escenario: Se loguean agentes y el total es recuperado por el consolidado
		Dada una cola que aun no registro logins de agentes en el intervalo
		Cuando 5 agentes se logueen
		Y el intervalo finalice 
		Entonces para dicha cola el consolidado mostrara 5 logins de agentes para el intervalo
