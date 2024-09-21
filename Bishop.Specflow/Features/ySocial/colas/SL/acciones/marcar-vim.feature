#language: es 
@us:5160
Característica: Accion de Service Level marca a un mensaje como VIM
	Se desea tener una accion de service level que aplique el estado VIM a un mensaje que incumple el tiempo de service level en la cola.

	Antecedentes:
        Dado que la cola "Cola AAA" posee la siguiente configuracion de SL :
            | campo                   | valor      |
            | Marcar mensaje como VIM | habilitado |

    @tc:5322
    Escenario: se marca como VIM a un mensaje que incumple el tiempo de service level
        Dado un mensaje se encola en la cola "Cola AAA"
        Y el mensaje no es VIM
        Cuando el mensaje incumple el tiempo de service level
        Entonces el mensaje sera VIM 