SELECT	date_part('year', rentas.fecha_renta) AS anio,
		date_part('month', rentas.fecha_renta) AS mes,
		peliculas.titulo,
		count(*) AS numero_rentas
FROM	rentas
	INNER JOIN	inventarios ON rentas.inventario_id = inventarios.inventario_id
	INNER JOIN	peliculas ON peliculas.pelicula_id	= inventarios.pelicula_id
GROUP BY anio, mes, peliculas.pelicula_id;

SELECT	date_part('year', rentas.fecha_renta) AS anio,
		date_part('month', rentas.fecha_renta) AS mes,
		count(*) AS numero_rentas
FROM	rentas
GROUP BY anio, mes;