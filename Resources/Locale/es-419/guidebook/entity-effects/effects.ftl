-create-3rd-person =
    { $chance ->
        [1] Crea
        *[other] crear
    }

-cause-3rd-person =
    { $chance ->
        [1] Causa
        *[other] causar
    }

-satiate-3rd-person =
    { $chance ->
        [1] Sacia
        *[other] saciar
    }

entity-effect-guidebook-spawn-entity =
    { $chance ->
        [1] Crea
        *[other] crear
    } { $amount ->
        [1] 1 {$entname}
        *[other] {$amount} {MAKEPLURAL($entname)}
    }

entity-effect-guidebook-destroy =
    { $chance ->
        [1] Destruye
        *[other] destruir
    } el objeto

entity-effect-guidebook-break =
    { $chance ->
        [1] Rompe
        *[other] romper
    } el objeto

entity-effect-guidebook-explosion =
    { $chance ->
        [1] Causa
        *[other] causar
    } una explosión

entity-effect-guidebook-emp =
    { $chance ->
        [1] Causa
        *[other] causar
    } un pulso electromagnético

entity-effect-guidebook-flash =
    { $chance ->
        [1] Causa
        *[other] causar
    } un destello cegador

entity-effect-guidebook-foam-area =
    { $chance ->
        [1] Crea
        *[other] crear
    } grandes cantidades de espuma

entity-effect-guidebook-smoke-area =
    { $chance ->
        [1] Crea
        *[other] crear
    } grandes cantidades de humo

entity-effect-guidebook-satiate-thirst =
    { $chance ->
        [1] Sacia
        *[other] saciar
    } { $relative ->
        [1] la sed a un ritmo promedio
        *[other] la sed a {NATURALFIXED($relative, 3)}x el ritmo promedio
    }

entity-effect-guidebook-satiate-hunger =
    { $chance ->
        [1] Sacia
        *[other] saciar
    } { $relative ->
        [1] el hambre a un ritmo promedio
        *[other] el hambre a {NATURALFIXED($relative, 3)}x el ritmo promedio
    }

entity-effect-guidebook-health-change =
    { $chance ->
        [1] { $healsordeals ->
                [heals] Cura
                [deals] Inflige
                *[both] Modifica la salud en
             }
        *[other] { $healsordeals ->
                    [heals] curar
                    [deals] infligir
                    *[both] modificar la salud en
                 }
    } { $changes }

entity-effect-guidebook-even-health-change =
    { $chance ->
        [1] { $healsordeals ->
            [heals] Cura de forma pareja
            [deals] Inflige de forma pareja
            *[both] Modifica la salud de forma pareja en
        }
        *[other] { $healsordeals ->
            [heals] curar de forma pareja
            [deals] infligir de forma pareja
            *[both] modificar la salud de forma pareja en
        }
    } { $changes }

entity-effect-guidebook-status-effect-old =
    { $type ->
        [update]{ $chance ->
                    [1] Causa
                     *[other] causar
                 } {LOC($key)} durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)} sin acumulación
        [add]   { $chance ->
                    [1] Causa
                    *[other] causar
                } {LOC($key)} durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)} con acumulación
        [set]  { $chance ->
                    [1] Causa
                    *[other] causar
                } {LOC($key)} durante {NATURALFIXED($time, 3)} {MANY("segundo", $time)} sin acumulación
        *[remove]{ $chance ->
                    [1] Quita
                    *[other] quitar
                } {NATURALFIXED($time, 3)} {MANY("segundo", $time)} de {LOC($key)}
    }

entity-effect-guidebook-status-effect =
    { $type ->
        [update]{ $chance ->
                    [1] Causa
                    *[other] causar
                 } {$key} durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)} sin acumulación
        [add]   { $chance ->
                    [1] Causa
                    *[other] causar
                } {$key} durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)} con acumulación
        [set]  { $chance ->
                    [1] Causa
                    *[other] causar
                } {$key} durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)} sin acumulación
        *[remove]{ $chance ->
                    [1] Quita
                    *[other] quitar
                } {NATURALFIXED($time, 3)} {MANY("segundo", $time)} de {$key}
    } { $delay ->
        [0] inmediatamente
        *[other] después de una demora de {NATURALFIXED($delay, 3)} segundos
    }

entity-effect-guidebook-status-effect-indef =
    { $type ->
        [update]{ $chance ->
                    [1] Causa
                    *[other] causar
                 } {$key} permanente
        [add]   { $chance ->
                    [1] Causa
                    *[other] causar
                } {$key} permanente
        [set]  { $chance ->
                    [1] Causa
                    *[other] causar
                } {$key} permanente
        *[remove]{ $chance ->
                    [1] Quita
                    *[other] quitar
                } {$key}
    } { $delay ->
        [0] inmediatamente
        *[other] después de una demora de {NATURALFIXED($delay, 3)} segundos
    }

