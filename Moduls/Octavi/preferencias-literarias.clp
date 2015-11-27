; Modulo de recopilacion de las prefencias literarias del lector
(defmodule preferencias-literarias
        (import MAIN ?ALL)
        (export ?ALL)
)

(defrule establecer-generos-preferidos
        (nuevo-lector)
        =>
        (bind ?generos-preferidos (pregunta-lista 
                "Esbribe los numeros de sus generos preferidos
                Separarelos por espacios:"))
        ?pref <- (Preferencias-literarias)
        (progn$ (?it ?generos-preferidos)
                (switch ?it
                        (case 1 then (assert(Programacion)))
                        (case 2 then (assert(IngenieriaSoftware)))
                        (case 3 then (assert(BasesDatos)))
                        (case 4 then (assert(Redes)))
                        (case 5 then (assert(ArquitecturaComputadores)))
                        (case 6 then (assert(Matematicas)))
                        (case 7 then (assert(Fisica))) 
                )
        )
)