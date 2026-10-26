# Comandos de reproducción

cmd-replay-play-desc = Reanuda la reproducción del replay.
cmd-replay-play-help = replay_play

cmd-replay-pause-desc = Pausa la reproducción del replay
cmd-replay-pause-help = replay_pause

cmd-replay-toggle-desc = Reanuda o pausa la reproducción del replay.
cmd-replay-toggle-help = replay_toggle

cmd-replay-toggle-screenshot-mode-desc = Activa o desactiva el modo captura de pantalla para los replays, ocultando el widget de control del replay.
cmd-replay-toggle-screenshot-mode-help = replay_toggle_screenshot_mode

cmd-replay-stop-desc = Detiene y descarga un replay.
cmd-replay-stop-help = replay_stop

cmd-replay-load-desc = Carga e inicia un replay.
cmd-replay-load-help = replay_load <carpeta del replay>
cmd-replay-load-hint = Carpeta del replay

cmd-replay-skip-desc = Salta hacia adelante o hacia atrás en el tiempo.
cmd-replay-skip-help = replay_skip <tick o intervalo de tiempo>
cmd-replay-skip-hint = Ticks o intervalo de tiempo (HH:MM:SS).

cmd-replay-set-time-desc = Salta hacia adelante o hacia atrás a un momento específico.
cmd-replay-set-time-help = replay_set <tick o tiempo>
cmd-replay-set-time-hint = Tick o intervalo de tiempo (HH:MM:SS), a partir de

cmd-replay-error-time = "{$time}" no es un número entero ni un intervalo de tiempo.
cmd-replay-error-args = Cantidad de argumentos incorrecta.
cmd-replay-error-no-replay = No se está reproduciendo ningún replay.
cmd-replay-error-already-loaded = Ya hay un replay cargado.
cmd-replay-error-run-level = No puedes cargar un replay mientras estás conectado a un servidor.

cmd-replay-toggleui-desc = Muestra u oculta la interfaz de control del replay.

# Comandos de grabación

cmd-replay-recording-start-desc = Inicia la grabación de un replay, opcionalmente con un límite de tiempo.
cmd-replay-recording-start-help = Uso: replay_recording_start [nombre] [sobrescribir] [límite de tiempo]
cmd-replay-recording-start-success = Se inició la grabación de un replay.
cmd-replay-recording-start-already-recording = Ya se está grabando un replay.
cmd-replay-recording-start-error = Ocurrió un error al intentar iniciar la grabación.
cmd-replay-recording-start-hint-time = [límite de tiempo (minutos)]
cmd-replay-recording-start-hint-name = [nombre]
cmd-replay-recording-start-hint-overwrite = [sobrescribir (bool)]

cmd-replay-recording-stop-desc = Detiene la grabación de un replay.
cmd-replay-recording-stop-help = Uso: replay_recording_stop
cmd-replay-recording-stop-success = Se detuvo la grabación del replay.
cmd-replay-recording-stop-not-recording = No se está grabando ningún replay.

cmd-replay-recording-stats-desc = Muestra información sobre la grabación de replay actual.
cmd-replay-recording-stats-help = Uso: replay_recording_stats
cmd-replay-recording-stats-result = Duración: {$time} min, Ticks: {$ticks}, Tamaño: {$size} MB, tasa: {$rate} MB/min.


# Interfaz de control de tiempo
replay-time-box-scrubbing-label = Desplazamiento dinámico
replay-time-box-replay-time-label = Tiempo de grabación: {$current} / {$end}  ({$percentage}%)
replay-time-box-server-time-label = Tiempo del servidor: {$current} / {$end}
replay-time-box-index-label = Índice: {$current} / {$total}
replay-time-box-tick-label = Tick: {$current} / {$total}
