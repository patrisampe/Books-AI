(clear)
(load "../Libros.clp")
(reset)

(assert (Lector (nombre "Pablito") (edad 9) (sexo hombre) (nacionalidad [libros_Class3]) (estudios No_graduado_escolar)))
(assert (Habitos (lugar casa) (frecuencia diario) (momento tarde) (tiempo 30)))
(assert 
        (Preferencias
        		(autores-preferidos [Libros_Class10037])
        		(generos-preferidos [libros_Class46])
        		(temas-preferidos [libros_Class68] [libros_Class44] [libros_Class39])
        		(autores-deseados [Libros_Class10037])
        		(generos-deseados [libros_Class46])
        )
)
(assert
        (Prohibiciones
        )
)
(assert (PreguntasExtra (seguir-criticos si) (libro-desconocido no)))

(run)
