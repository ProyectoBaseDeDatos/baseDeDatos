DROP VIEW IF EXISTS imagenes_especimen;
CREATE VIEW imagenes_especimen AS
SELECT
    DISTINCT i.url,
        e.catalogNumber,
        e.scientificName,
        e.lifeStage,
        e.sex,
        e.individualCount,
        e.estado
FROM
    Especimen,
	especimen_imagenes
JOIN
    IMAGENES i ON especimen_imagenes.id_foto = i.id_foto
JOIN
    Especimen e ON especimen_imagenes.ID_especimen = e.catalogNumber;
SELECT * FROM imagenes_especimen;