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
