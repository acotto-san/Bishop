#language: es
@us:8618
Característica: Controlar por licencia el login nominal de usuarios
	
	Como Administrador del sistema
	Quiero Poder definir la cantidad de usuarios nominales por licencia 
	Para Acompañar las definiciones de nuevos planes comerciales

    Se constituye equidad entre lo que conocía como usuarios y agentes, ahora todos se consideran usuarios. Se agrega MaxNominalUsers en el archivo XML, para controlar 
	por licencia la cantidad máxima de usuarios nominales.

	Este contador aparece en administracion>parametros de licencia
	Hay dos secciones para creación de usuarios:  administracion>usuarios | configuración>agentes   

	Exploratorio: iniciar con cantidad ilimitada de usuarios, crear 20 usuarios, luego bajar la cantidad a 10. Verificar los textos en las alertas de cantidad máxima de usuarios permitidos.


Regla: La cantidad de usuarios es ilimitada si se coloca 0 en el parámetro de máxima cantidad de usuarios en la licencia. Por default el sistema tiene valor 0.

	@tc:8876
	Escenario: Por default el valor de cantidad máxima de usuarios nominales es cero
		Dado que un cliente realiza la actualizacion de la version con este feature
		Cuando visualiza los parametros de la licencia
		Entonces tendra el valor cero en la cantidad maxima de usuarios nominales
	
	@tc:8877
	Escenario: la cantidad de usuarios nominales es ilimitada
		Dado que un admin configura los parametros de la licencia
		Y coloca un cero en la cantidad maxima de usuarios nominales
		Cuando se creen usuarios en la seccion administracion de usuarios
		Y se creen en la seccion configuracion de agentes
		Entonces no existira ningun limite de creacion de usuarios

Regla: La cantidad máxima de usuarios nominales debe ser un número entero positivo
	
	@tc:8878
	Esquema del escenario: la cantidad de usuarios nominales no es un número entero positivo
		Dado que un admin configura los parametros de la licencia
		Cuando coloca un <numero> en la cantidad maxima de usuarios nominales
		Entonces no podra guardar los cambios de parametros de la licencia

		Ejemplos:
			| numero |
			| -1     |
			| null   |
			| 11,4   |
			| >90    |

Regla: La cantidad máxima de usuarios nominales configurada no incluye los usuarios de yoizen por default (yoizenadmin y Administrador)

	@tc:8879
	Escenario: se excluyen los usuarios de yoizen en el contador de usuarios nominales
		Dado que un admin configura 12 usuarios nominales como maximo
		Cuando se registran 10 usuarios nominales 
		Y se registran 2 usuarios default de yoizen
		Entonces se podran agregar hasta dos usuarios nominales mas

Regla: Cuando se llega a la cantidad máxima configurada se inhabilita la creación de usuarios nuevos

	@tc:8880
	Escenario: Se inhabilita la creación de usuario desde Usuarios
		Dado que un admin configura 20 usuarios nominales como maximo
		Cuando haya <cantidad> usuarios nominales registrados
		Y ingrese a ySocial → Administracion → Usuarios
		Entonces <resultado obtenido>


		Ejemplos:
		| cantidad | resultado obtenido                                                                 |
		| 20       | no existira el boton "Nuevo" y aparece la alerta “No se pueden crear mas usuarios” |
		| 19       | se podra crear solo un usuario mas                                                 |  

	@tc:8881
	Escenario:Se inhabilita la creación de usuario desde Agentes
		Dado que un admin configura 20 usuarios nominales como maximo
		Y hay 20 usuarios nominales registrados
		Cuando ingrese a ySocial → Configuracion → Agentes
		Entonces el sistema ocultara los botones ”Nuevo”, “Nuevo desde grupo” y “Carga masiva”
		Y aparecera la alerta: “No se pueden crear mas agentes”

	@tc:8882
	Escenario:Se inhabilita la creación de usuario desde Carga masiva
		Dado que un admin configura 20 usuarios nominales como maximo
		Y hay 15 usuarios nominales registrados 
		Cuando intente hacer una carga masiva de agentes
		Y el csv contiene <cantidad> registros
		Entonces <resultado obtenido>

		Ejemplos: 
		| cantidad | resultado obtenido                                              |
		| 5        | finalizara la tarea de carga masiva                             |
		| 6        | Se cargaran 5 usuarios y queda el aviso de 1 que no fue cargado |

	@tc:8883
	Escenario: Se vuelve a habilitar la creación de usuarios
		Dado que se llega a la cantidad maxima de usuarios registrados
		Cuando se elimina un usuario nominal
		Entonces se habilitan los botones de creacion de usuarios

	@tc:8884
	Escenario: Los agentes y usuarios son equivalentes
		Dado que un admin configura 35 usuarios nominales como maximo
		Y hay 25 usuarios registrados en administracion
		Y hay 8 agentes registrados
		Cuando se crean 2 agentes nuevos
		Entonces se llega al maximo de los usuarios nominales habilitados

