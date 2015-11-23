; =============================================================================
; TEMPLATES 
; =============================================================================

(deftemplate Lector
        (slot nombre (type STRING) (default ?DERIVE))
        (slot edad (type INTEGER) (range 1 120) (default 1))
        (slot sexo (type SYMBOL) (allowed-values hombre mujer IND) (default IND))
        (slot estudios (type SYMBOL) (allowed-values No_graduado_escolar CFGS Bachillerato Universidad IND) (default IND))
)

; =============================================================================
; MENSAJES
; =============================================================================

; No funciona ja que nomes es pot fer per CLASSES i no deftemplates!!!
;(defmessage-handler Lector imprimeLector primary ()
;  (printout t " Lector:  " ?self:nombre crlf)
;  (printout t " Lector:  " ?self:sexo crlf)
;  (printout t " Lector:  " ?self:edad crlf)
;  (printout t " Lector:  " ?self:estudios crlf) 
;)

; =============================================================================
; FUNCIONES
; =============================================================================

(deffunction pregunta-general (?pregunta) 
        (format t "%s" ?pregunta)
        (printout t crlf) 
        (bind ?respuesta (read)) 
        ?respuesta
)

(deffunction pregunta-numerica (?pregunta ?rangini ?rangfi)
        (format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
        (printout t crlf) 
        (bind ?respuesta (read))
        (while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
                (format t "%s [%d, %d] " ?pregunta ?rangini ?rangfi)
                (bind ?respuesta (read))
        )
        ?respuesta
)

; =============================================================================
; MAIN
; =============================================================================

(defmodule MAIN (export ?ALL))

(defrule comienzo "regla inicial"
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
        (assert (nuevo_lector))
        (focus recopilacion-usuario)           
)

; =============================================================================
; MODULO DE PREGUNTAS
; =============================================================================

;;; Modulo de recopilacion de los datos del usuario
(defmodule recopilacion-usuario
        (import MAIN ?ALL)
        (export ?ALL)
)

(defrule establecer-nombre "Establece el nombre de usuario, es la primera pregunta"
        (nuevo_lector)
        =>
        (bind ?nombre (pregunta-general "Como se llama?"))
        (assert (Lector (nombre ?nombre)))
        (assert (establecer-edad))
)

(defrule establecer-edad "Establece la edad del usuario"
        ?lector <- (Lector)
        ?flow <- (establecer-edad)
        =>
        (bind ?edad (pregunta-numerica "¿Que edad tiene? " 1 120))
        (modify ?lector (edad ?edad))
        (retract ?flow)
        (assert (establecer-sexo))
)

(defrule establecer-sexo "Establece el sexo del usuario"
        ?lector <- (Lector)
        ?flow <- (establecer-sexo)
        =>
        (bind ?sexo (pregunta-general "¿Es hombre(h) o mujer(m)?"))
        (switch ?sexo
          (case h then (modify ?lector (sexo hombre)))
          (case m then (modify ?lector (sexo mujer)))
        )
        (retract ?flow)
        (assert (establecer-estudios))
)

(defrule establecer-estudios "Establece los estudios del usuario"
        ?lector <- (Lector)
        ?flow <- (establecer-estudios)
        =>
        (bind ?estudios (pregunta-general 
          "¿Cual es tu ultimo titulo academico? No_graduado_escolar(1) CFGS(2) Bachillerato(3) Universidad(4)"))
        (switch ?estudios
          (case 1 then (modify ?lector (estudios No_graduado_escolar)))
          (case 2 then (modify ?lector (estudios CFGS)))
          (case 3 then (modify ?lector (estudios Bachillerato)))
          (case 4 then (modify ?lector (estudios Universidad)))
        )
        (retract ?flow)
        (assert (pasar-a-preferencias))
)       

(defrule pasar-a-preferencias "Pasa a la recopilacion de preferencias"
        (Lector (nombre ?nombre) (edad ?edad) (sexo ?sexo) (estudios ?estudios))
        (pasar-a-preferencias)
        =>
        (printout t " Lector:  " ?nombre crlf)
        (printout t " Lector:  " ?edad crlf)
        (printout t " Lector:  " ?sexo crlf)
        (printout t " Lector:  " ?estudios crlf)
        ;(focus octavi)
)

;(defmodule octavi
;        (import MAIN ?ALL)
;       (import recopilacion_usuario ?ALL)
;        (export ?ALL)
;)
