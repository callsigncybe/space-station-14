### Localización del comando de ban de rol

cmd-roleban-desc = Banea a un jugador de un rol
cmd-roleban-help = Uso: roleban <nombre o ID de usuario> <trabajo> <motivo> [duración en minutos, omitir o 0 para ban permanente]

## Sugerencias de autocompletado
cmd-roleban-hint-1 = <nombre o ID de usuario>
cmd-roleban-hint-2 = <trabajo>
cmd-roleban-hint-3 = <motivo>
cmd-roleban-hint-4 = [duración en minutos, omitir o 0 para ban permanente]
cmd-roleban-hint-5 = [gravedad]

cmd-roleban-hint-duration-1 = Permanente
cmd-roleban-hint-duration-2 = 1 día
cmd-roleban-hint-duration-3 = 3 días
cmd-roleban-hint-duration-4 = 1 semana
cmd-roleban-hint-duration-5 = 2 semanas
cmd-roleban-hint-duration-6 = 1 mes


### Localización del comando de desbaneo de rol

cmd-roleunban-desc = Perdona el ban de rol de un jugador
cmd-roleunban-help = Uso: roleunban <id del ban de rol>
cmd-roleunban-unable-to-parse-id = No se pudo interpretar {$id} como un número entero de id de ban.
                                   {$help}

## Sugerencias de autocompletado
cmd-roleunban-hint-1 = <id del ban de rol>


### Localización del comando de lista de bans de rol

cmd-rolebanlist-desc = Lista los bans de rol del usuario
cmd-rolebanlist-help = Uso: <nombre o ID de usuario> [incluir desbaneados]

## Sugerencias de autocompletado
cmd-rolebanlist-hint-1 = <nombre o ID de usuario>
cmd-rolebanlist-hint-2 = [incluir desbaneados]


cmd-roleban-minutes-parse = {$time} no es una cantidad válida de minutos.\n{$help}
cmd-roleban-severity-parse = ${severity} no es una gravedad válida\n{$help}.
cmd-roleban-arg-count = Cantidad de argumentos inválida.
cmd-roleban-job-parse = El trabajo {$job} no existe.
cmd-roleban-name-parse = No se encontró ningún jugador con ese nombre.
cmd-roleban-existing = {$target} ya tiene un ban de rol para {$role}.
cmd-roleban-success = Se baneó a {$target} del rol {$role} con el motivo {$reason} {$length}.

cmd-roleban-inf = de forma permanente
cmd-roleban-until =  hasta {$expires}

# Bans de departamento
cmd-departmentban-desc = Banea a un jugador de los roles que forman un departamento
cmd-departmentban-help = Uso: departmentban <nombre o ID de usuario> <departamento> <motivo> [duración en minutos, omitir o 0 para ban permanente]
