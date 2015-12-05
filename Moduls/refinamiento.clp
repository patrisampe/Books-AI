(defmodule refinamiento
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule inicializar
    (declare (salience 1))
    (LibrosT (libros-possibles $?libros-possibles))
    =>
    (bind ?puntuaciones (create$))
    (loop-for-count (?i 1 (length ?libros-possibles)) do
        (bind ?puntuaciones (insert$ ?puntuaciones ?i 0))
    )
    (assert (Ordenacion (puntuaciones ?puntuaciones)))
)

(defrule puntuar-autores "Asigna una puntuacion a cada libro segun su autor"
    (Preferencias (autores-preferidos $?autores-preferidos))
    (LibrosT (libros-possibles $?libros-possibles))
    (Ordenacion (puntuaciones $?puntuaciones))
    =>
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?libro (nth$ ?i ?libros-possibles))
        (bind ?autor (send ?libro get-escritoPor))
        (if (in-multislot ?autor ?autores-preferidos) 
            then
            (bind ?ant (nth$ ?i ?puntuaciones))
            (bind ?act (+ ?ant 10))
            (bind ?puntuaciones (replace$ ?puntuaciones ?i ?i ?act))
        )
    )
)

(defrule puntuar-generos "Asigna una puntuacion a cada libro segun su genero"
    (Preferencias (generos-preferidos $?generos-preferidos))
    (LibrosT (libros-possibles $?libros-possibles))
    (Ordenacion (puntuaciones $?puntuaciones))
    =>
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?libro (nth$ ?i ?libros-possibles))
        (bind ?genero (send ?libro get-pertenece))
        (if (in-multislot ?genero ?generos-preferidos) 
            then
            (bind ?ant (nth$ ?i ?puntuaciones))
            (bind ?act (+ ?ant 10))
            (bind ?puntuaciones (replace$ ?puntuaciones ?i ?i ?act))
        )
    )
)

(defrule puntuar-temas "Asigna una puntuacion a cada libro segun su tema"
    (Preferencias (temas-preferidos $?temas-preferidos))
    (LibrosT (libros-possibles $?libros-possibles))
    (Ordenacion (puntuaciones $?puntuaciones))
    =>
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?libro (nth$ ?i ?libros-possibles))
        (bind ?tema (send ?libro get-trataSobre))
        (if (in-multislot ?tema ?temas-preferidos) 
            then
            (bind ?ant (nth$ ?i ?puntuaciones))
            (bind ?act (+ ?ant 10))
            (bind ?puntuaciones (replace$ ?puntuaciones ?i ?i ?act))
        )
    )
)
