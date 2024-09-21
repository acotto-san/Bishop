#language: es
Característica: enviar variables a cognitividad
	Se desea tener una nueva columna “enviar a cognitividad” para variables en yFlow. El envio de variables se realiza en la ejecucion de piezas cognitivas en yFlow
	Envío de datos de Contexto. Recepción de variables en ySmart

	Regla: En la seccion de variables se agrega una columna "enviar a Cognitividad". Si el check está activado, esa variable es enviada cada vez que se ejecuta una pieza de cognitividad

		@tc:7652
		Esquema del escenario: una variable tiene check activo de la columna enviar a cognitividad
			Dado que la variable "dni" tiene el check <habilitacion> de enviar a cognitividad
			Cuando se procesa una pieza de cognitividad
			Entonces deberia <envio> el dato de la variable a ysmart

				Ejemplos: 
					| habilitacion | envio       |
					| activo       | enviarse    |
					| desactivado  | no enviarse |

		@tc:7653
		Esquema del escenario: ejecucion de piezas de cognitividad y envio de variables
		Exploratorio: probar variable con un valor por defecto en yflow
			Dado que un flujo tiene cinco variables que tienen el check activado de enviar a cognitividad
			Cuando se ejecuta la pieza <pieza>
			Entonces deberia enviarse el dato de las cinco variables a ysmart
	
				Ejemplos:
					| pieza                           |
					| Base de conocimiento            |
					| Ingreso de datos                |
					| Ejecutar cognitividad           |
					| formulario inteligente          |
					| condicion de una variable       |
					| obtener entidad                 |
					| obtener entidades de un mensaje |

	Regla: Si la variable modifica su valor durante el flujo, deberia enviarse cada cambio realizado

		@tc:7654
		Escenario: se modifica el valor de una variable mediante la ejecucion de una pieza de cognitividad
			Dada la ultima frase procesada por cognitividad "tengo 30 años y vivo en corrientes 2552"
			Y la pieza Obtener Entidad guardo "Corrientes 2552" en la variable domicilioUsuario al identificar la entidad domicilio 
			Cuando se procesa la pieza formulario
			Y se obtiene el dato Corrientes 3669 para la variable domicilioUsuario
			Entonces se ve actualizado el dato de la variable domicilioUsuario en ysmart

		@tc:7655
		Escenario: se modifica el valor de una variable mediante la ejecucion de una pieza no cognitiva
			Dada la ultima frase procesada por cognitividad "tengo 30 años y vivo en corrientes 2552"
			Y la pieza Obtener Entidad guardo "Corrientes 2552" en la variable domicilioUsuario al identificar la entidad domicilio 
			Cuando se procesa la pieza ingreso de datos sin ejecutar cognitividad
			Y se guarda un dato nuevo en la variable domicilioUsuario
			Entonces se ve actualizado el dato de la variable domicilioUsuario en yFlow

		@tc:7684
		Escenario: envio de variable sin datos
			Dado que la variable domicilioUsuario tiene el check activado de enviar a cognitividad
			Cuando se procesan los mensajes por ysmart
			Y esta variable se encuentra vacia
			Entonces no se envia la variable domicilioUsuario
