; =============================================================================
; MODULO DE PREGUNTAS: PREGUNTAS EXTRA
; =============================================================================

(defmodule preguntas-extra
        (import MAIN ?ALL)
        (export ?ALL)
)

(defrule establecer-seguir-criticos "Establece si el lector prefiere libros de autores premiados"
        ?pextra <- (PreguntasExtra)
        ?flow <- (establecer-seguir-criticos)
        =>
        (printout t "Le gusta seguir la opinion de los criticos, ")
        (printout t "es decir prefieres a los autores con muchos premios?" crlf)
        (bind ?res (pregunta-general "Si(1) No(2)"))
        (switch ?res
                (case 1 then (modify ?pextra (seguir-criticos si)))
                (case 2 then (modify ?pextra (seguir-criticos no)))
        )
        (retract ?flow)
        (assert (establecer-libro-desconocido))
)

(defrule establecer-libro-desconocido "Establece si el lector prefiere libros que no hayan sido premiados"
        ?pextra <- (PreguntasExtra)
        ?flow <- (establecer-libro-desconocido)
        =>
        (printout t "Le gusta que los libros sean desconocidos, es decir que no tengan premios?" crlf)
        (bind ?res (pregunta-general "Si(1) No(2)"))
        (switch ?res
                (case 1 then (modify ?pextra (libro-desconocido si)))
                (case 2 then (modify ?pextra (libro-desconocido no)))
        )
        (retract ?flow)
        (focus MAIN)
)
