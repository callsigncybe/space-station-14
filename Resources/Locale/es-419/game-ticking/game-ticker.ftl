game-ticker-restart-round = Reiniciando la ronda...
game-ticker-start-round = La ronda está comenzando...
game-ticker-start-round-cannot-start-game-mode-fallback = ¡No se pudo iniciar el modo {$failedGameMode}! Usando {$fallbackMode} en su lugar...
game-ticker-start-round-cannot-start-game-mode-restart = ¡No se pudo iniciar el modo {$failedGameMode}! Reiniciando la ronda...
game-ticker-start-round-invalid-map = El mapa seleccionado {$map} no es compatible con el modo {$mode}. Puede que el modo no funcione como se espera...
game-ticker-unknown-role = Desconocido
game-ticker-delay-start = El inicio de la ronda se retrasó {$seconds} segundos.
game-ticker-pause-start = El inicio de la ronda está en pausa.
game-ticker-pause-start-resumed = Se reanudó la cuenta regresiva para el inicio de la ronda.
game-ticker-player-join-game-message = ¡Bienvenido a Space Station 14! Si es tu primera vez, lee las reglas del juego y no tengas miedo de pedir ayuda por LOOC (OOC local) u OOC (normalmente disponible solo entre rondas).
game-ticker-get-info-text = Hola, ¡bienvenido a [color=white]Space Station 14![/color]
                            Ronda actual: [color=white]#{$roundId}[/color]
                            Jugadores conectados: [color=white]{$playerCount}[/color]
                            Mapa actual: [color=white]{$mapName}[/color]
                            Modo de juego actual: [color=white]{$gmTitle}[/color]
                            >[color=yellow]{$desc}[/color]
game-ticker-get-info-preround-text = Hola, ¡bienvenido a [color=white]Space Station 14![/color]
                            Ronda actual: [color=white]#{$roundId}[/color]
                            Jugadores conectados: [color=white]{$playerCount}[/color] ([color=white]{$readyCount}[/color] {$readyCount ->
                                [one] está listo
                                *[other] están listos
                            })
                            Mapa actual: [color=white]{$mapName}[/color]
                            Modo de juego actual: [color=white]{$gmTitle}[/color]
                            >[color=yellow]{$desc}[/color]
game-ticker-no-map-selected = [color=yellow]¡Todavía no se eligió mapa![/color]
game-ticker-player-no-jobs-available-when-joining = Al intentar unirte a la partida, no había trabajos disponibles.
game-ticker-player-no-character-for-job-available-when-joining = Al intentar unirte a la partida, no había personajes disponibles para el trabajo {$job}.

# Se muestra en el chat a los administradores cuando entra un jugador
player-join-message = El jugador {$name} se unió.
player-first-join-message = El jugador {$name} se unió por primera vez.

# Se muestra en el chat a los administradores cuando sale un jugador
player-leave-message = El jugador {$name} salió.

latejoin-arrival-announcement = ¡{$character} ({$job}) llegó a la estación!
latejoin-arrival-announcement-special = ¡{$job} {$character} a bordo!
latejoin-arrival-sender = Estación
latejoin-arrivals-direction = En breve llegará un transbordador para llevarte a tu estación.
latejoin-arrivals-direction-time = Un transbordador para llevarte a tu estación llegará en {$time}.
latejoin-arrivals-dumped-from-shuttle = Una fuerza misteriosa te impide irte en el transbordador de llegadas.
latejoin-arrivals-teleport-to-spawn = Una fuerza misteriosa te teletransporta fuera del transbordador de llegadas. ¡Que tengas un buen turno!

preset-not-enough-ready-players = No se puede iniciar {$presetName}. Se necesitan {$minimumPlayers} jugadores, pero hay {$readyPlayersCount}.
preset-no-one-ready = No se puede iniciar {$presetName}. No hay jugadores listos.

game-run-level-PreRoundLobby = Lobby previo a la ronda
game-run-level-InRound = En ronda
game-run-level-PostRound = Fin de ronda
