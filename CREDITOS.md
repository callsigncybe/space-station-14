# Créditos y atribución — [MRP]Argentea Station

**[MRP]Argentea Station** es un servidor latino de Space Station 14 en español.
No es un proyecto creado desde cero: está construido sobre el trabajo de otras comunidades,
que se reconocen a continuación.

## Proyecto original: Starlight

Este servidor es un fork de **STARLIGHT**, un proyecto de código abierto que busca crear
mecánicas únicas y un buen ambiente de juego en Space Station 14.

- Repositorio: https://github.com/ss14Starlight/space-station-14
- Discord: https://discord.com/invite/HyDhPwAmUq
- Documentación: https://docs.starlight.network/

Todo el contenido propio de Starlight (código, mecánicas, sprites, sonidos y textos) pertenece
a sus autores y contribuidores. Agradecemos al equipo de Starlight por publicar su trabajo.

## Space Station 14

Starlight, a su vez, se basa en **Space Station 14**, desarrollado por la
**Space Wizards Federation** y su comunidad.

- Repositorio: https://github.com/space-wizards/space-station-14
- Sitio web: https://spacestation14.com/

## Otros forks incluidos

Starlight incorpora contenido de otros forks de la comunidad (por ejemplo Goobstation,
Impstation, Funkystation, Moffstation, Wizard's Den y otros). Ese contenido está en las
carpetas con prefijo `_` (como `_Goobstation` o `_Impstation`) y pertenece a sus respectivos
autores. Las atribuciones de cada recurso están en los archivos de metadatos y licencia de
cada carpeta (`meta.json`, `attributions.yml`, etc.).

## Licencias

Este repositorio mantiene sin cambios las licencias del proyecto original:

| Contenido | Licencia | Archivo |
|---|---|---|
| Código de Space Wizards y de Starlight fuera del período indicado abajo | MIT | [`LICENSE.TXT`](LICENSE.TXT) |
| Contribuciones a Starlight entre el 2024-11-04 (commit `84205e38`) y el 2026-02-28 (commit `01eff0f7`) | Starlight Fork License (MIT con obligación de atribución) | [`LICENSE-Starlight.TXT`](LICENSE-Starlight.TXT) |
| Recursos no-código de Starlight (íconos, sprites, sonidos) salvo que se indique otra cosa | Creative Commons 3.0 BY-SA | — |
| Audios en `Resources/Audio/_Starlight/Effects/Experiment/` y `Resources/Audio/_Starlight/Voice/Experiment/` | Licencia propia ("Cargo License") | [`LICENSE-Sawians.md`](LICENSE-Sawians.md) |

### Audios de Orsoniks

Los audios listados en `LICENSE-Sawians.md` son obra de **Orsoniks** (Discord: `@orson0`)
y se usan bajo su licencia, que permite usarlos en servidores de SS14 con atribución.
El autor puede revocar el permiso para un servidor concreto con aviso previo; en ese caso
se deben quitar del servidor dentro de los 14 días siguientes.

## Cambios propios de Argentea Station

Los cambios propios de este servidor son, por ahora:

- Traducción del juego al español latino (`Resources/Locale/es-419/`), con el inglés como respaldo.
- Configuración del servidor (`Resources/ConfigPresets/Argentea/`).
