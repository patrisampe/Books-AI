
; =============================================================================
; MODULO DE REGLAS DE ABSTRACCION
; =============================================================================

;Modulo de Reglas de Abstraccion

(defmodule reglas-abstraccion
    (import MAIN ?ALL)
    (export ?ALL)
)

; Categoria de edad del Lector
(defrule edad-nino "Categoriza la edad del lector"
    (Lector (edad ?edad))
    (test (<= ?edad 12))
    =>
    (assert (Edad nino)) 
)

(defrule edad-adolescente "Categoriza la edad del lector"
    (Lector (edad ?edad))
    (test (and (>= ?edad 13) (<= ?edad 16)))
    =>
    (assert (Edad adolescente))
)

(defrule edad-joven "Categoriza la edad del lector"
    (Lector (edad ?edad))
    (test (and (>= ?edad 17) (<= ?edad 25)))
    =>
    (assert (Edad joven))
)

(defrule edad-adulto "Categoriza la edad del lector"
    (Lector (edad ?edad))
    (test (and (>= ?edad 26) (<= ?edad 69)))
    =>
    (assert (Edad adulto))
)

(defrule edad-terceraEdad "Categoriza la edad del lector"
    (Lector (edad ?edad))
    (test (>= ?edad 70))
    =>
    (assert (Edad terceraEdad))
)

; Nivel de cultura del Lector
(defrule culturaBajo1
    (Lector(estudios No_graduado_escolar))
    =>
    (assert (Cultura Bajo))
)

(defrule culturaMedio1
    (or (Lector (estudios Bachillerato)) (Lector (estudios CFGS)))
    (Habitos (frecuencia ocasionalmente))
    =>
    (assert (Cultura Medio))
)

(defrule culturaAlto1
    (Lector (estudios Universidad))
    =>
    (assert (Cultura Alto))
)

(defrule culturaAlto2
    (or (Lector (estudios Bachillerato)) (Lector (estudios CFGS)))
    (Habitos (frecuencia diario))
    =>
    (assert (Cultura Alto))
)

(defrule culturaDefecto "Por defecto el nivel de cultura es medio"
    (declare (salience -1))
    (not (Cultura ?))
    =>
    (assert (Cultura Medio))
)

; Tipos de lectura
(defrule tipoLectura
    (declare (salience 1))
    =>
    (assert (Lectura ligera))
    (assert (Lectura normal))
    (assert (Lectura densa))
)

(defrule tipoLectura1
    (and (Habitos (lugar casa)) (Habitos (frecuencia cuando_se_puede)))
    ?densa <- (Lectura densa)
    =>
    (retract ?densa)
)

(defrule tipoLectura2
    (Habitos (lugar transporte_publico))
    ?densa <- (Lectura densa)
    =>
    (retract ?densa)
)

(defrule acabar
    (declare (salience -10))
    =>
    (focus MAIN)
)
