(clear)
(load "../Libros.clp")
(reset)

(assert (Lector (nombre "Juan Joven") (edad 15) (sexo hombre) (nacionalidad [libros_Class3]) (estudios No_graduado_escolar)))
(assert (Habitos (lugar cama) (frecuencia diario) (momento tarde) (tiempo 60)))
(assert 
	(Preferencias
		(autores-preferidos [Libros_Class10051] [Libros_Class10054] [Libros_Class10056] [libros_Class58])
		(generos-preferidos [libros_Class53])
		(temas-preferidos [libros_Class38])
	)
)
(assert
	(Prohibiciones
		(autores-prohibidos [Libros_Class10063])
		(temas-prohibidos [libros_Class39])
	)
)
(assert (PreguntasExtra (seguir-criticos si) (libro-desconocido si)))
(run)
