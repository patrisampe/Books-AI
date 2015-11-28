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


(deffunction pregunta-lista (?pregunta $?valores_posibles) 
        (format t "%s" ?pregunta)  
        (bind ?resposta (readline))  
        (bind ?res (str-explode ?resposta))   
        ?res
)


(deffunction pregunta-instancia (?pregunta ?instancia ?getter)
    (format t "%s" ?pregunta)
    (printout t crlf)
    (printout t crlf)
    (bind $?allInstances (find-all-instances((?inst ?instancia)) TRUE))
    (bind ?vectorInstancias (create$))
    (loop-for-count (?i 1 (length$ ?allInstances)) do
        (bind ?inst (nth$ ?i ?allInstances)) 
        (printout t (send ?inst ?getter) "(" ?i ")" crlf)
        (bind ?vectorInstancias (insert$ ?vectorInstancias ?i ?inst))
    )
    (printout t crlf)
    (printout t crlf)
    ?vectorInstancias 
)

(deffunction rellena-multislot (?lista ?vectorInstancias)
    (bind ?multislot (create$))
    (progn$ (?it ?lista)
        (bind ?multislot (insert$ ?multislot 1 (nth$ ?it ?vectorInstancias)))
    )
    ?multislot
)

(deffunction print-multislot (?mensaje ?multislot ?getter)
        (format t "%s" ?mensaje)
        (printout t crlf)
        (progn$ (?inst ?multislot)
                (printout t (send ?inst ?getter) crlf)
        )
        (printout t crlf)
)