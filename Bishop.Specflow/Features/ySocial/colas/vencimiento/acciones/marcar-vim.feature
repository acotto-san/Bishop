#language: es 
@us:5160
Característica: Accion de Vencimiento en Cola marca a un mensaje como VIM
	Se desea tener una accion de Vencimiento en Cola que aplique el estado VIM a un mensaje que incumple el tiempo de service level en la cola.

	Antecedentes:
        Dado que la cola "Cola AAA" posee la siguiente configuracion de Vencimiento en Cola :
            | campo                   | valor      |
            | Marcar mensaje como VIM | habilitado |

    @tc:5323
    Escenario: se marca como VIM a un mensaje que incumple el tiempo de Vencimiento en Cola
        Dado un mensaje se encola en la cola "Cola AAA"
        Y el mensaje no es VIM
        Cuando el mensaje incumple el tiempo de Vencimiento en Cola
        Entonces el mensaje sera VIM 