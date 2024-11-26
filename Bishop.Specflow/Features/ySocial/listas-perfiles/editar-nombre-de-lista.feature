#language: es
Característica:editar nombre de la lista de perfil de usuarios
	Como Administrador del sistema
	Quiero Poder modificar el nombre de una lista de perfil de usuario
	Para Poder gestionar con mayor libertad el listado

Regla: se puede modificar el nombre de la lista de perfil al editar su configuración

	@tc:9571
	Escenario: Se modifica el nombre de una lista de perfil de usuario
		Dado un administrador edita la lista "lista de prueba"
		Cuando le modifica su nombre a "lista modificada"
		Entonces se debera observar "lista modificada" en las listas de perfiles de usuario

Regla: dos o más listas de perfiles pueden tener el mismo nombre ya que se identifican por la clave.

	@tc:9572
	Escenario: Dos listas de perfiles tienen el mismo nombre
		Dado que una lista de perfiles 1 se llama "clientes vip"
		Y otra lista de perfiles 2 se llama "clientes regular"
		Cuando se modifica el nombre de la lista de perfiles 2 a "clientes vip"
		Entonces debera ver dos listas con el nombre "clientes vip"
		Y se diferencian por la clave