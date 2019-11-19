SELECT	peliculas.pelicula_id,
		tipos_cambio.tipo_cambio_id,
		tipos_cambio.cambio_usd * peliculas.precio_renta AS precio_mxn
FROM	peliculas,
 		tipos_cambio
WHERE 	tipos_cambio.codigo = 'MXN';

BEGIN
	INSERT INTO precio_peliculas_tipo_cambio (
		pelicula_id,
		tipo_cambio_id,
		precio_tipo_cambio,
		ultima_actualizacion
	)
	SELECT	NEW.pelicula_id,
		tipos_cambio.tipo_cambio_id,
		tipos_cambio.cambio_usd * NEW.precio_renta AS precio_tipo_cambio,
		CURRENT_TIMESTAMP
	FROM tipos_cambio
	WHERE 	tipos_cambio.codigo = 'MXN';
	RETURN NEW;
END

CREATE TRIGGER trigger_update_tipos_cambio
    AFTER INSERT OR UPDATE
    ON public.peliculas
    FOR EACH ROW
    EXECUTE PROCEDURE public.update_precio_tipo_cambio();