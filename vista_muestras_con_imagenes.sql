DROP VIEW IF EXISTS vista_muestras_con_imagenes;

CREATE VIEW vista_muestras_con_imagenes AS
SELECT 
	DISTINCT
    e.catalogNumber,
    e.scientificName,
    d.descripcion,
    d.ubicacion_exacta_colecta,
    m.descripcion_metodo,
    i.url
FROM 
    Especimen e
JOIN 
    especimen_imagenes ON especimen_imagenes.ID_especimen = e.catalogNumber
JOIN 
    descripcion_colecta d ON e.catalogNumber = d.id_especie
JOIN 
    metodoDePrepacion m ON e.ID_metodo = m.ID_preparacion
JOIN
    IMAGENES i ON especimen_imagenes.id_foto = i.id_foto;

SELECT * FROM vista_muestras_con_imagenes;