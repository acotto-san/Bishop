#language: es
@us:6501
Característica: modulo child

	Regla de negocio: cuando un modulo child publica sus cambios estos son visibles en master

		@tc:6689
		Escenario: supervisor intenta publicar un modulo child y ve un mensaje custom en el modal
			Dado que un supervisor se encuentra en el modulo child
			Cuando intente publicar el modulo child a master
			Y aparezca el modal de confirmacion
			Entonces vera en el texto del boton "guardar y publicar a master"