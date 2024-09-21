#language: es
Característica: Dentro de datos del mensaje poder ver el contenido del mensaje
	Como supervisor al ingresar a los datos del mensaje
	quiero tener visualizacion del contenido del mensaje
	para enterarme de lo hablado dentro del mismo

	Regla de negocio: El supervisor puede ver el mensaje en la pestaña de informacion adicional
	
		@tc5818
		Esquema del escenario: Mensaje con caracteres especiales en el campo "Contenido" del modal "Datos del Mensaje"
			Dado un mensaje que contiene el siguiente texto "<texto con caracteres>"
			Cuando un supervisor ingrese a los datos del mensaje 
			Y vea el contenido en informacion adicional
			Entonces debera ver el texto "<texto con caracteres"

            Ejemplos:
                | texto con caracteres |
                | Hola_Hola__          |
                | Hola*Hola**          |