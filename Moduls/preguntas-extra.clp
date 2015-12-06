; =============================================================================
; MODULO DE PREGUNTAS EXTRA
; =============================================================================

; Modulo de recopilacion de las preguntas extra
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
        (assert (establecer-libro-premiado))
)

(defrule establecer-libro-premiado "Establece si el lector prefiere libros que hayan sido premiados"
        ?pextra <- (PreguntasExtra)
        ?flow <- (establecer-libro-premiado)
        =>
        (printout t "Le gusta que los libros tengan premios?" crlf)
        (bind ?res (pregunta-general "Si(1) No(2)"))
        (switch ?res
                (case 1 then (modify ?pextra (libro-premiado si)))
                (case 2 then (modify ?pextra (libro-premiado no)))
        )
        (retract ?flow)
        (focus MAIN)
)
