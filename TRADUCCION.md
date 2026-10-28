# Guía de traducción — [MRP]Argentea Station

Idioma: español latino neutro (`es-419`). Los textos van en `Resources/Locale/es-419/`,
con la misma ruta y nombre de archivo que el original en `Resources/Locale/en-US/`.
Lo que no esté traducido se muestra en inglés automáticamente.

## Estilo

- Tuteo ("tú", "puedes", "tienes"). Nada de voseo ni de "vosotros".
- Español neutro: "computadora", "celular", "agarrar", "botón", "estación". Evitar regionalismos fuertes
  (decisión del dueño del servidor, 2026-10-28). Ni rioplatenses ni mexicanismos marcados:

  | Evitar | Usar |
  |---|---|
  | frutilla, lavandina, lapicera, bife, chupetín, lavarropas | fresa, cloro, bolígrafo, filete, paleta, lavadora |
  | galera, remera, musculosa, manteca, barbijo, vincha | sombrero de copa, camiseta, camiseta sin mangas, mantequilla, cubrebocas, diadema |
  | trucho, berreta, bordó, tiradores, volados, chiches, yapa | falso, barato, granate, tirantes, volantes, juguetes/adornos, de regalo |
  | pay, chícharo, jitomate, papalote | tarta, guisante, tomate, cometa |
- Frases naturales, no traducción palabra por palabra. Mantener el tono del original
  (serio en anuncios oficiales, informal o gracioso donde el original lo es).
- Mayúsculas al estilo español: solo la primera palabra de títulos y botones
  ("Unirse a servidor público", no "Unirse A Servidor Público").
- Signos de apertura: "¿...?" y "¡...!".

## Jerga que queda en inglés

La comunidad usa estos términos en inglés; no se traducen:

| Término | Uso |
|---|---|
| shuttle | "el shuttle de emergencia", "el shuttle de llegadas" |
| antag, antags | antagonistas como rol de juego |
| traitor | rol de traidor ("eres un traitor") |
| nukie, Nuclear Operative | operativos nucleares |
| changeling, ling | |
| borg, cyborg | |
| crit | "estás en crit" |
| gib, gibear | |
| SSD | jugador desconectado |
| OOC, LOOC, IC, AHelp, admin | |
| PDA, ID | "tu PDA", "la ID" (tarjeta de identificación) |
| Nanotrasen, Syndicate, CentCom | nombres propios de facciones |
| round / ronda | se usa "ronda" |

## Términos que sí se traducen

| Inglés | Español |
|---|---|
| Station | Estación |
| crew | tripulación |
| shift | turno |
| Captain | Capitán |
| Head of Personnel (HoP) | Jefe de Personal |
| Head of Security (HoS) | Jefe de Seguridad |
| Chief Engineer | Ingeniero Jefe |
| Chief Medical Officer | Director Médico |
| Research Director | Director de Investigación |
| Quartermaster | Intendente |
| Security / Engineering / Medical / Science / Cargo / Service | Seguridad / Ingeniería / Medicina / Ciencia / Carga / Servicio |
| Security Officer | Oficial de Seguridad |
| Warden | Alcaide |
| Detective | Detective |
| Engineer / Atmospheric Technician | Ingeniero / Técnico atmosférico |
| Doctor / Chemist / Paramedic | Médico / Químico / Paramédico |
| Scientist | Científico |
| Cargo Technician / Salvage Specialist | Técnico de carga / Especialista en salvamento |
| Janitor / Chef / Bartender / Botanist / Clown / Mime | Conserje / Chef / Bartender / Botánico / Payaso / Mimo |
| Chaplain / Librarian / Lawyer / Passenger | Capellán / Bibliotecario / Abogado / Pasajero |
| ghost | fantasma |
| job | trabajo |
| role | rol |
| character | personaje |
| species | especie |
| ready | listo |
| lobby | lobby |
| emergency | emergencia |
| alert level | nivel de alerta |
| airlock / door | esclusa / puerta |
| health | salud |
| damage | daño |
| inventory / hand / pocket | inventario / mano / bolsillo |
| jumpsuit / jumpskirt | overol / overol con falda |
| Brigmedic | médico de brig |
| canister (de gas) | bombona |
| crate | cajón |
| windoor | puerta-ventana |
| flashbang | granada cegadora |
| hardsuit | traje rígido |

## Nombres y descripciones de objetos