entity-effect-guidebook-knockdown =
    { $type ->
        [update]{ $chance ->
                    [1] Causa
                    *[other] causar
                    } {LOC($key)} durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)} sin acumulación
        [add]   { $chance ->
                    [1] Causa
                    *[other] causar
                } derribo durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)} con acumulación
        *[set]  { $chance ->
                    [1] Causa
                    *[other] causar
                } derribo durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)} sin acumulación
        [remove]{ $chance ->
                    [1] Quita
                    *[other] quitar
                } {NATURALFIXED($time, 3)} {MANY("segundo", $time)} de derribo
    }

entity-effect-guidebook-set-solution-temperature-effect =
    { $chance ->
        [1] Establece
        *[other] establecer
    } la temperatura de la solución en exactamente {NATURALFIXED($temperature, 2)}k

entity-effect-guidebook-adjust-solution-temperature-effect =
    { $chance ->
        [1] { $deltasign ->
                [1] Agrega
                *[-1] Quita
            }
        *[other]
            { $deltasign ->
                [1] agregar
                *[-1] quitar
            }
    } calor a la solución hasta que alcance { $deltasign ->
                [1] como máximo {NATURALFIXED($maxtemp, 2)}k
                *[-1] como mínimo {NATURALFIXED($mintemp, 2)}k
            }

entity-effect-guidebook-adjust-reagent-reagent =
    { $chance ->
        [1] { $deltasign ->
                [1] Agrega
                *[-1] Quita
            }
        *[other]
            { $deltasign ->
                [1] agregar
                *[-1] quitar
            }
    } {NATURALFIXED($amount, 2)}u de {$reagent} { $deltasign ->
        [1] a
        *[-1] de
    } la solución

entity-effect-guidebook-adjust-reagent-group =
    { $chance ->
        [1] { $deltasign ->
                [1] Agrega
                *[-1] Quita
            }
        *[other]
            { $deltasign ->
                [1] agregar
                *[-1] quitar
            }
    } {NATURALFIXED($amount, 2)}u de reactivos del grupo {$group} { $deltasign ->
            [1] a
            *[-1] de
        } la solución

entity-effect-guidebook-adjust-temperature =
    { $chance ->
        [1] { $deltasign ->
                [1] Agrega
                *[-1] Quita
            }
        *[other]
            { $deltasign ->
                [1] agregar
                *[-1] quitar
            }
    } {POWERJOULES($amount)} de calor { $deltasign ->
            [1] al
            *[-1] del
        } cuerpo en el que está

entity-effect-guidebook-chem-cause-disease =
    { $chance ->
        [1] Causa
        *[other] causar
    } la enfermedad { $disease }

entity-effect-guidebook-chem-cause-random-disease =
    { $chance ->
        [1] Causa
        *[other] causar
    } las enfermedades { $diseases }

entity-effect-guidebook-jittering =
    { $chance ->
        [1] Causa
        *[other] causar
    } temblores

entity-effect-guidebook-clean-bloodstream =
    { $chance ->
        [1] Limpia
        *[other] limpiar
    } el torrente sanguíneo de otros químicos

entity-effect-guidebook-cure-disease =
    { $chance ->
        [1] Cura
        *[other] curar
    } enfermedades

entity-effect-guidebook-eye-damage =
    { $chance ->
        [1] { $deltasign ->
                [1] Inflige
                *[-1] Cura
            }
        *[other]
            { $deltasign ->
                [1] infligir
                *[-1] curar
            }
    } daño ocular

entity-effect-guidebook-vomit =
    { $chance ->
        [1] Causa
        *[other] causar
    } vómitos

entity-effect-guidebook-create-gas =
    { $chance ->
        [1] Crea
        *[other] crear
    } { $moles } { $moles ->
        [1] mol
        *[other] moles
    } de { $gas }

entity-effect-guidebook-drunk =
    { $chance ->
        [1] Causa
        *[other] causar
    } ebriedad

entity-effect-guidebook-electrocute =
    { $chance ->
        [1] { $stuns ->
            [true] Electrocuta
            *[false] Da una descarga
            }
        *[other] { $stuns ->
            [true] electrocutar
            *[false] dar una descarga
            }
    } al metabolizador durante {NATURALFIXED($time, 3)} {MANY("segundo", $time)}

entity-effect-guidebook-emote =
    { $chance ->
        [1] Obligará
        *[other] obligar
    } al metabolizador a [bold][color=white]{$emote}[/color][/bold]

entity-effect-guidebook-extinguish-reaction =
    { $chance ->
        [1] Extingue
        *[other] extinguir
    } el fuego

entity-effect-guidebook-flammable-reaction =
    { $chance ->
        [1] Aumenta
        *[other] aumentar
    } la inflamabilidad

entity-effect-guidebook-ignite =
    { $chance ->
        [1] Prende fuego
        *[other] prender fuego
    } al metabolizador

entity-effect-guidebook-make-sentient =
    { $chance ->
        [1] Vuelve
        *[other] volver
    } consciente al metabolizador

entity-effect-guidebook-make-polymorph =
    { $chance ->
        [1] Transforma
        *[other] transformar
    } al metabolizador en { $entityname }

entity-effect-guidebook-modify-bleed-amount =
    { $chance ->
        [1] { $deltasign ->
                [1] Provoca
                *[-1] Reduce
            }
        *[other] { $deltasign ->
                    [1] provocar
                    *[-1] reducir
                 }
    } el sangrado

