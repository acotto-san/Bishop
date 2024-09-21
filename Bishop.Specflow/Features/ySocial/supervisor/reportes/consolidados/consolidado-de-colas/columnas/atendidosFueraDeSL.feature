#Característica: mensajes atendidos fuera de SL
#    Como supervisor que visualiza el reporte consolidado de colas
#    Quiero ver una columna que cuente en cada intervalo cuantos mensajes fueron atendidos fuera de SL
#    Para poder saber si la cola tuvo un buen performance respecto a la atencion dentro de service level en ese intervalo
#
#    Regla: los mensajes atendidos fuera de SL seran contabilizados en consolidados diarios

        #Escenario: mensaje con estado asignado cambia a atendido al ser agrupado 
        #Escenario: mensaje con estado asignado cambia a atendido al ser finalizada la atencion