Los textos de objetos salen de los prototipos YAML (`Tools/argentea/EntLoc/EntLoc.cs`) y se
traducen como lista de textos únicos; el mismo texto se usa en todos los objetos que lo comparten.

- **Nombres en minúscula**, como en el original ("assistant headset" → "auriculares de asistente"),
  salvo nombres propios, siglas y marcas ("CentCom", "PDA", "Nanotrasen").
- Orden natural del español: sustantivo + complemento ("medical belt" → "cinturón médico",
  "box of donk-pockets" → "caja de donk-pockets").
- Nombres de marcas, modelos y productos inventados no se traducen ("Donk Co.", "Robust Softdrinks",
  "M90gl", "C-20r"); sí se traduce la parte descriptiva ("C-20r submachine gun" → "subfusil C-20r").
- Jerga y siglas del juego como en el glosario (PDA, ID, borg, shuttle, uplink, hardsuit → traje rígido).
- Los **sufijos** (`suffix`) son etiquetas para admins y mapeadores ("Filled", "Empty", "DO NOT MAP",
  "Admeme"): traducirlos de forma corta ("Lleno", "Vacío", "NO MAPEAR"); dejar igual los que son
  nombres propios, siglas o códigos ("ERT", "Syndicate", "T3").
- Las descripciones conservan el tono (muchas son chistes): adaptar el chiste antes que traducirlo literal.
- Conservar igual etiquetas de formato (`[color=red]...[/color]`) y signos `{ } [ ]`.

## Reglas técnicas (obligatorias)

Los archivos son [Fluent](https://projectfluent.org/fluent/guide/) (`.ftl`). Un error de formato
puede romper el texto en el juego, así que:

1. **No cambiar claves.** Todo lo que está antes del `=` (y los atributos `.desc`, `.suffix`, etc.)
   queda idéntico. Mismo orden, mismas claves, ni una de más ni de menos.
2. **No traducir variables.** `{ $name }`, `{$amount}`, `{ $user }` quedan igual.
3. **Selectores:** traducir solo el texto de cada rama. Los nombres de rama (`[one]`, `[other]`,
   `[male]`, `[female]`, `[epicene]`, `[1]`, `*[other]`) quedan igual, incluido el `*` de la rama por defecto.
4. **Funciones y referencias:** `PRESSURE(...)`, `CAPITALIZE(...)`, `{ -term }`, `{ message-id }`
   quedan igual. Gramática en español (definida en `es-419/_engine_lib.ftl`):
   - `THE($x)` devuelve **solo el nombre, sin artículo**. Conservar `THE`/`CAPITALIZE(THE(...))` donde
     estén, pero no agregar "el"/"la" delante (el género del objeto es desconocido). Si la frase lo
     necesita, reformular: "{ CAPITALIZE(THE($item)) } se rompe" o "Se rompió: { THE($item) }".
   - `SUBJECT($x)` = él/ella/elle/eso; `OBJECT($x)` = lo/la/le/lo; `POSS-ADJ($x)` = su;
     `REFLEXIVE($x)` = sí mismo/sí misma/sí misme.
   - `CONJUGATE-BE`, `CONJUGATE-HAVE` y `CONJUGATE-BASIC` no sirven en español: **quitarlas y escribir el
     verbo directamente** en tercera persona ("está", "tiene", "abre").
   - Para adjetivos que dependen del género de una persona, usar un selector:
     `{ GENDER($user) -> [female] aturdida [epicene] aturdide *[other] aturdido }`.
     Si no hace falta, preferir frases sin género ("queda sin sentido").
5. **Etiquetas de formato:** `[color=red]...[/color]`, `[bold]`, `[font size=..]`, `[head=2]`, etc.
   quedan igual; solo se traduce el texto entre ellas.
6. **Sangría y saltos de línea:** las líneas de continuación de un mensaje multilínea van sangradas
   igual que en el original. **Una línea de continuación no puede empezar con `[`, `*` ni `.`**
   (Fluent la confunde con un selector o un atributo y el archivo entero deja de cargar). Si al
   traducir una línea queda empezando con `[color=...]`, agregar una palabra antes ("Tú [color=pink]PUEDES[/color]...").
9. Antes de dar por terminado un archivo, pasarle el validador
   `Tools/argentea/validar-traduccion.ps1` y dejarlo en 0 problemas.
7. **Comentarios** (`#`) se pueden traducir o dejar; no afectan al juego.
8. Nombres propios (de personas, de arte, de canciones, marcas del juego) no se traducen.
