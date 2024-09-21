#language: es
@us:6085
Característica: Columna que indique por quien fue finalizado el caso
	Como supervisor de ySocial 
	Quiero tener una columna que indique quien finalizo el caso
	Para saber si fue el usuario, el sistema, el agente, el bot o lo que haya sido

Recordartorio: Si el servicio no tiene los checks "Guardar conversación completa con yFlow" y "Guardar conversación completa con yFlow de chats abandonado"
entonces no sera mostrado en reporteria.
Regla de negocio: La columna debe mostrar por quien fue finalizado el caso dependiendo la situacion en la cual se haya finalizado

        @tc:7739
        Esquema del escenario: El supervisor ingresa al reporte "Detallado de chat"
            Dado que el chat fue finalizado por <razon>
            Cuando el supervisor vea ese caso en el reporte
            Y se posicione sobre la columna "Finalizado por"
            Entonces deberea ver en <estado>

            Ejemplos: Hay un cierre del chat por inactividad
                | razon                     | estado  |
                | un cierre por inactividad | Sistema |

            Ejemplos: Hay un cierre del chat por abandono (cierre de browser)
                | razon                                                                        | estado  |
                | que luego de asignarse al agente se auto-finaliza porque el usuario abandono | Sistema |

            Ejemplos: Hay un cierre del chat por decision del usuario
                | razon                                                           | estado  |
                | que luego de ser asignado al agente el usuario cierra la sesion | Usuario |
            
            Ejemplos: Hay un cierre por abandono en cola
                | razon                                                              | estado  |
                | que el cliente mientras que se encuentra en la cola cierra el chat | Sistema |
            
            Ejemplos: Hay un abandono del agente porque cierre el browser
                | razon                           | estado  |
                | que el agente cierra el browser | Sistema |

            Ejemplos: Hay una desconexion del cliente estando en cola
                | razon                                                        | estado  |
                | que estando en cola el cliente presiona el botor desconectar | Usuario |

            Ejemplos: Hay un cierre de chat desde el cliente 
                | razon                                                                        | estado  |
                | que ya estando asignado el cliente cierra el chat desde el boton hamburguesa | Usuario |

            Ejemplos: Hay una finalizacion del caso desde el agente sin que el usuario se haya desconectado
                | razon                                                             | estado |
                | que el agente finalizo el caso sin que el usuario se desconectara | Agente |
 
            Ejemplos: Cliente en yFlow y usuario pulsa botón cerrar chat
                | razon                                                        | estado  |
                | que el cliente esta en yflow y presiona el botón cerrar chat | Usuario |

            Ejemplos: Cliente en yFlow y usuario cierra browser
                | razon                                                 | estado  |
                | que el cliente esta en yflow y  el chat es abandonado | Sistema |
            
            Ejemplos: Cliente en yFlow y derivado al NUEVO bloque cierre de caso
                | razon                                                                             | estado |
                | que el cliente esta en yflow y el chat es derivado al NUEVO bloque cierre de Caso | yFlow  |