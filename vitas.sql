
--primera vista
CREATE VIEW vista_especimenes_familia AS
SELECT 
    e.catalogNumber AS id_especimen,
    e.scientificName,
    e.lifeStage,
    e.sex,
    e.individualCount,
    f.name_family AS familia
FROM 
    especimen e
JOIN 
    taxon_coleta tc ON e.catalogNumber = tc.especimen
JOIN 
    taxonomia t ON e.catalogNumber = t.id_especimen
JOIN 
    family f ON t.family = f.id_family;

-- segunda vista
CREATE VIEW recoleccion_noviembre_2024 AS
SELECT 
    e.event_date, 
    u.locality, 
    p.nombre AS nombre_persona, 
    es.catalogNumber, 
    es.scientificName, 
    es.sex, 
    t.kingdom, 
    t.phylum, 
    t.class, 
    t.order_taxonomia, 
    t.family, 
    t.genus, 
    t.specificEpithet
FROM Evento_de_Coleccion e
INNER JOIN Ubicacion u ON e.ID_Ubicacion = u.ID_Ubicacion
INNER JOIN info_recoleccion ir ON e.ID_Evento_Recoleccion = ir.evento
INNER JOIN taxon_coleta tc ON ir.id_recoleccion = tc.id_recoleccion
INNER JOIN Especimen es ON tc.especimen = es.catalogNumber
INNER JOIN taxonomia t ON es.catalogNumber = t.id_especimen
INNER JOIN participacion_recoleccion pr ON ir.id_recoleccion = pr.id_recoleccion
INNER JOIN trabajador tbr ON pr.id_trabajador = tbr.id_trabajador
INNER JOIN persona p ON tbr.id_persona = p.id_persona
WHERE e.event_date BETWEEN '2024-11-01' AND '2024-11-30';