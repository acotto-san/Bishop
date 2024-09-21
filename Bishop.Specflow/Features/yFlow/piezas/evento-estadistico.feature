#language:es
Característica: Pieza evento estadístico
	Como implementador de un flujo
	Quiero una pieza de evento estadístico
	Para que al ejecutarla registre un dato que yo configure en determinado evento

	Regla de negocio: El implementador puede ingresar lo que desee en la pieza para quedar registrado

		@tc:6787 @flowjson
		Esquema del escenario: Pieza evento estadistico guarda un dato de una variable
			Definiciones de flujos con evento estrucurado y tradicional:
			https://drive.google.com/file/d/1-UNpNAn7Pl6C19PRJkXq3JrzAehTV12f/view?usp=sharing
			https://drive.google.com/file/d/1-U1cX0YxuBnx0A134NyljJOxWtNshYxI/view?usp=sharing

			Dado que un supervisor configuro una pieza de evento estadistico con una variable de tipo <tipo de dato>
			Cuando la pieza sea ejecutada
			Entonces quedara registrado el dato en el evento estadistico

			Ejemplos: 
				| tipo de dato |
				| texto        |
				| numero       |
				| fecha        |
				| objeto       |
				| arreglo      |
				| booleano     |
				| binario      |
				| base64       |
