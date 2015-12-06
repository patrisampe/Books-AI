(clear)
(load "../Libros.clp")
(reset)

(assert (Lector (nombre "Dorotea") (edad 88) (sexo mujer) (nacionalidad [libros_Class3]) (estudios No_graduado_escolar)))
(assert (Habitos (lugar casa) (frecuencia diario) (momento tarde) (tiempo 120)))
(assert 
	(Preferencias
		(autores-preferidos [Libros_Class28] [libros_Class69] [Libros_Class27])
		(generos-preferidos [Libros_Class14] [Libros_Class15] [libros_Class50])
		(temas-preferidos [Libros_Class31] [libros_Class38] [Libros_Class21] [libros_Class41])
	)
)
(assert
	(Prohibiciones
		(generos-prohibidos [libros_Class54] [libros_Class51])
		(temas-prohibidos [libros_Class68] [libros_Class39])
	)
)
(run)
