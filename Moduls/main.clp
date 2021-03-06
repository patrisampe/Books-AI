; =============================================================================
; MAIN
; =============================================================================

(defmodule MAIN (export ?ALL))

(defrule comienzo "regla inicial"
        (declare (salience 1))
        =>
        (printout t crlf)
        (printout t crlf)
        (printout t "--------------------------------------------------------" crlf)
        (printout t "------ SISTEMA EXPERTO DE RECOMENDACION DE LIBROS ------" crlf)
        (printout t "--------------------------------------------------------" crlf)
        (printout t crlf)
        (printout t "Bievenido a nuestro sistema!" crlf)
        (printout t "Le recomendaremos los libros mas adecuados para usted." crlf)
        (printout t "A continuacion, se le plantearan una serie de preguntas para conocerle mejor." crlf)
        (printout t crlf)
        (printout t crlf)        
)

(defrule focus-datos-lector
    (not (Lector))
    =>
    (assert (Lector))
    (assert (establecer-nombre))
    (focus datos-lector)
)

(defrule focus-habitos-lector
    (Lector)
    (not (Habitos))
    =>
    (assert (Habitos))
    (assert (establecer-lugar))
    (focus habitos-lector)
)

(defrule focus-preferencias-lector
    (Lector)
    (Habitos)
    (not (Preferencias))
    =>
    (assert(Preferencias))
    (assert (establecer-autores-preferidos))   
    (focus preferencias-literarias)
)

(defrule focus-prohibiciones-lector
        (Lector)
        (Habitos)
        (Preferencias)
        (not (Prohibiciones))
        =>
        (assert (Prohibiciones))
        (assert (establecer-autores-prohibidos))
        (focus prohibiciones-literarias)
)

(defrule focus-preguntas-extra
        (Lector)
        (Habitos)
        (Preferencias)
        (Prohibiciones)
        (not (PreguntasExtra))
        =>
        (assert (PreguntasExtra))
        (assert (establecer-seguir-criticos))
        (focus preguntas-extra)
)

(defrule focus-reglas-abstraccion
        (Lector)
        (Habitos)
        (Preferencias)
        (Prohibiciones)
        (not (Edad ?))
        =>
        (focus reglas-abstraccion)
)


(defrule focus-possibles-recomendaciones
        (Lector)
        (Habitos)
        (Preferencias)
        (Prohibiciones)
        (Edad ?)
        (Cultura ?)
        (Lectura ?)
        (not (LibrosT))
        =>
        ;(printout t "Resumen HOOLAAA Possibles" crlf crlf)
        (assert (LibrosT))
       ; (assert (establecer-libros))
        (focus possibles-recomendaciones)
)

(defrule focus-refinamiento
    (Lector)
    (Habitos)
    (Preferencias)
    (LibrosT)
    (PreguntasExtra)
    =>
    (focus refinamiento)
)

(defrule focus-recomendacion
    (LibrosT)
    (Ordenacion)
    (PreguntasExtra)
    =>
    (focus recomendacion)
)