Regla: El valor configurado como cantidad maxima de usuarios debe considerar aquellos usuarios que se encuentren en estado deshabilitado. 
	
	@tc:8885
	Escenario: se deshabilita un usuario y se intenta agregar otro
	Exploratorio: deshabilitar usuarios y agentes
		Dado que un admin configura 5 usuarios nominales como maximo
		Y se tienen 5 usuarios habilitados
		Cuando se deshabilita 1 usuario
		Y se intenta agregar un usuario
		Entonces no podra hacerlo porque tiene 5 usuarios

Regla: Al llegar a la cantidad máxima de usuarios se deshabilita la posibilidad de copiar agentes, ya que en esta acción se crea uno.

	@tc:8886
	Escenario: se intenta copiar un agente
		Dado que un admin configura 5 usuarios nominales como maximo
		Y tiene 5 agentes registrados
		Cuando intenta copiar la configuracion de un agente
		Entonces no debera visualizar el boton de copiar agente ya que llega al maximo de usuarios

	@tc:8887
	Esquema del escenario: se deshabilita o elimina un agente y se intenta copiar otro agente
		Dado que un admin configura 5 usuarios nominales como maximo
		Y tiene 5 agentes registrados
		Cuando se <accion> un agente
		Y se intenta copiar la configuracion de un agente
		Entonces <resultado obtenido>

		Ejemplos:
			| accion      | resultado obtenido                                                                |
			| deshabilita | no debera visualizar el boton de copiar agente ya que tiene el maximo de usuarios |
			| elimina     | debera ver el boton para copiar el agente                                         |

Regla: El cambio de usuario agente a agente del sistema no modifica la cantidad de usuarios ya que son equivalentes

	@tc:8888
	Escenario: Se esta al limite de usuarios y convertir agente a usuario no habilita el alta de usuarios
		Dado que un admin configura 5 usuarios nominales como maximo
		Y tiene 5 agentes registrados
		Cuando se convierte un agente en un usuario del sistema
		Entonces no debe afectar a la capacidad maxima de nominales
		Y no podra crear un usuario nuevo

	@tc:9249
	Escenario: Se esta al limite de usuarios y eliminar a un agente convertido en usuario rehabilita el alta 
		Dado que se llego al limite de cuentas nominales 
		Y un usuario es resultado de la conversion de un agente
		Cuando se elimina el usuario
		Entonces no debe afectar a la capacidad maxima de nominales
		Y no podra crear un usuario nuevo

	@tc:9250
	Escenario: Se esta a un usuario de llegar al limite y un agente se convierte en usuario
		Dado que la cantidad de usuarios creados en el sistema esta a 1 cuenta de llegar al limite
		Cuando se convierte un agente en un usuario del sistema
		Entonces debe seguir estando disponible el cupo de 1 cuenta para llegar al limite
