; =============================================================================
; MODULO DE REFINAMIENTO
; =============================================================================

(defmodule refinamiento
    (import MAIN ?ALL)
    (export ?ALL)
)

(defrule inicializar "Inicializa el deftemplate Ordenacion con todos los valores a 0"
    (declare (salience 1))
    (LibrosT (libros-possibles $?libros-possibles))
    =>
    (bind ?puntuaciones (create$))
    (loop-for-count (?i 1 (length ?libros-possibles)) do
        (bind ?puntuaciones (insert$ ?puntuaciones ?i 0))
    )
    (assert (Ordenacion (puntuaciones ?puntuaciones)))
    (assert (puntuar-autores))
)

(defrule puntuar-autores "Asigna una puntuacion a cada libro segun su autor"
    (Preferencias (autores-preferidos $?autores-preferidos))
    (LibrosT (libros-possibles $?libros-possibles))
    ?ord <- (Ordenacion (puntuaciones $?puntuaciones))
    ?flow <- (puntuar-autores)
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
    (modify ?ord (puntuaciones ?puntuaciones))
    (retract ?flow)
    (assert (puntuar-generos))
)

(defrule puntuar-generos "Asigna una puntuacion a cada libro segun su genero"
    (Preferencias (generos-preferidos $?generos-preferidos))
    (LibrosT (libros-possibles $?libros-possibles))
    ?ord <- (Ordenacion (puntuaciones $?puntuaciones))
    ?flow <- (puntuar-generos)
    =>
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?libro (nth$ ?i ?libros-possibles))
        (bind $?generos (send ?libro get-pertenece))
        (loop-for-count (?j 1 (length ?generos)) do
            (if (in-multislot (nth$ ?j ?generos) ?generos-preferidos) 
            then
            (bind ?ant (nth$ ?i ?puntuaciones))
            (bind ?act (+ ?ant 10))
            (bind ?puntuaciones (replace$ ?puntuaciones ?i ?i ?act))
            )
        )
    )
    (modify ?ord (puntuaciones ?puntuaciones))
    (retract ?flow)
    (assert (puntuar-temas))
)

(defrule puntuar-temas "Asigna una puntuacion a cada libro segun su tema"
    (Preferencias (temas-preferidos $?temas-preferidos))
    (LibrosT (libros-possibles $?libros-possibles))
    ?ord <- (Ordenacion (puntuaciones $?puntuaciones))
    ?flow <- (puntuar-temas)
    =>
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?libro (nth$ ?i ?libros-possibles))
        (bind $?temas (send ?libro get-trataSobre))
        (loop-for-count (?j 1 (length ?temas))
            (if (in-multislot (nth$ ?j ?temas) ?temas-preferidos) 
            then
            (bind ?ant (nth$ ?i ?puntuaciones))
            (bind ?act (+ ?ant 10))
            (bind ?puntuaciones (replace$ ?puntuaciones ?i ?i ?act))
            )
        )
    )
    (modify ?ord (puntuaciones ?puntuaciones))
    (retract ?flow)
    (assert (puntuar-nacionalidad))
)

(defrule puntuar-nacionalidad "Asigna una puntuacion a cada libro segun la nacionalidad del autor"
    (Lector (nacionalidad ?nacionalidad))
    (LibrosT (libros-possibles $?libros-possibles))
    ?ord <- (Ordenacion (puntuaciones $?puntuaciones))
    ?flow <- (puntuar-nacionalidad)
    =>
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?libro (nth$ ?i ?libros-possibles))
        (bind ?autor (send ?libro get-escritoPor))
        (bind ?origen (send ?autor get-tieneNacionalidad))
        (if (eq ?nacionalidad ?origen) 
            then
            (bind ?ant (nth$ ?i ?puntuaciones))
            (bind ?act (+ ?ant 10))
            (bind ?puntuaciones (replace$ ?puntuaciones ?i ?i ?act))    
        )
    )
    (modify ?ord (puntuaciones ?puntuaciones))
    (retract ?flow)
    (assert (puntuar-premios-autores))
)

(defrule puntuar-premios-autores "Asigna una puntuacion a cada libro segun los premios de su autor"
    (LibrosT (libros-possibles $?libros-possibles))
    ?ord <- (Ordenacion (puntuaciones $?puntuaciones))
    ?flow <- (puntuar-premios-autores)
    (PreguntasExtra (seguir-criticos ?si))
    (test (eq ?si si))
    =>
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?libro (nth$ ?i ?libros-possibles))
        (bind ?autor (send ?libro get-escritoPor))
        (bind ?premios (send ?autor get-nPremios))
        (bind ?ant (nth$ ?i ?puntuaciones))
        (bind ?act (+ ?ant ?premios))
        (bind ?puntuaciones (replace$ ?puntuaciones ?i ?i ?act)) 
    )
    (modify ?ord (puntuaciones ?puntuaciones))
    (retract ?flow)
    (assert (puntuar-premios-libros))
)

(defrule puntuar-premios-libros "Asigna una puntuacion a cada libro segun si ha sido premiado o no"
    (LibrosT (libros-possibles $?libros-possibles))
    ?ord <- (Ordenacion (puntuaciones $?puntuaciones))
    ?flow <- (puntuar-premios-libros)
    (PreguntasExtra (libro-desconocido ?no))
    (test (eq ?no no))
    =>
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?libro (nth$ ?i ?libros-possibles))
        (bind ?premio (send ?libro get-premios))
        (if ?premio then
            (bind ?ant (nth$ ?i ?puntuaciones))
            (bind ?act (+ ?ant 10))
            (bind ?puntuaciones (replace$ ?puntuaciones ?i ?i ?act)) 
        )
    )
    (modify ?ord (puntuaciones ?puntuaciones))
    (retract ?flow)
)

(defrule puntuar-libros-desconocidos "Asigna una puntuacion a cada libro segun si es desconocido"
    (LibrosT (libros-possibles $?libros-possibles))
    ?ord <- (Ordenacion (puntuaciones $?puntuaciones))
    ?flow <- (puntuar-premios-libros)
    (PreguntasExtra (libro-desconocido ?si))
    (test (eq ?si si))
    =>
    (loop-for-count (?i 1 (length$ ?libros-possibles)) do
        (bind ?libro (nth$ ?i ?libros-possibles))
        (bind ?premio (send ?libro get-premios))
        (if (not ?premio) then
            (bind ?ant (nth$ ?i ?puntuaciones))
            (bind ?act (+ ?ant 10))
            (bind ?puntuaciones (replace$ ?puntuaciones ?i ?i ?act)) 
        )
    )
    (modify ?ord (puntuaciones ?puntuaciones))
    (retract ?flow)
)
