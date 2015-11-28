; Modulo de recopilacion de las prefencias literarias del lector
(defmodule preferencias-literarias
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule establecer-autores-preferidos "recopilacion de los autores preferidos del lector"
    ?preferencias <- (Preferencias)
    ?flow <- (establecer-autores-preferidos) 
    =>
    (bind ?vectorAutores (pregunta-instancia "Indica tus autores preferidos" Autor get-nombre))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorAutores))
    (modify ?preferencias (autores-preferidos ?multislot))
    (retract ?flow)
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
    (bind ?vectorTemas (pregunta-instancia "Indica tus temas deseados" Tema get-nombreTema))
    (bind ?lista (pregunta-lista "Escribe los identificadores separados por espacios: " crlf))
    (bind ?multislot (rellena-multislot ?lista ?vectorTemas))
    (modify ?preferencias (temas-deseados ?multislot))
    (retract ?flow)
    (assert (fin-modulo))
)

(defrule fin-modulo "Fin de modulo"
        (Preferencias
                (autores-preferidos $?autores-preferidos)
                (generos-preferidos $?generos-preferidos)
                (temas-preferidos $?temas-preferidos)
                (autores-deseados $?autores-deseados)
                (generos-deseados $?generos-deseados)
                (temas-deseados $?temas-deseados)) 
        ?flow <- (fin-modulo)
        =>
        (printout t "Resumen preferencias" crlf crlf)
        (print-multislot "Autores preferidos:" ?autores-preferidos get-nombre)
        (print-multislot "Generos preferidos:" ?generos-preferidos get-nombreGenero)
        (print-multislot "Temas preferidos:" ?temas-preferidos get-nombreTema)
        (print-multislot "Autores deseados:" ?autores-deseados get-nombre)
        (print-multislot "Generos deseados:" ?generos-deseados get-nombreGenero)
        (print-multislot "Temas deseados:" ?temas-deseados get-nombreTema)
        (retract ?flow)
        (focus MAIN)
)
