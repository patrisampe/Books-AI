; Modulo de recopilacion de las prefencias literarias del lector
(defmodule preferencias-literarias
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule establecer-autores-preferidos "recopilacion de los autores preferidos del lector"
    ?preferencias <- (Preferencias) 
    =>
    (bind ?vectorAutores (pregunta-instancia "Indica tus autores preferidos" Autor get-nombre))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorAutores))
    (modify ?preferencias (autores-preferidos ?multislot))
    (assert (establecer-generos-preferidos))
)

(defrule establecer-generos-preferidos "recopilacion de los generos preferidos del lector"
    ?preferencias <- (Preferencias)
    ?flow <- (establecer-generos-preferidos)
    =>
    (bind ?vectorGeneros (pregunta-instancia "Indica tus generos preferidos" Genero get-nombreGenero))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorGeneros))
    (modify ?preferencias (generos-preferidos ?multislot))
    (retract ?flow)
    (assert (establecer-temas-preferidos))
)

(defrule establecer-temas-preferidos "recopilacion de los temas preferidos del lector"
    ?preferencias <- (Preferencias)
    ?flow <- (establecer-temas-preferidos)
    =>
    (bind ?vectorTemas (pregunta-instancia "Indica tus temas preferidos" Tema get-nombreTema))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorTemas))
    (modify ?preferencias (temas-preferidos ?multislot))
    (retract ?flow)
    (assert (establecer-autores-deseados))
)

(defrule establecer-autores-deseados "recopilacion de los autores deseados del lector"
    ?preferencias <- (Preferencias)
    ?flow <- (establecer-autores-deseados) 
    =>
    (bind ?vectorAutores (pregunta-instancia "Indica tus autores deseados" Autor get-nombre))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorAutores))
    (modify ?preferencias (autores-deseados ?multislot))
    (retract ?flow)
    (assert (establecer-generos-deseados))
)

(defrule establecer-generos-deseados "recopilacion de los generos deseados del lector"
    ?preferencias <- (Preferencias)
    ?flow <- (establecer-generos-deseados)
    =>
    (bind ?vectorGeneros (pregunta-instancia "Indica tus generos deseados" Genero get-nombreGenero))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorGeneros))
    (modify ?preferencias (generos-deseados ?multislot))
    (retract ?flow)
    (assert (establecer-temas-deseados))
)

(defrule establecer-temas-deseados "recopilacion de los temas deseados del lector"
    ?preferencias <- (Preferencias)
    ?flow <- (establecer-temas-deseados)
    =>
    (bind ?vectorTemas (pregunta-instancia "Indica tus temas deseados" Genero get-nombreGenero))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorTemas))
    (modify ?preferencias (temas-deseados ?multislot))
    (retract ?flow)
    (assert (pasar-a-otra-cosa))
)

(defrule pasar-a-otra-cosa "Pasa a la recopilacion de preferencias"
        ;(Preferencias) 
        ?flow <- (pasar-a-otra-cosa)
        =>
        (printout t "APARCAO" crlf)
        (retract ?flow)
        (focus MAIN)
)

(defmodule prohiciones-literarias
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule establecer-autores-prohibidos "recopilacion de los autores prohibidos del lector"
    ?prohiciones <- (Prohibiciones) 
    =>
    (bind ?vectorAutores (pregunta-instancia "Indica tus autores prohibidos" Autor get-nombre))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorAutores))
    (modify ?prohiciones (autores-prohibidos ?multislot))
    ;(assert (pasari-a-otra-cosa))
    (assert (establecer-generos-prohibidos))
)

(defrule establecer-generos-prohibidos "recopilacion de los generos prohibidos del lector"
    ?prohiciones <- (Prohibiciones) 
    ?flow <- (establecer-generos-prohibidos)
    =>
    (bind ?vectorGeneros (pregunta-instancia "Indica tus generos prohibidos" Genero get-nombreGenero))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorGeneros))
    (modify ?prohiciones (generos-prohibidos ?multislot))
    (retract ?flow)
    (assert (establecer-temas-prohibidos))
)


(defrule establecer-temas-prohibidos "recopilacion de los temas preferidos del lector"
    ?prohiciones <- (Prohibiciones) 
    ?flow <- (establecer-temas-prohibidos)
    =>
    (bind ?vectorTemas (pregunta-instancia "Indica tus temas prohibidos" Tema get-nombreTema))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorTemas))
    (modify ?prohiciones (temas-prohibidos ?multislot))
    (retract ?flow)
    (assert (nuevo-m))
)

(defrule nuevo-m "Pasa a la recopilacion de prohibidos"
        ;(Preferencias) 
        (Prohibiciones (autores-prohibidos ?autores-prohibidos) (generos-prohibidos ?generos-prohibidos) (temas-prohibidos ?temas-prohibidos))
        ?flow <- (nuevo-m)
        =>
        (printout t "Resumen Prohibiciones" crlf)
        (printout t " autores prohibidos: " ?autores-prohibidos crlf)
        (printout t " generos prohibidos: " ?generos-prohibidos crlf)
        (printout t " temas prohibidos: " ?temas-prohibidos crlf)
        (retract ?flow)
        (focus MAIN)
)
