; =============================================================================
; TEMPLATES 
; =============================================================================

(deftemplate Lector
        (slot nombre (type STRING) (default ?DERIVE))
        (slot edad (type INTEGER) (range 0 120) (default 0))
        (slot sexo (type SYMBOL) (allowed-values hombre mujer IND) (default IND))
        (slot estudios (type SYMBOL) (allowed-values No_graduado_escolar CFGS Bachillerato Universidad IND) (default IND))
)

(deftemplate Habitos
        (slot lugar (type SYMBOL) (allowed-values cama transporte_publico casa biblioteca IND) (default IND))
        (slot frecuencia (type SYMBOL) (allowed-values diario finde ocasionalmente cuando_se_puede IND) (default IND))
        (slot momento (type SYMBOL) (allowed-values manana mediodia tarde noche IND) (default IND))
        (slot tiempo (type INTEGER) (range 0 1440) (default 0))
)

(deftemplate Preferencias
        (multislot autores-preferidos (type INSTANCE) (allowed-classes Autor))
        (multislot autores-deseados (type INSTANCE) (allowed-classes Autor))
        (multislot generos-preferidos (type INSTANCE) (allowed-classes Genero))
        (multislot generos-deseados (type INSTANCE) (allowed-classes Genero))
        (multislot temas-preferidos (type INSTANCE) (allowed-classes Tema))
        (multislot temas-deseados (type INSTANCE) (allowed-classes Tema))
)

(deftemplate Prohibiciones
        (multislot autores-prohibidos (type INSTANCE) (allowed-classes Autor))
        (multislot generos-prohibidos (type INSTANCE) (allowed-classes Genero))
        (multislot temas-prohibidos (type INSTANCE) (allowed-classes Tema))
)

(deftemplate PreguntasRaras
        (slot seguir-criticos (type SYMBOL) (allowed-values si no IND) (default IND))
        (slot libro-raro (type SYMBOL) (allowed-values si no IND) (default IND))
)

(deftemplate Possibles
        (multislot autores-possibles (type INSTANCE) (allowed-classes Autor))
        (multislot generos-possibles (type INSTANCE) (allowed-classes Genero))
        (multislot temas-possibles (type INSTANCE) (allowed-classes Tema))
)
