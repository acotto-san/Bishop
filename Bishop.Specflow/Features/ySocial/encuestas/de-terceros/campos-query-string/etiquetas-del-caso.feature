#language: es
Característica: campo con las etiquetas del caso
	Se desea tener un campo en el querystring de la encuesta de tercero que muestre los id de las etiquetas que posee el caso
	
	Antecedentes: 
		Dado que en ySocial se encuentran las siguientes etiquetas configuradas
				| nombre de etiqueta          | id de etiqueta |
				| BBB/BBB-Hija                | 10270          |
				| AAAA/AAA-Hija               | 10269          |
				| Bisabuela/Abuela/Madre/Hija | 10243          |

	@tc:5878
	Esquema del escenario: campo caseTags muestra el id de etiquetas que posee el caso
		Dado una encuesta que posee habilitada el check "Etiquetas del caso"
		Y un caso que fue cerrado posee las siguientes etiquetas: <etiquetas del caso>
		Cuando se le envie la url de la encuesta al usuario
		Entonces el enlace contendra el campo "caseTags=<valor>"

		Ejemplos:
			| etiquetas del caso                                     | valor                 |
			| ninguna                                                |                       |
			| BBB/BBB-Hija                                           | 10270                 |
			| BBB/BBB-Hija,AAAA/AAA-Hija                             | 10270%2C10269         |
			| BBB/BBB-Hija,AAAA/AAA-Hija,Bisabuela/Abuela/Madre/Hija | 10270%2C10269%2C10243 |