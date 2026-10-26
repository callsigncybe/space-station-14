# Displayed as initiator of vote when no user creates the vote
ui-vote-initiator-server = El servidor

## Default.Votes

ui-vote-restart-title = Reiniciar ronda
ui-vote-restart-succeeded = La votación de reinicio fue aprobada.
ui-vote-restart-failed = La votación de reinicio fracasó (se necesita { TOSTRING($ratio, "P0") }).
ui-vote-restart-fail-not-enough-ghost-players = La votación de reinicio fracasó: se requiere un mínimo de { $ghostPlayerRequirement }% de jugadores fantasma para iniciar una votación de reinicio. Actualmente no hay suficientes jugadores fantasma.
ui-vote-restart-yes = Sí
ui-vote-restart-no = No
ui-vote-restart-abstain = Abstenerse

ui-vote-gamemode-title = Próximo modo de juego
ui-vote-gamemode-tie = ¡Empate en la votación del preset de juego! Se elige un preset al azar...
ui-vote-gamemode-win = ¡Terminó la votación del preset de juego!

ui-vote-map-title = Próximo mapa
ui-vote-map-tie = ¡Empate en la votación del mapa! Se elige un mapa al azar...
ui-vote-map-win = ¡Terminó la votación del mapa!
ui-vote-map-notlobby = ¡La votación de mapas solo es válida en el lobby antes de la ronda!
ui-vote-map-notlobby-time = ¡La votación de mapas solo es válida en el lobby antes de la ronda, con { $time } restantes!
ui-vote-map-invalid = ¡{ $winner } dejó de ser válido después de la votación de mapa! ¡No será seleccionado!

# Votekick votes
ui-vote-votekick-unknown-initiator = Un jugador
ui-vote-votekick-unknown-target = Jugador desconocido
ui-vote-votekick-title = { $initiator } inició una votación para expulsar al usuario: { $targetEntity }. Motivo: { $reason }
ui-vote-votekick-yes = Sí
ui-vote-votekick-no = No
ui-vote-votekick-abstain = Abstenerse
ui-vote-votekick-success = La votación para expulsar a { $target } fue aprobada. Motivo: { $reason }
ui-vote-votekick-failure = La votación para expulsar a { $target } fracasó. Motivo: { $reason }
ui-vote-votekick-not-enough-eligible = No hay suficientes votantes habilitados conectados para iniciar una votación de expulsión: { $voters }/{ $requirement }
ui-vote-votekick-server-cancelled = El servidor canceló la votación para expulsar a { $target }.
