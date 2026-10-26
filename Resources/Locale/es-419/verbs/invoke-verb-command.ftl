### Localización usada por el comando invokeverb.
# Sobre todo mensajes de ayuda y de error.

invoke-verb-command-description = Invoca un verbo con el nombre indicado sobre una entidad, con la entidad del jugador
invoke-verb-command-help = invokeverb <uidJugador | "self"> <uidObjetivo> <nombreVerbo | "interaction" | "activation" | "alternative">

invoke-verb-command-invalid-args = invokeverb recibe 2 argumentos.

invoke-verb-command-invalid-player-uid = No se pudo interpretar la uid del jugador, o no se pasó "self".
invoke-verb-command-invalid-target-uid = No se pudo interpretar la uid del objetivo.

invoke-verb-command-invalid-player-entity = La uid de jugador indicada no corresponde a una entidad válida.
invoke-verb-command-invalid-target-entity = La uid de objetivo indicada no corresponde a una entidad válida.

invoke-verb-command-success = Se invocó el verbo '{ $verb }' sobre { $target } con { $player } como usuario.

invoke-verb-command-verb-not-found = No se encontró el verbo { $verb } en { $target }.
