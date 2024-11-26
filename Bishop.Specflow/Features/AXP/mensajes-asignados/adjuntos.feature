#language: es
Característica: Agregar adjuntos a la API de Messaging
	Como agente 
	Quiero poder enviar y recibir adjuntos y que se previsualicen en la conversación
	(antes los adjuntos entrantes se recibían con una url)

	Exploratorio: envío de diferentes tipos de archivo
	Se permiten los siguientes formatos: .3g2, .3gp, .7z, .aac, .amr, .avi, .bmp, .doc, .docx, .eml, .gif, .jepg, .jpg, .key, .m4a,
	.m4v, .mov, .mp3, .mp4, .mpeg, .mpg, .mpga, .numbers, .odt, .ogg, .pages, .pdf, .png, .pps, .ppsx, .ppt, .pptx, .svg, .txt, .wav,
	.webm, .webp, .wmv, .xls, .xlsx, .xml, .webp, .qt, .jfif, .oga, .ogv

Regla: Salientes - el agente puede adjuntar un archivo a la vez

	@tc:9772
	Esquema del escenario: un agente intenta adjuntar 3 archivos a la vez
		Dado que un agente abre el modal para enviarle adjuntos
		Cuando inserta por <via> 3 adjuntos a la vez
		Entonces aparecera un mensaje alertando que solo puede enviar uno a la vez

		Ejemplos: 
		| via           |
		| drag and drop |
		| el browser    |

	@tc:9773
	Escenario: se envia un archivo adjuntado con éxito
		Dado que un agente abre el modal para enviarle adjuntos a un usuario
		Cuando inserta por <via> 1 adjunto
		Entonces el adjunto enviado se visualiza en la conversacion
		Y el usuario lo recibe exitosamente

Regla: el tamaño máximo permitido es de 25MB
	
	@tc:9774
	Esquema del escenario: un agente intenta enviar un archivo que pesa más de 25 MB
		Dado que un agente abre el modal para enviarle adjuntos a un usuario
		Cuando inserta un adjunto que pesa <tamaño>
		Entonces <resultado obtenido>

		Ejemplos: 
		| tamaño | resultado obtenido            |
		| <25MB  | se envia con exito al usuario |
		| >25MB  | aparece un mensaje de error   |

Regla: cuando el agente recibe un mensaje entrante con un adjunto se debe previsualizar el adjunto en la conversacion

	@tc:9775
	Escenario: un agente previsualiza el adjunto entrante en la conversación, no se descarga
		Exploratorio: probar con distintos tipos de formato
		Dado que un usuario envia un archivo .jpg
		Cuando el agente selecciona ese caso
		Entonces puede previsualizar la imagen de ese archivo
		Y puede ampliarlo con exito (no descarga)

Regla: el usuario puede enviar su ubicación
	
	@tc:9800
	Escenario: el usuario envia su ubicacion
		Dado que un usuario interactua con un agente
		Cuando el usuario envia la ubicacion
		Entonces el agente recibe esa ubicacion con las coordenadas