SELECT	ciudades.ciudad_id,
		ciudades.ciudad,
		COUNT(*) AS rentas_por_ciudad
FROM	ciudades
	INNER JOIN direcciones ON ciudades.ciudad_id = direcciones.ciudad_id
	INNER JOIN tiendas ON tiendas.direccion_id = direcciones.direccion_id
	INNER JOIN inventarios ON inventarios.tienda_id = tiendas.tienda_id
	INNER JOIN rentas ON inventarios.inventario_id = rentas.inventario_id
GROUP BY	ciudades.ciudad_id;