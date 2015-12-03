; Modulo de recopilacion de las prohibiciones literarias del lector
(defmodule prohibiciones-literarias
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule establecer-autores-prohibidos "recopilacion de los autores prohibidos del lector"
    ?prohiciones <- (Prohibiciones)
    (Preferencias (autores-deseados $?deseos))
    ?flow <- (establecer-autores-prohibidos) 
    =>
    (bind ?vectorAutores 
        (pregunta-instancia-prohibicion "Indica tus autores prohibidos" Autor get-nombre ?deseos)
    )
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorAutores))
    (modify ?prohiciones (autores-prohibidos ?multislot))
    (retract ?flow)
    (assert (establecer-generos-prohibidos))
)

(defrule establecer-generos-prohibidos "recopilacion de los generos prohibidos del lector"
    ?prohiciones <- (Prohibiciones)
    (Preferencias (generos-deseados $?deseos)) 
    ?flow <- (establecer-generos-prohibidos)
    =>
    (bind ?vectorGeneros 
        (pregunta-instancia-prohibicion "Indica tus generos prohibidos" Genero get-nombreGenero ?deseos)
    )
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorGeneros))
    (modify ?prohiciones (generos-prohibidos ?multislot))
    (retract ?flow)
    (assert (establecer-temas-prohibidos))
)


(defrule establecer-temas-prohibidos "recopilacion de los temas preferidos del lector"
    ?prohiciones <- (Prohibiciones)
    (Preferencias (temas-deseados $?deseos)) 
    ?flow <- (establecer-temas-prohibidos)
    =>
    (bind ?vectorTemas
        (pregunta-instancia-prohibicion "Indica tus temas prohibidos" Tema get-nombreTema ?deseos)
    )
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorTemas))
    (modify ?prohiciones (temas-prohibidos ?multislot))
    (retract ?flow)
    (assert (fin-modulo))
)

(defrule fin-modulo "Fin del modulo"
        (Prohibiciones 
                (autores-prohibidos $?autores-prohibidos) 
                (generos-prohibidos $?generos-prohibidos) 
                (temas-prohibidos $?temas-prohibidos))
        ?flow <- (fin-modulo)
        =>
        (printout t "Resumen Prohibiciones" crlf crlf)
        (print-multislot "Autores prohibidos:" ?autores-prohibidos get-nombre)
        (print-multislot "Generos prohibidos:" ?generos-prohibidos get-nombreGenero)
        (print-multislot "Temas prohibidos:" ?temas-prohibidos get-nombreTema)
        (retract ?flow)
        (focus MAIN)
)
