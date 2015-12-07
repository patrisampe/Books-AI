(clear)
(load "../Libros.clp")
(reset)

(assert (Lector (nombre "Pablito") (edad 9) (sexo hombre) (nacionalidad [libros_Class3]) (estudios No_graduado_escolar)))
(assert (Habitos (lugar casa) (frecuencia finde) (momento tarde) (tiempo 30)))
(assert 
        (Preferencias
                (generos-deseados [libros_Class46])
                (temas-deseados [Libros_Class31])
        )
)
(assert
        (Prohibiciones
                (generos-prohibidos [libros_Class54])
                (temas-prohibidos [libros_Class68] [libros_Class44] [libros_Class39])
        )
)
(assert (PreguntasExtra (seguir-criticos si) (libro-desconocido no)))

(run)
