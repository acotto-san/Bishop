#language: es
@us:6632

Característica: Mostrar colores diferentes en los totales de las columnas que muestran promedios o totales
	Como administrador 
	Quiero ver en los totales de las columnas diferentes colores
	Para asi diferenciar si la columna muestra un total o un promedio de la misma

	Regla de negocio: 

		@tc:7126
		Escenario: Supervisor habilita el parametro
			Dado un supervisor ingresa a "mis ajustes"
			Cuando habilite el parametro "Diferenciar totales de reportes consolidados mediante colores"
			Entonces debera ver el parametro habilitado

	Regla de negocio: los totales deberan ser de diferente color dependiendo de cada columna	

		@tc:6836
		Esquema del escenario: Supervisor saca un reporte consolidado
			Dado un supervisor saca un reporte consolidado
			Cuando vea el reporte
			Entonces debera ver en las columnas que calculen <infoColumna> el fondo en color <color>
			
			Ejemplos: 
				| infoColumna | color |
				| Totales     | Negro |
				| Promedios   | Gris  |