entity-effect-guidebook-modify-blood-level =
    { $chance ->
        [1] { $deltasign ->
                [1] Aumenta
                *[-1] Disminuye
            }
        *[other] { $deltasign ->
                    [1] aumentar
                    *[-1] disminuir
                 }
    } el nivel de sangre

entity-effect-guidebook-paralyze =
    { $chance ->
        [1] Paraliza
        *[other] paralizar
    } al metabolizador durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)}

entity-effect-guidebook-movespeed-modifier =
    { $chance ->
        [1] Modifica
        *[other] modificar
    } la velocidad de movimiento en {NATURALFIXED($sprintspeed, 3)}x durante al menos {NATURALFIXED($time, 3)} {MANY("segundo", $time)}

entity-effect-guidebook-reset-narcolepsy =
    { $chance ->
        [1] Contiene temporalmente
        *[other] contener temporalmente
    } la narcolepsia

entity-effect-guidebook-wash-cream-pie-reaction =
    { $chance ->
        [1] Lava
        *[other] lavar
    } el pastel de crema de la cara

entity-effect-guidebook-cure-zombie-infection =
    { $chance ->
        [1] Cura
        *[other] curar
    } una infección zombi en curso

entity-effect-guidebook-cause-zombie-infection =
    { $chance ->
        [1] Contagia
        *[other] contagiar
    } la infección zombi a un individuo

entity-effect-guidebook-innoculate-zombie-infection =
    { $chance ->
        [1] Cura
        *[other] curar
    } una infección zombi en curso y da inmunidad contra futuras infecciones

entity-effect-guidebook-reduce-rotting =
    { $chance ->
        [1] Regenera
        *[other] regenerar
    } {NATURALFIXED($time, 3)} {MANY("segundo", $time)} de putrefacción

entity-effect-guidebook-area-reaction =
    { $chance ->
        [1] Causa
        *[other] causar
    } una reacción de humo o espuma durante {NATURALFIXED($duration, 3)} {MANY("segundo", $duration)}

entity-effect-guidebook-add-to-solution-reaction =
    { $chance ->
        [1] Hace
        *[other] hacer
    } que se agregue {$reagent} a su contenedor de solución interno

entity-effect-guidebook-artifact-unlock =
    { $chance ->
        [1] Ayuda a
        *[other] ayudar a
        } desbloquear un artefacto alienígena.

entity-effect-guidebook-artifact-durability-restore =
    Restaura {$restored} de durabilidad en los nodos activos de artefactos alienígenas.

entity-effect-guidebook-plant-attribute =
    { $chance ->
        [1] Ajusta
        *[other] ajustar
    } {$attribute} en {$positive ->
    [true] [color=red]{$amount}[/color]
    *[false] [color=green]{$amount}[/color]
    }

entity-effect-guidebook-plant-cryoxadone =
    { $chance ->
        [1] Rejuvenece
        *[other] rejuvenecer
    } la planta, según su edad y su tiempo de crecimiento

entity-effect-guidebook-plant-phalanximine =
    { $chance ->
        [1] Restaura
        *[other] restaurar
    } la viabilidad de una planta que una mutación volvió inviable

entity-effect-guidebook-plant-diethylamine =
    { $chance ->
        [1] Aumenta
        *[other] aumentar
    } la vida útil y/o la salud base de la planta, con un 10% de probabilidad para cada una

entity-effect-guidebook-plant-robust-harvest =
    { $chance ->
        [1] Aumenta
        *[other] aumentar
    } la potencia de la planta en {$increase} hasta un máximo de {$limit}. Hace que la planta pierda sus semillas cuando la potencia llega a {$seedlesstreshold}. Intentar agregar potencia por encima de {$limit} puede reducir el rendimiento con un 10% de probabilidad

entity-effect-guidebook-plant-seeds-add =
    { $chance ->
        [1] Restaura las
        *[other] restaurar las
    } semillas de la planta

entity-effect-guidebook-plant-seeds-remove =
    { $chance ->
        [1] Quita las
        *[other] quitar las
    } semillas de la planta

entity-effect-guidebook-plant-change-trait =
    { $chance ->
        [1] { $change ->
            [Add] agrega {$trait} a
            [Remove] quita {$trait} de
            [Toggle] alterna {$trait} en
            *[other] cambia {$trait} en
        }
        *[other] { $change ->
            [Add] agregar {$trait} a
            [Remove] quitar {$trait} de
            [Toggle] alternar {$trait} en
            *[other] cambiar {$trait} en
        }
    } la planta

entity-effect-guidebook-plant-mutate-exude-gasses =
    { $chance ->
        [1] Muta
        *[other] mutar
    } la planta para que emita gases entre {$minValue} y {$maxValue} moles

entity-effect-guidebook-plant-mutate-consume-gasses =
    { $chance ->
        [1] Muta
        *[other] mutar
    } la planta para que consuma gases entre {$minValue} y {$maxValue} moles

entity-effect-guidebook-plant-mutate-chemicals =
    { $chance ->
        [1] Muta
        *[other] mutar
    } una planta para que produzca {$name}
